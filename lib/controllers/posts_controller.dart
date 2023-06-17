import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newstv/model/news_model.dart';
import 'package:newstv/services/api_services.dart';

class PostsController extends GetxController {
  var isLoading = true.obs;
  var postsList = <NewsModel>[].obs;
  // var liked = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchPosts();
    // final usex = GetStorage();
    // liked(usex.read('isliked'));
  }

  Future<void> fetchPosts({categoryId = 1}) async {
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
