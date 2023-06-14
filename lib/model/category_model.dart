// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(json
        .decode(str)
        .map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(
        List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  String id;
  String catTitle;

  CategoryModel({
    required this.id,
    required this.catTitle,
  });

  factory CategoryModel.fromJson(
          Map<String, dynamic> json) =>
      CategoryModel(
        id: json["id"],
        catTitle: json["cat_title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_title": catTitle,
      };
}
