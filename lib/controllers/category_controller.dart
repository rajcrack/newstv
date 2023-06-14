import 'package:get/get.dart';
import 'package:newstv/model/category_model.dart';
import 'package:newstv/services/api_services.dart';

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
      if (categories.length > 0) {
        categoriesList.clear();
        categoriesList.addAll(categories);
      }
    } finally {
      isLoading(false);
    }
  }
}
