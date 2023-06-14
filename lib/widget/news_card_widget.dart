import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newstv/model/news_model.dart';
import 'package:newstv/news_detail.dart';

import '../utills/Layout_utills.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({required this.model});
  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => NewsDetail(),
          //     ));
          Get.to(NewsDetail(), arguments: model.id);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(model.image),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                    child: Text(
                      model.category,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  Text(
                    model.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      LayoutUtils.iconText(
                          Icon(Icons.timer),
                          Text(
                            model.date,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black),
                          )),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.favorite_border),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
