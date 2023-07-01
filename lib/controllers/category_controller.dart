import 'package:get/get.dart';
import '/model/category_model.dart';
import '/services/api_services.dart';

class CategoriesController extends GetxController {
  var isLoading = true.obs;
  var categoriesList = <CategoryModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    var categories = await APIService().fetchCategories();

    try {
      isLoading(true);
      categoriesList.clear();
      if (categories.isNotEmpty) {
        categoriesList.addAll(categories);
      }
    } finally {
      isLoading(false);
    }
  }
}
