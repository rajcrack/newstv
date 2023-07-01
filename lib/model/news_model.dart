// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

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
  String cat_title;

  NewsModel({
    this.id = '1',
    this.title = '21',
    this.date = '11',
    this.author = '1',
    this.content = '1',
    this.image = '1',
    this.cat_title = 'category',
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      NewsModel(
        id: json["ID"],
        title: json["TITLE"],
        date: json["DATE"],
        author: json["AUTHOR"],
        content: json["CONTENT"],
        image: json["IMAGE"],
        cat_title: json["cat_title"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "TITLE": title,
        "DATE": date,
        "AUTHOR": author,
        "CONTENT": content,
        "IMAGE": image,
        "cat_title": cat_title,
      };
}
