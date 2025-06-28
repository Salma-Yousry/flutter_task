import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';

class CustomerServiceController extends GetxController {
  void navigateToHelpCenter() {
    Get.toNamed(AppStrings.helpFaqsRoute);
  }

  void navigateToSupport() {
    Get.toNamed(AppStrings.helpFaqsRoute);
  }
}
