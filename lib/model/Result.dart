import 'package:NewsApp/model/Media.dart';
import 'package:NewsApp/model/MediaMetadatum.dart';
import 'package:NewsApp/model/news_model.dart';

class Result {
  Result({
    this.uri,
    this.url,
    this.id,
    this.assetId,
    this.source,
    this.publishedDate,
    this.updated,
    this.section,
    this.subsection,
    this.nytdsection,
    this.adxKeywords,
    this.column,
    this.byline,
    this.type,
    this.title,
    this.resultAbstract,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.media,
    this.etaId,
  });

  String uri;
  String url;
  int id;
  int assetId;
  Source source;
  DateTime publishedDate;
  DateTime updated;
  String section;
  Subsection subsection;
  String nytdsection;
  String adxKeywords;
  dynamic column;
  String byline;
  ResultType type;
  String title;
  String resultAbstract;
  List<String> desFacet;
  List<String> orgFacet;
  List<String> perFacet;
  List<String> geoFacet;
  List<Media> media;
  int etaId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    uri: json["uri"],
    url: json["url"],
    id: json["id"],
    assetId: json["asset_id"],
    source: sourceValues.map[json["source"]],
    publishedDate: DateTime.parse(json["published_date"]),
    updated: DateTime.parse(json["updated"]),
    section: json["section"],
    subsection: subsectionValues.map[json["subsection"]],
    nytdsection: json["nytdsection"],
    adxKeywords: json["adx_keywords"],
    column: json["column"],
    byline: json["byline"],
    type: resultTypeValues.map[json["type"]],
    title: json["title"],
    resultAbstract: json["abstract"],
    desFacet: List<String>.from(json["des_facet"].map((x) => x)),
    orgFacet: List<String>.from(json["org_facet"].map((x) => x)),
    perFacet: List<String>.from(json["per_facet"].map((x) => x)),
    geoFacet: List<String>.from(json["geo_facet"].map((x) => x)),
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
    etaId: json["eta_id"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "url": url,
    "id": id,
    "asset_id": assetId,
    "source": sourceValues.reverse[source],
    "published_date": "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
    "updated": updated.toIso8601String(),
    "section": section,
    "subsection": subsectionValues.reverse[subsection],
    "nytdsection": nytdsection,
    "adx_keywords": adxKeywords,
    "column": column,
    "byline": byline,
    "type": resultTypeValues.reverse[type],
    "title": title,
    "abstract": resultAbstract,
    "des_facet": List<dynamic>.from(desFacet.map((x) => x)),
    "org_facet": List<dynamic>.from(orgFacet.map((x) => x)),
    "per_facet": List<dynamic>.from(perFacet.map((x) => x)),
    "geo_facet": List<dynamic>.from(geoFacet.map((x) => x)),
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
    "eta_id": etaId,
  };
}