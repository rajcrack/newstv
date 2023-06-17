import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newstv/model/news_model.dart';
import 'package:newstv/services/api_services.dart';

class PostDetailController extends GetxController {
  var dark = false.obs;
  var isLoading = true.obs;
  final postModel = <NewsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPostDetails();
    final box = GetStorage();
    dark(box.read('isdarkMode'));
  }

  Future<void> fetchPostDetails({postId = 1}) async {
    var postDetails =
        await APIService().fetchPostDetails(postId);
    try {
      isLoading(true);

      // postsModel.addAll(posts);
      postModel.value = postDetails;
    } finally {
      isLoading(false);
    }
  }

  void darkMode() {
    dark.toggle();
    final box = GetStorage();
    box.write('isdarkMode', dark.value);
  }
}
