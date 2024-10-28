// To parse this JSON data, do
//
//     final amiiboModel = amiiboModelFromJson(jsonString);

import 'dart:convert';

AmiiboModel amiiboModelFromJson(String str) => AmiiboModel.fromJson(json.decode(str));

String amiiboModelToJson(AmiiboModel data) => json.encode(data.toJson());

class AmiiboModel {
    List<Amiibo> amiibo;

    AmiiboModel({
        required this.amiibo,
    });

    factory AmiiboModel.fromJson(Map<String, dynamic> json) => AmiiboModel(
        amiibo: List<Amiibo>.from(json["amiibo"].map((x) => Amiibo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "amiibo": List<dynamic>.from(amiibo.map((x) => x.toJson())),
    };
}

class Amiibo {
    String amiiboSeries;
    String character;
    String gameSeries;
    String head;
    String image;
    String name;
    Release release;
    String tail;
    String type;

    Amiibo({
        required this.amiiboSeries,
        required this.character,
        required this.gameSeries,
        required this.head,
        required this.image,
        required this.name,
        required this.release,
        required this.tail,
        required this.type,
    });

    factory Amiibo.fromJson(Map<String, dynamic> json) => Amiibo(
        amiiboSeries: json["amiiboSeries"],
        character: json["character"],
        gameSeries: json["gameSeries"],
        head: json["head"],
        image: json["image"],
        name: json["name"],
        release: Release.fromJson(json["release"]),
        tail: json["tail"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "amiiboSeries": amiiboSeries,
        "character": character,
        "gameSeries": gameSeries,
        "head": head,
        "image": image,
        "name": name,
        "release": release.toJson(),
        "tail": tail,
        "type": type,
    };
}

class Release {
    DateTime? au;
    DateTime? eu;
    DateTime? jp;
    DateTime? na;

    Release({
        required this.au,
        required this.eu,
        required this.jp,
        required this.na,
    });

    factory Release.fromJson(Map<String, dynamic> json) => Release(
        au: json["au"] == null ? null : DateTime.parse(json["au"]),
        eu: json["eu"] == null ? null : DateTime.parse(json["eu"]),
        jp: json["jp"] == null ? null : DateTime.parse(json["jp"]),
        na: json["na"] == null ? null : DateTime.parse(json["na"]),
    );

    Map<String, dynamic> toJson() => {
        "au": "${au!.year.toString().padLeft(4, '0')}-${au!.month.toString().padLeft(2, '0')}-${au!.day.toString().padLeft(2, '0')}",
        "eu": "${eu!.year.toString().padLeft(4, '0')}-${eu!.month.toString().padLeft(2, '0')}-${eu!.day.toString().padLeft(2, '0')}",
        "jp": "${jp!.year.toString().padLeft(4, '0')}-${jp!.month.toString().padLeft(2, '0')}-${jp!.day.toString().padLeft(2, '0')}",
        "na": "${na!.year.toString().padLeft(4, '0')}-${na!.month.toString().padLeft(2, '0')}-${na!.day.toString().padLeft(2, '0')}",
    };
}
