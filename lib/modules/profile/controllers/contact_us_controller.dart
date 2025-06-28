import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/models/contact_model.dart';

class ContactUsController extends GetxController {
  final List<ContactMethod> contactMethods = [
    ContactMethod(
      id: 'customer_service',
      title: AppStrings.customerServiceTitle,
      icon: 'assets/icons/customer_service.png',
      description: AppStrings.customerServiceDescription,
      details: AppStrings.customerServiceDetails,
      action: ContactAction.phone,
      value: '+1-555-123-4567',
    ),
    ContactMethod(
      id: 'website',
      title: AppStrings.websiteTitle,
      icon: 'assets/icons/website.png',
      description: AppStrings.websiteDescription,
      details: AppStrings.websiteDetails,
      action: ContactAction.url,
      value: 'https://flutter.dev',
    ),
    ContactMethod(
      id: 'facebook',
      title: AppStrings.facebookTitle,
      icon: 'assets/icons/facebook.png',
      description: AppStrings.facebookDescription,
      details: AppStrings.facebookDetails,
      action: ContactAction.url,
      value: 'https://www.facebook.com/flutterdev',
    ),
    ContactMethod(
      id: 'whatsapp',
      title: AppStrings.whatsappTitle,
      icon: 'assets/icons/whatsapp.png',
      description: AppStrings.whatsappDescription,
      details: AppStrings.whatsappDetails,
      action: ContactAction.whatsapp,
      value: '+1234567890',
    ),
    ContactMethod(
      id: 'instagram',
      title: AppStrings.instagramTitle,
      icon: 'assets/icons/instagram.png',
      description: AppStrings.instagramDescription,
      details: AppStrings.instagramDetails,
      action: ContactAction.url,
      value: 'https://www.instagram.com/flutterdev/',
    ),
  ];

  Future<void> handleContactAction(ContactMethod method) async {
    try {
      String url;
      switch (method.action) {
        case ContactAction.phone:
          url = 'tel:${method.value}';
          break;
        case ContactAction.email:
          url = 'mailto:${method.value}';
          break;
        case ContactAction.whatsapp:
          url = 'https://wa.me/${method.value.replaceAll(RegExp(r'[^\d+]'), '')}';
          break;
        case ContactAction.url:
          url = method.value;
          break;
      }

      final uri = Uri.parse(url);
      print('Trying to launch URL: $uri');

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        print('Cannot launch URL: $uri');
        Get.snackbar(
          AppStrings.errorTitle,
          '${AppStrings.errorCannotOpen} ${method.title}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error launching URL: $e');
      Get.snackbar(
        AppStrings.errorTitle,
        AppStrings.errorGeneric,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
