# Audyt warstwy serwisowej Lustra

Data audytu: 2026-05-15

Zakres: `lib/services`, powiązane providery, routing i inicjalizacja aplikacji.

Cel: identyfikacja krytycznych błędów, ryzyk bezpieczeństwa, prywatności, spójności danych oraz problemów architektonicznych.

---

## Pliki objęte analizą

- `lib/services/api_service.dart`
- `lib/services/firebase_auth.dart`
- `lib/services/parliament_manager.dart`
- `lib/services/parliament_service_interface.dart`
- `lib/services/cache/cache_service.dart`
- `lib/services/cache/parliament_cache_manager.dart`
- `lib/services/tracking_service.dart`
- `lib/services/voting_service.dart`
- `lib/services/curated_list_service.dart`
- `lib/services/notification_service.dart`
- `lib/services/payment_service.dart`
- `lib/services/remote_config_service.dart`
- `lib/services/countries/pl_parliament_service.dart`
- `lib/services/countries/us_parliament_service.dart`
- `lib/providers/user_provider.dart`
- `lib/providers/interaction_provider.dart`
- `lib/services/app_router.dart`
- `lib/main.dart`

---

## Skala ważności

- **P0 / krytyczne** — możliwy crash, wyciek danych, privilege escalation, istotny błąd bezpieczeństwa lub płatności.
- **P1 / wysokie** — awarie produkcyjne, niespójność danych, fail-open, poważne problemy UX/security.
- **P2 / średnie** — problemy architektoniczne, race conditions, cache invalidation, utrzymanie.
- **P3 / niskie** — porządki, naming, czytelność, optymalizacja.

---

# Executive summary

Najważniejsze problemy do pilnej obsługi:

1. **Możliwy crash startowy przez `late _activeService` w `ParliamentManager`.** Provider może odczytać `activeService` zanim async `_initialize()` je ustawi.
2. **`PaymentService` kończy purchase bez server-side receipt validation.** Krytyczne, jeśli płatności wpływają na uprawnienia lub księgowanie.
3. **Prywatne dane w `SharedPreferences`.** Profile, głosy i listy użytkownika są cache’owane nieszyfrowanie i bez prawidłowego namespace per user.
4. **Błędy często są połykane i zamieniane na puste dane.** Awaria wygląda jak brak danych.
5. **Serwisy domenowe zależą od `BuildContext`.** Silne sprzężenie UI z warstwą usługową utrudnia testy i stabilność.

---

# P0 / krytyczne

## 1. Możliwy crash startowy przez `late _activeService` w `ParliamentManager`

**Pliki:** `lib/services/parliament_manager.dart`, `lib/main.dart`

W `ParliamentManager` pole `late ParliamentServiceInterface _activeService` jest ustawiane dopiero w asynchronicznym `_initialize()`, po `await SharedPreferences.getInstance()`.

Jednocześnie `main.dart` ma provider, który może odczytać `context.read<ParliamentManager>().activeService` zanim `_activeService` zostanie ustawione.

**Efekt:**

- `LateInitializationError`.
- Crash przy cold start.
- Błąd zależny od timingów, trudny do reprodukcji.

**Rekomendacja:**

- Nie odczytywać `activeService`, dopóki manager nie jest zainicjalizowany.
- Ustawić bezpieczny default synchronicznie przed pierwszym `await`.
- Albo zrobić `_activeService` nullable i wymusić obsługę loading state.
- Rozważyć `FutureProvider`/bootstrap zamiast async inicjalizacji w konstruktorze.
---

## 2. `PaymentService` kończy zakup bez walidacji paragonu

**Plik:** `lib/services/payment_service.dart`

`PaymentService` traktuje `PurchaseStatus.purchased` jako zakup udany i wykonuje `completePurchase()`, ale nie ma server-side receipt validation.

**Ryzyko:**

- Fake/replayed purchase.
- Brak idempotencji transakcji.
- Brak wiarygodnego księgowania.

**Rekomendacja:**

- Wysyłać purchase token/receipt do backendu.
- Backend waliduje transakcję u Apple/Google.
- Dopiero po walidacji oznaczać zakup jako dostarczony.

---

# P1 / wysokie ryzyko

## 3. App Check token cache oparty na ręcznym TTL 20 min

**Plik:** `lib/services/api_service.dart`

TTL jest ustawiany ręcznie na 20 min, bez realnego expiry tokena.

**Rekomendacja:** przy błędzie App Check/403 wymusić refresh tokena i retry raz.

---

## 4. Cache danych prywatnych w `SharedPreferences`

**Pliki:** `cache_service.dart`, `parliament_cache_manager.dart`, `user_provider.dart`, `interaction_provider.dart`

W `SharedPreferences` trzymane są profil, głosy, obserwowane projekty, listy itd. Storage nie jest bezpieczny dla danych prywatnych.

**Rekomendacja:** dane prywatne cache’ować per UID z krótkim TTL albo przenieść do secure storage / nie cache’ować.

---

# P2 / średnie ryzyko i architektura

## 5. Serwisy domenowe zależą od `BuildContext`

**Pliki:** `parliament_service_interface.dart`, `pl_parliament_service.dart`, `us_parliament_service.dart`

Metody serwisowe przyjmują `BuildContext` do pobierania języka, lokalizacji oraz czasem wykonywania efektów UI.

**Problem:** warstwa serwisowa jest sprzęgnięta z UI, co utrudnia testowanie, reużycie i kontrolę `mounted` po operacjach async.

**Rekomendacja:** przekazywać `langCode`, `term`, `prefix` jako parametry, a lokalizację/nawigację zostawić warstwie UI.

---

## 6. UI side effects w serwisach

**Pliki:** `pl_parliament_service.dart`, `us_parliament_service.dart`

Przykłady: snackbar, `launchUrl`, `smartNavigate` w callbackach zwracanych przez serwis.

**Rekomendacja:** serwis powinien zwracać dane/URL/akcję domenową; UI powinien wykonywać efekty.

---

## 7. `NotificationService` może zostawić listener na `ParliamentManager`

**Plik:** `lib/services/notification_service.dart`

Jeśli manager nigdy nie osiągnie `isReady && currentTerm != null`, listener dodany w `_handleNavigation()` może zostać na stałe.

**Rekomendacja:** timeout, kolejka pending notification, zdejmowanie listenera przy niepowodzeniu.

---

## 8. Routing ma potencjalny open/internal redirect przez query `go`

**Plik:** `lib/services/app_router.dart`

`redirect` bez allowlisty zwraca `goTarget` z query.

**Rekomendacja:** allowlista ścieżek, wymóg lokalnej ścieżki zaczynającej się od `/`, ignorowanie po pierwszym redirect.

---

## 9. Cache key nie normalizuje list filtrów

**Plik:** `lib/services/cache/parliament_cache_manager.dart`

`types?.join(',')` daje różne klucze dla tej samej logicznie listy w innej kolejności.

**Rekomendacja:** sortować filtry przed generowaniem klucza.

---

## 10. Brak globalnego limitu rozmiaru cache

**Pliki:** `cache_service.dart`, `parliament_cache_manager.dart`

Jest czyszczenie po czasie, ale brak limitu liczby wpisów/rozmiaru.

**Rekomendacja:** limit per prefix, limit bajtów albo przejście z `SharedPreferences` na bardziej odpowiedni storage dla dużych danych.

---

## 11. `changeTerm()` zmienia `_currentTerm` przed potwierdzeniem backendu

**Pliki:** `pl_parliament_service.dart`, `us_parliament_service.dart`

Jeśli backend failnie, aplikacja zostaje na nowej kadencji z pustymi/nieaktualnymi metadata.

**Rekomendacja:** rollback do poprzedniej kadencji albo jawny degraded state.

---

## 12. `ParliamentManager._initialize()` ustawia `_isReady = true` nawet po błędzie init serwisu

**Plik:** `lib/services/parliament_manager.dart`

`isReady` może znaczyć “gotowy” mimo że `_activeService.initialize()` rzuciło błąd.

**Rekomendacja:** rozdzielić `isInitialized`, `isReady`, `hasError`, `hasUsableCachedData`.

---

## 13. `TrackingService` i `InteractionProvider` używają tego samego cache API dla różnych struktur

**Pliki:** `tracking_service.dart`, `interaction_provider.dart`, `parliament_cache_manager.dart`

`TrackingService` oczekuje `legislations/civic`, a `InteractionProvider` zapisuje `trackedBills/trackedCivic/votes` pod podobnymi metodami cache.

**Rekomendacja:** rozdzielić metody na `getTrackedFeed/saveTrackedFeed` oraz `getUserInteractionSnapshot/saveUserInteractionSnapshot`.

---

## 14. `CuratedListService.toggleSubscription()` nie invaliduje lokalnego cache/profilu

**Plik:** `lib/services/curated_list_service.dart`

Po subskrypcji lista/profil użytkownika mogą pozostać w starym stanie.

**Rekomendacja:** po sukcesie invalidować profil użytkownika lub jawnie zaktualizować `UserProvider`, a także cache związany z listami.

---

## 15. `CuratedListService.updateListMeta/deleteList/setHighlightedBill` nie czyszczą cache

**Plik:** `lib/services/curated_list_service.dart`

Mutacje list kuratorskich nie czyszczą spójnie `myCuratedLists`, feedu, preview ani batch preview.

**Rekomendacja:** po każdej mutacji listy czyścić wszystkie powiązane cache i oznaczyć lokalny update stamp.

---

## 16. `getFeed()` cache’uje potencjalnie user-specific dane bez UID

**Plik:** `lib/services/curated_list_service.dart`

Klucz curated feed nie zawiera UID. Jeśli backend zwraca pola takie jak `isOwner`, `isSubscribed`, `canEdit`, dane mogą przeciekać między użytkownikami.

**Rekomendacja:** sprawdzić kontrakt backendu. Publiczny feed cache globalny, user-specific metadata per UID albo bez cache.

---

## 17. `NotificationService.syncPermissionsWithBackend()` może prosić o permission bez intencji użytkownika

**Plik:** `lib/services/notification_service.dart`

Przy `AuthorizationStatus.notDetermined` metoda wywołuje `requestPermission()`.

**Rekomendacja:** permission prompt tylko po świadomej akcji użytkownika w UI. Sync powinien tylko odczytywać stan.

---

## 18. `NotificationService._handleNavigation()` może użyć terminu z niewłaściwego parlamentu

**Plik:** `lib/services/notification_service.dart`

Dla powiadomień dotyczących innego parlamentu kod używa `pManager.currentTerm`, czyli terminu aktywnego serwisu, niekoniecznie parlamentu z payloadu.

**Rekomendacja:** payload powiadomienia powinien zawsze zawierać `parliamentId` i `term`. Nie wyliczać terminu z aktualnego managera, jeśli powiadomienie dotyczy innego parlamentu.

---

## 19. `RemoteConfigService.initialize()` nie ustawia `minimumFetchInterval` i `fetchTimeout`

**Plik:** `lib/services/remote_config_service.dart`

Brakuje jawnego `setConfigSettings`.

**Rekomendacja:** ustawić produkcyjny `minimumFetchInterval` i `fetchTimeout`, szczególnie dla forced update.

---

## 20. Forced update działa tylko non-web

**Plik:** `lib/main.dart`

`ForceUpdateScreen` jest pomijany dla web.

**Rekomendacja:** jeśli web/PWA jest istotny produkcyjnie, dodać osobną strategię wymuszania reload/upgrade.

---

## 21. Błędy są często połykane i zamieniane na puste dane

**Przykłady:** `TrackingService`, `CuratedListService`, `AuthService`, `getMPDetails`.

**Efekt:** awaria wygląda jak brak danych.

**Rekomendacja:** wprowadzić rozróżnienie: empty data, loading, offline fallback, error. Dobry kierunek: sealed `AsyncState<T>`.

---

## 22. Search nie obsługuje paginacji mimo parametrów `limit/offset`

**Pliki:** `pl_parliament_service.dart`, `us_parliament_service.dart`

Search zawsze używa `offset = 0`, `limit = 50` i zwraca `nextCursor: null`.

**Rekomendacja:** albo jawnie oznaczyć search jako jednorazowe top 50, albo zaimplementować paginację.

---

## 23. `getLegislationDetails()` cache key nie zawiera `documentType`

**Plik:** `parliament_cache_manager.dart`

Cache details jest po `id` i `lang`, ale nie po `documentType`. Jeśli `bill` i `civic` mogą mieć kolidujące ID, cache może zwrócić zły typ.

**Rekomendacja:** dodać typ dokumentu do cache key.

---

## 24. `getMPDetails()` i `getMPData()` mają rozbieżne ścieżki cache/API

**Pliki:** `pl_parliament_service.dart`, `us_parliament_service.dart`

`getMPData()` używa cache i `*_getDeputyDetails`, a `getMPDetails()` używa `*_getDetails` bez cache. Może prowadzić do niespójnych danych.

**Rekomendacja:** ujednolicić kontrakt i cache strategy.

---

## 25. `ParliamentManager.availableServices` tworzy nowe instancje serwisów

**Plik:** `parliament_manager.dart`

Getter zwraca nowe obiekty za każdym razem.

**Ryzyko:** jeśli widget oczekuje stabilnych referencji albo serwis ma stan, może to powodować niespójność.

**Rekomendacja:** dla listy dostępnych źródeł używać lekkiego modelu metadata, nie instancji serwisów.

---

## 26. `ParliamentManager.changeSource()` zapisuje nowy source przed udaną inicjalizacją

**Plik:** `parliament_manager.dart`

`_activeServiceId` i prefs są aktualizowane przed sukcesem `_activeService.initialize()`.

**Efekt:** przy błędzie init aplikacja może zapamiętać niedziałające źródło.

**Rekomendacja:** zapisywać prefs po sukcesie init albo przechowywać pending source.

---

## 27. `VotingService` zapisuje optimistic counters bez user/context namespace

**Plik:** `voting_service.dart`

Klucz zależy od `targetType_targetId`, ale nie od użytkownika/parlamentu.

**Ryzyko:** na współdzielonym urządzeniu optimistic state może przejść między kontami, a przy kolizji ID między parlamentami może zostać źle użyty.

**Rekomendacja:** dodać prefix parlamentu i UID albo przynajmniej prefix parlamentu.

---

## 28. Brak globalnego error boundary / Crashlytics wiring w analizowanych plikach

**Plik:** `main.dart`

Nie widać `FlutterError.onError`, `PlatformDispatcher.instance.onError`, ani custom `ErrorWidget.builder`.

**Rekomendacja:** dodać global capture i raportowanie błędów krytycznych.
