// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newstv/controllers/postDetail_controller.dart';
// for using share uncomment this line
//import 'package:share_plus/share_plus.dart';

import 'utills/Layout_utills.dart';

class NewsDetail extends StatelessWidget {
  NewsDetail({super.key});
  final PostDetailController newsdetailController =
      Get.put(PostDetailController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      newsdetailController.fetchPostDetails(
          postId: Get.arguments);
    });
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: BackgroundImage(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            expandedHeight: 250,
          ),
          SliverFillRemaining(
            child: Obx(() {
              if (newsdetailController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return AnimatedContainer(
                    color: newsdetailController.dark.isFalse
                        ? const Color(0xffF8F8F8)
                        : const Color(0xff212121),
                    duration:
                        const Duration(milliseconds: 200),
                    child: NewsDetailed_Section());
                // NewsDetailed_Section();
              }
            }),
          )
        ],
      ),
    );
  }

//----------image  section----------//
  Widget BackgroundImage() {
    return Obx(() {
      if (newsdetailController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Image.network(
          newsdetailController.postModel[0].image,
          fit: BoxFit.cover,
        );
      }
    });
  }

//==========details section===========///
  Widget NewsDetailed_Section() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            if (newsdetailController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Row1();
            }
          }),
          LayoutUtils.iconText(
            Icon(
              Icons.timer,
              color: newsdetailController.dark.isFalse
                  ? Colors.black
                  : Colors.white70,
            ),
            Text(
              newsdetailController.postModel[0].date,
              style: TextStyle(
                  color: newsdetailController.dark.isFalse
                      ? Colors.black
                      : Colors.white70),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(newsdetailController.postModel[0].title,
              style: TextStyle(
                  fontSize: 16,
                  color: newsdetailController.dark.isFalse
                      ? Colors.black
                      : const Color.fromARGB(
                          255, 202, 192, 192),
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            width: 200,
            child: Divider(
              color: Colors.grey,
              thickness: 2,
            ),
          ),
          Expanded(
            // child: Html(
            //     style: {"p": Style(color: Colors.black54)},
            //     data: '<p><b>api content</b></p>'))
            child: Text(
                newsdetailController.postModel[0].content,
                style: TextStyle(
                    color: newsdetailController.dark.isFalse
                        ? const Color.fromARGB(
                            255, 90, 88, 88)
                        : const Color.fromARGB(
                            255, 253, 253, 253),
                    fontWeight: FontWeight.bold)),
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
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                newsdetailController.postModel[0].cat_title,
                style: const TextStyle(
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
                onPressed: () {
                  newsdetailController.darkMode();
                },
                icon: Icon(
                  newsdetailController.dark.isFalse
                      ? CupertinoIcons.moon
                      : CupertinoIcons.sun_max_fill,
                  color: newsdetailController.dark.isFalse
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                // () async {
                //   await Share.share(
                //       'check out my website https://example.com'
                // );
                // },
                icon: const Icon(
                  CupertinoIcons.arrowshape_turn_up_right,
                  color: Colors.black,
                ),
              ),
            ]),
          ),
        ]);
  }
}

// shareData() {
//   return Share.share(
//       'check out my website https://example.com',
//       subject: 'Look what I made!');
// }
