import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newstv/controllers/postDetail_controller.dart';
import 'package:newstv/controllers/posts_controller.dart';

import 'utills/Layout_utills.dart';

class NewsDetail extends StatelessWidget {
  NewsDetail({super.key});
  final PostDetailController postDetailController =
      Get.put(PostDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  'https://media.istockphoto.com/id/1146517111/photo/taj-mahal-mausoleum-in-agra.jpg?s=612x612&w=0&k=20&c=vcIjhwUrNyjoKbGbAQ5sOcEzDUgOfCsm9ySmJ8gNeRk=',
                  fit: BoxFit.cover),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            expandedHeight: 250,
          ),
          SliverFillRemaining(
            child: NewsDetailed_Section(),
          )
        ],
      ),
    );
  }

//----------image  section----------//
  Widget BackgroundImage() {
    return Obx(() {
      if (postDetailController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Image.network(
            'postDetailController.postsModel.value.image');
      }
    });
  }
}

//==========details section===========///
Widget NewsDetailed_Section() {
  return Container(
    padding: EdgeInsets.all(15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row1(),
        LayoutUtils.iconText(
          Icon(Icons.timer),
          Text('Date'),
        ),
        SizedBox(
          height: 15,
        ),
        Text('Title',
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold)),
        SizedBox(
          child: Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          width: 100,
        ),
        Expanded(
          // child: Html(
          //     style: {"p": Style(color: Colors.black54)},
          //     data: '<p><b>api content</b></p>'))
          child: Text('hy'),
        )
      ],
    ),
  );
}

Widget Row1() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Categories',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Row(children: [
            IconButton(
              onPressed: null,
              icon: Icon(CupertinoIcons.moon),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(CupertinoIcons.bookmark),
            ),
          ]),
        ),
      ]);
}