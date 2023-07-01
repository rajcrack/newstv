import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/postDetail_controller.dart';
import '/model/news_model.dart';
import '/news_detail.dart';

class NewsCardWidget extends StatelessWidget {
  NewsCardWidget({super.key, required this.model});
  final NewsModel model;
  final PostDetailController postDetailController =
      Get.put(PostDetailController());

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: postDetailController.dark.isFalse
          ? Colors.white
          : Colors.black,
      child: ListTile(
        title: Row(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: postDetailController.dark.isFalse
                      ? Colors.white30
                      : Colors.black38,
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      image: NetworkImage(model.image),
                      fit: BoxFit.cover)),
              height: 100,
              width: 150,
            )),
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 10, left: 10),
                    child: Text(
                      model.title,
                      style: TextStyle(
                        color: postDetailController
                                .dark.isFalse
                            ? Colors.black
                            : Colors.white,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        onTap: () {
          Get.to(NewsDetail(), arguments: model.id);
        },
      ),
    );
  }
}
