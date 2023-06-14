import 'package:get/get.dart';
import 'package:newstv/model/category_model.dart';
import 'package:newstv/model/news_model.dart';
import 'package:newstv/services/api_services.dart';

class PostsController extends GetxController {
  var isLoading = true.obs;
  var postsList = <NewsModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts({categoryId = 1}) async {
    var posts = await APIService().fetchPosts(categoryId);

    try {
      isLoading(true);
      postsList.clear();

      // postsList.addAll(posts);
      if (postsList != null) {
        postsList.addAll(posts);
      }
    } finally {
      isLoading(false);
    }
  }
}
