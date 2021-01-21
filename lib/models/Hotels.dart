// To parse this JSON data, do
//
//     final hotels = hotelsFromJson(jsonString);

import 'dart:convert';

Hotels hotelsFromJson(String str) => Hotels.fromJson(json.decode(str));

String hotelsToJson(Hotels data) => json.encode(data.toJson());


class Hotels {
  Hotels({
    this.id,
    this.title,
    this.description,
    this.address,
    this.postcode,
    this.phoneNumber,
    this.latitude,
    this.longitude,
    this.image,
  });

  int id;
  String title;
  String description;
  String address;
  String postcode;
  String phoneNumber;
  String latitude;
  String longitude;
  Image image;

  factory Hotels.fromJson(Map<String, dynamic> json) => Hotels(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    address: json["address"],
    postcode: json["postcode"],
    phoneNumber: json["phoneNumber"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    image: Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "address": address,
    "postcode": postcode,
    "phoneNumber": phoneNumber,
    "latitude": latitude,
    "longitude": longitude,
    "image": image.toJson(),
  };
}

class Image {
  Image({
    this.small,
    this.medium,
    this.large,
  });

  String small;
  String medium;
  String large;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "medium": medium,
    "large": large,
  };
}
