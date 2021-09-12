// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

import 'package:NewsApp/model/Result.dart';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.status,
    this.copyright,
    this.numResults,
    this.results,
  });

  String status;
  String copyright;
  int numResults;
  List<Result> results;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    status: json["status"],
    copyright: json["copyright"],
    numResults: json["num_results"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "copyright": copyright,
    "num_results": numResults,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

enum Format { STANDARD_THUMBNAIL, MEDIUM_THREE_BY_TWO210, MEDIUM_THREE_BY_TWO440 }

final formatValues = EnumValues({
  "mediumThreeByTwo210": Format.MEDIUM_THREE_BY_TWO210,
  "mediumThreeByTwo440": Format.MEDIUM_THREE_BY_TWO440,
  "Standard Thumbnail": Format.STANDARD_THUMBNAIL
});

enum Subtype { PHOTO }

final subtypeValues = EnumValues({
  "photo": Subtype.PHOTO
});

enum MediaType { IMAGE }

final mediaTypeValues = EnumValues({
  "image": MediaType.IMAGE
});

enum Source { NEW_YORK_TIMES }

final sourceValues = EnumValues({
  "New York Times": Source.NEW_YORK_TIMES
});

enum Subsection { EMPTY, POLITICS, MEDIA, ASIA_PACIFIC }

final subsectionValues = EnumValues({
  "Asia Pacific": Subsection.ASIA_PACIFIC,
  "": Subsection.EMPTY,
  "Media": Subsection.MEDIA,
  "Politics": Subsection.POLITICS
});

enum ResultType { ARTICLE }

final resultTypeValues = EnumValues({
  "Article": ResultType.ARTICLE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
