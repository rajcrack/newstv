import 'package:http/http.dart' as http;
import 'package:newstv/model/category_model.dart';
import 'package:newstv/model/news_model.dart';
import '../config.dart';

class APIService {
  static var client = http.Client();

  //----------Call for category Api----------//
  Future<List<CategoryModel>> fetchCategories() async {
    var response = await client.get(
      Uri.parse(Config.apiURL + Config.categoryURL),
    );

    if (response.statusCode != 200) {
      return List.empty();
    }
    var jsonString = response.body;
    return categoryModelFromJson(jsonString);
  }

  //----------Call for post main page Api----------//
  Future<List<NewsModel>> fetchPosts(
      String categoryId) async {
    var response = await client.get(
      Uri.parse(
          Config.apiURL + Config.postURL + categoryId),
    );

    if (response.statusCode != 200) {
      return List.empty();
    }
    var jsonString = response.body;
    return newsModelFromJson(jsonString);
  }

//-------------Request for fetching post details-------------------//
  Future<List<NewsModel>> fetchPostDetail(
      String postId) async {
    var response = await client.get(
      Uri.parse(Config.apiURL + Config.postURL + postId),
    );

    if (response.statusCode != 200) {
      return List.empty();
    }
    var jsonString = response.body;
    return newsModelFromJson(jsonString);
  }
}
