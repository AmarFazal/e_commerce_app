import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'tr': {
      'app_name': 'ShopEase',
      'welcome': 'Hoş Geldiniz',
      'login': 'Giriş Yap',
      'register': 'Kayıt Ol',
      'email': 'E-posta',
      'password': 'Şifre',
      'forgot_password': 'Şifremi Unuttum',
      'name': 'Ad',
      'phone': 'Telefon',
      'confirm_password': 'Şifre Tekrar',
      'already_have_account': 'Zaten hesabınız var mı?',
      'dont_have_account': 'Hesabınız yok mu?',
      'home': 'Ana Sayfa',
      'categories': 'Kategoriler',
      'cart': 'Sepet',
      'profile': 'Profil',
      'search': 'Ara',
      'featured': 'Öne Çıkanlar',
      'new_arrivals': 'Yeni Gelenler',
      'categories_title': 'Kategoriler',
      'see_all': 'Tümünü Gör',
      'add_to_cart': 'Sepete Ekle',
      'buy_now': 'Şimdi Satın Al',
      'price': 'Fiyat',
      'description': 'Açıklama',
      'specifications': 'Özellikler',
      'reviews': 'Yorumlar',
      'rating': 'Değerlendirme',
      'stock': 'Stok',
      'in_stock': 'Stokta Var',
      'out_of_stock': 'Stokta Yok',
      'select_color': 'Renk Seç',
      'select_size': 'Beden Seç',
      'quantity': 'Adet',
      'total': 'Toplam',
      'checkout': 'Ödeme',
      'shipping_address': 'Teslimat Adresi',
      'payment_method': 'Ödeme Yöntemi',
      'order_summary': 'Sipariş Özeti',
      'subtotal': 'Ara Toplam',
      'shipping': 'Kargo',
      'tax': 'Vergi',
      'total_price': 'Toplam Fiyat',
      'place_order': 'Siparişi Tamamla',
      'empty_cart': 'Sepetiniz Boş',
      'empty_cart_message': 'Sepetinize henüz ürün eklemediniz',
      'continue_shopping': 'Alışverişe Devam Et',
      'remove': 'Kaldır',
      'favorites': 'Favoriler',
      'settings': 'Ayarlar',
      'dark_mode': 'Karanlık Mod',
      'light_mode': 'Aydınlık Mod',
      'language': 'Dil',
      'turkish': 'Türkçe',
      'english': 'İngilizce',
      'logout': 'Çıkış Yap',
      'my_orders': 'Siparişlerim',
      'addresses': 'Adresler',
      'save': 'Kaydet',
      'cancel': 'İptal',
      'edit': 'Düzenle',
      'delete': 'Sil',
      'discount': 'İndirim',
      'new': 'Yeni',
      'free_shipping': 'Ücretsiz Kargo',
      'fast_delivery': 'Hızlı Teslimat',
      'secure_payment': 'Güvenli Ödeme',
    },
    'en': {
      'app_name': 'ShopEase',
      'welcome': 'Welcome',
      'login': 'Login',
      'register': 'Register',
      'email': 'Email',
      'password': 'Password',
      'forgot_password': 'Forgot Password',
      'name': 'Name',
      'phone': 'Phone',
      'confirm_password': 'Confirm Password',
      'already_have_account': 'Already have an account?',
      'dont_have_account': "Don't have an account?",
      'home': 'Home',
      'categories': 'Categories',
      'cart': 'Cart',
      'profile': 'Profile',
      'search': 'Search',
      'featured': 'Featured',
      'new_arrivals': 'New Arrivals',
      'categories_title': 'Categories',
      'see_all': 'See All',
      'add_to_cart': 'Add to Cart',
      'buy_now': 'Buy Now',
      'price': 'Price',
      'description': 'Description',
      'specifications': 'Specifications',
      'reviews': 'Reviews',
      'rating': 'Rating',
      'stock': 'Stock',
      'in_stock': 'In Stock',
      'out_of_stock': 'Out of Stock',
      'select_color': 'Select Color',
      'select_size': 'Select Size',
      'quantity': 'Quantity',
      'total': 'Total',
      'checkout': 'Checkout',
      'shipping_address': 'Shipping Address',
      'payment_method': 'Payment Method',
      'order_summary': 'Order Summary',
      'subtotal': 'Subtotal',
      'shipping': 'Shipping',
      'tax': 'Tax',
      'total_price': 'Total Price',
      'place_order': 'Place Order',
      'empty_cart': 'Empty Cart',
      'empty_cart_message': 'You haven\'t added any items to your cart yet',
      'continue_shopping': 'Continue Shopping',
      'remove': 'Remove',
      'favorites': 'Favorites',
      'settings': 'Settings',
      'dark_mode': 'Dark Mode',
      'light_mode': 'Light Mode',
      'language': 'Language',
      'turkish': 'Turkish',
      'english': 'English',
      'logout': 'Logout',
      'my_orders': 'My Orders',
      'addresses': 'Addresses',
      'save': 'Save',
      'cancel': 'Cancel',
      'edit': 'Edit',
      'delete': 'Delete',
      'discount': 'Discount',
      'new': 'New',
      'free_shipping': 'Free Shipping',
      'fast_delivery': 'Fast Delivery',
      'secure_payment': 'Secure Payment',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  String get appName => translate('app_name');
  String get welcome => translate('welcome');
  String get login => translate('login');
  String get register => translate('register');
  String get email => translate('email');
  String get password => translate('password');
  String get forgotPassword => translate('forgot_password');
  String get name => translate('name');
  String get phone => translate('phone');
  String get confirmPassword => translate('confirm_password');
  String get alreadyHaveAccount => translate('already_have_account');
  String get dontHaveAccount => translate('dont_have_account');
  String get home => translate('home');
  String get categories => translate('categories');
  String get cart => translate('cart');
  String get profile => translate('profile');
  String get search => translate('search');
  String get featured => translate('featured');
  String get newArrivals => translate('new_arrivals');
  String get categoriesTitle => translate('categories_title');
  String get seeAll => translate('see_all');
  String get addToCart => translate('add_to_cart');
  String get buyNow => translate('buy_now');
  String get price => translate('price');
  String get description => translate('description');
  String get specifications => translate('specifications');
  String get reviews => translate('reviews');
  String get rating => translate('rating');
  String get stock => translate('stock');
  String get inStock => translate('in_stock');
  String get outOfStock => translate('out_of_stock');
  String get selectColor => translate('select_color');
  String get selectSize => translate('select_size');
  String get quantity => translate('quantity');
  String get total => translate('total');
  String get checkout => translate('checkout');
  String get shippingAddress => translate('shipping_address');
  String get paymentMethod => translate('payment_method');
  String get orderSummary => translate('order_summary');
  String get subtotal => translate('subtotal');
  String get shipping => translate('shipping');
  String get tax => translate('tax');
  String get totalPrice => translate('total_price');
  String get placeOrder => translate('place_order');
  String get emptyCart => translate('empty_cart');
  String get emptyCartMessage => translate('empty_cart_message');
  String get continueShopping => translate('continue_shopping');
  String get remove => translate('remove');
  String get favorites => translate('favorites');
  String get settings => translate('settings');
  String get darkMode => translate('dark_mode');
  String get lightMode => translate('light_mode');
  String get language => translate('language');
  String get turkish => translate('turkish');
  String get english => translate('english');
  String get logout => translate('logout');
  String get myOrders => translate('my_orders');
  String get addresses => translate('addresses');
  String get save => translate('save');
  String get cancel => translate('cancel');
  String get edit => translate('edit');
  String get delete => translate('delete');
  String get discount => translate('discount');
  String get newLabel => translate('new');
  String get freeShipping => translate('free_shipping');
  String get fastDelivery => translate('fast_delivery');
  String get securePayment => translate('secure_payment');
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['tr', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

