// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) =>
    List<NewsModel>.from(
        json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) => json.encode(
    List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  String id;
  String title;
  String date;
  String author;
  String content;
  String image;
  String category;

  NewsModel({
    required this.id,
    required this.title,
    required this.date,
    required this.author,
    required this.content,
    required this.image,
    required this.category,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      NewsModel(
        id: json["ID"],
        title: json["TITLE"],
        date: json["DATE"],
        author: json["AUTHOR"],
        content: json["CONTENT"],
        image: json["IMAGE"],
        category: json["CATEGORY"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "TITLE": title,
        "DATE": date,
        "AUTHOR": author,
        "CONTENT": content,
        "IMAGE": image,
        "CATEGORY": category,
      };
}
