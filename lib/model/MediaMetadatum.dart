import 'package:NewsApp/model/news_model.dart';

class MediaMetadatum {
  MediaMetadatum({
    this.url,
    this.format,
    this.height,
    this.width,
  });

  String url;
  Format format;
  int height;
  int width;

  factory MediaMetadatum.fromJson(Map<String, dynamic> json) => MediaMetadatum(
    url: json["url"],
    format: formatValues.map[json["format"]],
    height: json["height"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "format": formatValues.reverse[format],
    "height": height,
    "width": width,
  };
}