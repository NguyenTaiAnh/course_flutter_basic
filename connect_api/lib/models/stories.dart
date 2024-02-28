// To parse this JSON data, do
//
//     final stories = storiesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Stories storiesFromJson(String str) => Stories.fromJson(json.decode(str));

String storiesToJson(Stories data) => json.encode(data.toJson());

class Stories {
    Stories({
        required this.status,
        required this.statusCode,
        required this.message,
        required this.data,
    });

    bool status;
    int statusCode;
    String message;
    Data data;

    factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.items,
        required this.paginator,
    });

    List<Item> items;
    Paginator paginator;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        paginator: Paginator.fromJson(json["paginator"]),
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "paginator": paginator.toJson(),
    };
}

class Item {
    Item({
        required this.id,
        required this.name,
        required this.description,
        required this.image,
        required this.category,
        required this.author,
        required this.rate,
        required this.status,
        required this.chapter,
        required this.viewFollow,
        required this.viewLike,
        required this.viewStory,
    });

    int id;
    String name;
    String description;
    String image;
    List<Category> category;
    String author;
    String rate;
    String status;
    List<Category> chapter;
    String viewFollow;
    String viewLike;
    String viewStory;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
        author: json["author"],
        rate: json["rate"],
        status: json["status"],
        chapter: List<Category>.from(json["chapter"].map((x) => Category.fromJson(x))),
        viewFollow: json["view_follow"],
        viewLike: json["view_like"],
        viewStory: json["view_story"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "author": author,
        "rate": rate,
        "status": status,
        "chapter": List<dynamic>.from(chapter.map((x) => x.toJson())),
        "view_follow": viewFollow,
        "view_like": viewLike,
        "view_story": viewStory,
    };
}

class Category {
    Category({
        required this.id,
        required this.name,
    });

    int id;
    String name;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Paginator {
    Paginator({
        required this.totalCount,
        required this.totalPages,
        required this.currentPage,
        required this.limit,
    });

    int totalCount;
    int totalPages;
    int currentPage;
    int limit;

    factory Paginator.fromJson(Map<String, dynamic> json) => Paginator(
        totalCount: json["total_count"],
        totalPages: json["total_pages"],
        currentPage: json["current_page"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "total_pages": totalPages,
        "current_page": currentPage,
        "limit": limit,
    };
}
