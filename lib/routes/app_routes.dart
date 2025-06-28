abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const FAQ = _Paths.FAQ;
  static const CUSTOMER_SERVICE = _Paths.CUSTOMER_SERVICE;
  static const CHAT = _Paths.CHAT;
}

abstract class _Paths {
  _Paths._();

  static const HOME = '/home';
  static const FAQ = '/faq';
  static const CUSTOMER_SERVICE = '/customer-service';
  static const CHAT = '/chat';
}
