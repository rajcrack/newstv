import 'package:get/get.dart';
import 'package:newstv/model/news_model.dart';
import 'package:newstv/services/api_services.dart';

class PostDetailController extends GetxController {
  var isLoading = true.obs;
  var postsModel = <NewsModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchPostDetail();
  }

  Future<void> fetchPostDetail({postId = 1}) async {
    try {
      isLoading(true);
      var postDetails =
          await APIService().fetchPostDetail(postId);
      // postsModel.addAll(posts);
      if (postsModel != null) {
        postsModel.value = postDetails;
      }
    } finally {
      isLoading(false);
    }
  }
}
