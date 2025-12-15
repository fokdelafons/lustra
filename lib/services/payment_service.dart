import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'dart:developer' as developer;

const String _kTipTier1 = 'tip_tier1';
const String _kTipTier2 = 'tip_tier2';
const String _kTipTier3 = 'tip_tier3';
const String _kTipTier4 = 'tip_tier4';
const String _kTipTier5 = 'tip_tier5';

const List<String> _kProductIds = <String>[
  _kTipTier1,
  _kTipTier2,
  _kTipTier3,
  _kTipTier4,
  _kTipTier5,
];

class PaymentService with ChangeNotifier {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  
  // ZMIANA: Usunięto 'late', dodano '?' (nullable)
  StreamSubscription<List<PurchaseDetails>>? _subscription;
  
  bool _isAvailable = false;
  bool get isAvailable => _isAvailable;
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<ProductDetails> _products = <ProductDetails>[];
  List<ProductDetails> get products => _products;
  bool _isDisposed = false;

  PaymentService() {
    if (kIsWeb) {
      _isAvailable = false;
      _isLoading = false;
      return;
    }
    
    final Stream<List<PurchaseDetails>> purchaseUpdated = _inAppPurchase.purchaseStream;
    _subscription = purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription?.cancel();
    }, onError: (Object error) {
      // Obsługa błędu
    });
    initialize();
  }

  Future<void> initialize() async {
    if (kIsWeb) return;
    _isAvailable = await _inAppPurchase.isAvailable();
    if (_isAvailable) {
      await _getProducts();
    }
    _isLoading = false;
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  Future<void> _getProducts() async {
    if (kIsWeb) return;
    final ProductDetailsResponse response = await _inAppPurchase.queryProductDetails(_kProductIds.toSet());
    if (response.error == null) {
      response.productDetails.sort((a, b) => a.rawPrice.compareTo(b.rawPrice));
      _products = response.productDetails;
    } else {
      developer.log('Błąd pobierania produktów: ${response.error!.message}', name: 'PaymentService');
    }
  }

  void buy(ProductDetails product) {
    if (kIsWeb) return;
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // Czekamy
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          developer.log('Błąd zakupu: ${purchaseDetails.error!}', name: 'PaymentService');
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
                   purchaseDetails.status == PurchaseStatus.restored) {
          developer.log('Zakup udany!', name: 'PaymentService');
        }
        if (purchaseDetails.pendingCompletePurchase) {
          _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    // ZMIANA: Bezpieczne anulowanie (tylko jeśli istnieje)
    _subscription?.cancel();
    super.dispose();
  }
}