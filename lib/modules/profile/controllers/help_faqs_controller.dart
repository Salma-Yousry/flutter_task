import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../../core/constants/app_strings.dart';

class FaqController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final RxInt selectedTab = 0.obs;
  final RxInt selectedCategory = 0.obs;
  final RxList<int> expandedItems = <int>[].obs;
  final RxList<Map<String, dynamic>> filteredFaqs = <Map<String, dynamic>>[].obs;

  final List<Map<String, dynamic>> allFaqs = [
    {
      'id': 1,
      'question': AppStrings.faqQ1,
      'answer': AppStrings.faqA1,
      'category': 0,
    },
    {
      'id': 2,
      'question': AppStrings.faqQ2,
      'answer': AppStrings.faqA2,
      'category': 0,
    },
    {
      'id': 3,
      'question': AppStrings.faqQ3,
      'answer': AppStrings.faqA3,
      'category': 1,
    },
    {
      'id': 4,
      'question': AppStrings.faqQ4,
      'answer': AppStrings.faqA4,
      'category': 2,
    },
    {
      'id': 5,
      'question': AppStrings.faqQ5,
      'answer': AppStrings.faqA5,
      'category': 0,
    },
    {
      'id': 6,
      'question': AppStrings.faqQ6,
      'answer': AppStrings.faqA6,
      'category': 1,
    },
  ];

  final List<Map<String, dynamic>> contactOptions = [
    {
      'icon': Icons.headset_mic,
      'title': AppStrings.customerServiceTitle,
    },
    {
      'icon': Icons.language,
      'title': AppStrings.websiteTitle,
    },
    {
      'icon': Icons.facebook,
      'title': AppStrings.facebookTitle,
    },
    {
      'icon': Icons.chat,
      'title': AppStrings.whatsappTitle,
    },
    {
      'icon': Icons.camera_alt,
      'title': AppStrings.instagramTitle,
    },
  ];

  @override
  void onInit() {
    super.onInit();
    filteredFaqs.value = allFaqs;
    ever(selectedCategory, (_) => filterFaqs(''));
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void filterFaqs(String query) {
    List<Map<String, dynamic>> filtered = allFaqs;

    if (selectedCategory.value > 0) {
      filtered = filtered
          .where((faq) => faq['category'] == selectedCategory.value - 1)
          .toList();
    }

    if (query.isNotEmpty) {
      filtered = filtered
          .where((faq) =>
      faq['question'].toLowerCase().contains(query.toLowerCase()) ||
          faq['answer'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    filteredFaqs.value = filtered;
  }

  void toggleExpansion(int id) {
    if (expandedItems.contains(id)) {
      expandedItems.remove(id);
    } else {
      expandedItems.add(id);
    }
  }

  void handleContactOption(String option) {
    switch (option) {
      case AppStrings.customerServiceTitle:
        Get.toNamed(Routes.CUSTOMER_SERVICE);
        break;
      case AppStrings.websiteTitle:
      // Handle website navigation
        break;
      case AppStrings.facebookTitle:
      // Handle Facebook navigation
        break;
      case AppStrings.whatsappTitle:
      // Handle WhatsApp navigation
        break;
      case AppStrings.instagramTitle:
      // Handle Instagram navigation
        break;
    }
  }
}
