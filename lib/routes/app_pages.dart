import 'package:get/get.dart';
import 'app_routes.dart';

import '../modules/profile/bindings/chat_binding.dart';
import '../modules/profile/bindings/customer_service_binding.dart';
import '../modules/profile/bindings/help_faq_binding.dart';
import '../modules/profile/bindings/home_binding.dart';

import '../modules/profile/views/home_screen/home.dart';
import '../modules/profile/views/chat_screen/chat_screen.dart';
import '../modules/profile/views/customer_service_screen/customer_service_screen.dart';
import '../modules/profile/views/help_faqs_screen/help_faqs_screen.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.FAQ,
      page: () => const FaqScreen(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: Routes.CUSTOMER_SERVICE,
      page: () => const CustomerServiceScreen(),
      binding: CustomerServiceBinding(),
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => const ChatScreen(),
      binding: ChatBinding(),
    ),
  ];
}
