import 'package:get/get.dart';
import '/model/news_model.dart';
import '/services/api_services.dart';

class PostsController extends GetxController {
  var isLoading = true.obs;
  var postsList = <NewsModel>[].obs;
  var iscat = false.obs;
  // var liked = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchPosts();
    // final usex = GetStorage();
    // liked(usex.read('isliked'));
  }

  Future<void> fetchPosts({categoryId = 'qwa'}) async {
    var posts = await APIService().fetchPosts(categoryId);

    try {
      isLoading(true);
      postsList.clear();

      // postsList.addAll(posts);
      postsList.addAll(posts);
    } finally {
      isLoading(false);
    }
  }

  // void likedPost(id) {
  //   liked.toggle();
  //   final usex = GetStorage();
  //   usex.write('isliked', liked.value);
  // }
}
