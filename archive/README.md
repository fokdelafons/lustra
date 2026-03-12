🏛️ The Great Archive (System "Lustra Indexer")
Wersja: 1.0 (Production Ready)
Status: Operational
Stack: Node.js 22, Docker, Google Cloud Run Jobs, Firestore, GCS.
System generowania statycznych stron (SSG) dla projektu Lustra. Służy do masowej archiwizacji legislacji w formacie HTML dla celów SEO, Deep Linkingu i "Hybrid Serving".
📂 Struktura Projektu (File System)
code
Text
/great_archive
│
├── Dockerfile                  # Konfiguracja obrazu (Node 22-alpine, optimized)
├── package.json                # Zależności: firebase-admin, ejs, fs-extra, xmlbuilder2, date-fns
├── .dockerignore               # Ignorowanie node_modules i kluczy lokalnych
│
├── src
│   ├── index.js                # [ORCHESTRATOR] Główna pętla logiczna (Main Loop)
│   ├── config.js               # [CONTROL TOWER] Konfiguracja, limity, strategie SEO
│   │
│   ├── services
│   │   ├── firestore.js        # [SCANNER] Skanowanie delty i pobieranie danych (Read/Write)
│   │   ├── generator.js        # [BUILDER] Renderowanie HTML, mapowanie danych, obsługa metadanych
│   │   ├── sitemap.js          # [SEO] Generowanie map XML wg polityki "Drip Feed"
│   │   └── storage.js          # [WAREHOUSE] Obsługa GCS Bucket i pliku Catalog.json
│   │
│   ├── templates
│   │   ├── bill.ejs            # [VIEW] Szablon Ustawy (Schema.org, Hemicycle Chart, i18n)
│   │   └── hub.ejs             # [VIEW] Szablon Listy Kadencji (Pagination)
│   │
│   └── utils
│       ├── url-builder.js      # [ROUTING] Centralna logika budowania linków (Trailing Slash logic)
│       └── translations.js     # [I18N] Słownik tłumaczeń interfejsu (8 języków)
⚙️ Konfiguracja i Strategia (src/config.js)
System jest sterowany przez plik konfiguracyjny, który pozwala na zmianę zachowania bez edycji kodu logicznego.
Kluczowe parametry:
BATCH_LIMIT: Bezpiecznik. Określa ile dokumentów przetwarzamy w jednym rzucie (np. 5000).
DRY_RUN: Tryb symulacji (true = brak zapisu na serwerze).
SITEMAP_POLICY: Strategia "Kroplówki" (Drip Feed) dla Google.
allowedTerms: Tablica kadencji widocznych w sitemapie (np. ['119']).
allowedLanguages: Tablica języków widocznych w sitemapie (np. ['en']).
(Uwaga: Pliki HTML generowane są zawsze dla wszystkich, polityka dotyczy tylko pliku XML).
🔄 Przepływ Danych (Pipeline)
Proces uruchamiany przez src/index.js:
Initialization: Czyszczenie katalogu tymczasowego /tmp/dist.
Load State: Pobranie meta/catalog-us.json z Bucketa.
Delta Scan:
Pobranie ID dokumentów z Firestore (isValid == true).
Porównanie dat: lastUpdated vs htmlGeneratedAt.
Selekcja tylko nowych/zmienionych rekordów.
Batch Fetch: Pobranie pełnych danych (JSON) dla zidentyfikowanych celów.
Generation Phase:
Renderowanie HTML dla każdego języka (bill.ejs).
Aktualizacja pamięci podręcznej (katalogu w pamięci).
Hub Generation:
Grupowanie katalogu po kadencjach (term).
Generowanie paginowanych list (index.html, page-2.html) dla każdej grupy.
Sitemap Generation:
Tworzenie plików XML zgodnie z SITEMAP_POLICY.
Synchronization:
Masowy upload plików HTML/XML na Bucket.
Zapis zaktualizowanego catalog-us.json (Cache-Control: no-cache).
Commit:
Oznaczenie dokumentów w Firestore flagą htmlGeneratedAt (zapobiega pętlom).
🌍 Schemat URL
System wymusza strukturę folderów z ukośnikiem końcowym (Trailing Slash) dla kompatybilności z GCS.
Ustawa: https://lustra.news/{lang}/{institution}/{term}/{type}/{id}/
Hub (Index): https://lustra.news/{lang}/{institution}/{term}/
Deep Link: https://lustra.news/#/{lang}/{institution}/{term}/{type}/{id}
🛠️ Instrukcja Operacyjna (Deploy & Run)
1. Wdrożenie zmian (Deploy)
Buduje kontener w chmurze i aktualizuje definicję Joba. Używać po każdej zmianie w kodzie lub szablonie.
code
Cmd
gcloud beta run jobs deploy great-archive-job --source . --region europe-west9 --set-env-vars BATCH_LIMIT=5000,DRY_RUN=false,BUCKET_NAME=lustra-web-prod --max-retries 0 --task-timeout 60m
2. Uruchomienie (Execute)
Rozpoczyna proces przetwarzania.
code
Cmd
gcloud run jobs execute great-archive-job --region europe-west9
3. Resetowanie Stanu (Troubleshooting)
Wymuszenie przebudowy jednej ustawy: Wejdź do Firebase Console i usuń pole htmlGeneratedAt w wybranym dokumencie.
Wymuszenie przebudowy Hubów/Sitemap: Usuń plik meta/catalog-us.json z Bucketa. Następny run odtworzy strukturę katalogu.
Zmiana strategii SEO: Edytuj config.js -> SITEMAP_POLICY, zrób Deploy i Execute.
📝 Funkcjonalności Szablonu (bill.ejs)
Dynamiczne SEO: Schema.org (Legislation, FAQPage, Breadcrumbs) dostosowane do języka i kraju.
Wizualizacja: Dynamiczny wykres Hemicycle (generowany w JS na podstawie danych wstrzykniętych przez EJS).
Inteligentne Ukrywanie: Sekcje bez danych (np. brak głosowania, brak linku do PDF) nie są renderowane.
Manifest Danych: Komentarz HTML zawierający metadane o modelu AI i źródle (Lustra Intelligence Protocol).
Nawigacja: Link powrotny do Indeksu Kadencji.
Dokumentacja wygenerowana przez System Tarcza. Stan na: Styczeń 2026.