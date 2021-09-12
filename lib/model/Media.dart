import 'package:NewsApp/model/MediaMetadatum.dart';
import 'package:NewsApp/model/news_model.dart';

class Media {
  Media({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approvedForSyndication,
    this.mediaMetadata,
  });

  MediaType type;
  Subtype subtype;
  String caption;
  String copyright;
  int approvedForSyndication;
  List<MediaMetadatum> mediaMetadata;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    type: mediaTypeValues.map[json["type"]],
    subtype: subtypeValues.map[json["subtype"]],
    caption: json["caption"],
    copyright: json["copyright"],
    approvedForSyndication: json["approved_for_syndication"],
    mediaMetadata: List<MediaMetadatum>.from(json["media-metadata"].map((x) => MediaMetadatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": mediaTypeValues.reverse[type],
    "subtype": subtypeValues.reverse[subtype],
    "caption": caption,
    "copyright": copyright,
    "approved_for_syndication": approvedForSyndication,
    "media-metadata": List<dynamic>.from(mediaMetadata.map((x) => x.toJson())),
  };
}