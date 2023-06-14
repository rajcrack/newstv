import 'package:get/get.dart';
import 'package:newstv/model/news_model.dart';
import 'package:newstv/services/api_services.dart';

class PostDetailController extends GetxController {
  var isLoading = true.obs;
  var postModel = NewsModel().obs;
  @override
  void onInit() {
    super.onInit();
    fetchPostDetails();
  }

  Future<void> fetchPostDetails({postId = 1}) async {
    try {
      isLoading(true);
      var postDetails =
          await APIService().fetchPostDetails(postId);
      // postsModel.addAll(posts);
      postModel.value = postDetails as NewsModel;
    } finally {
      isLoading(false);
    }
  }
}
