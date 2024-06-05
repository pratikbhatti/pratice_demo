// To parse this JSON data, do
//
//     final getApiCall = getApiCallFromJson(jsonString);

import 'dart:convert';

List<GetApiCall> getApiCallFromJson(String str) => List<GetApiCall>.from(json.decode(str).map((x) => GetApiCall.fromJson(x)));

String getApiCallToJson(List<GetApiCall> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetApiCall {
  int? userId;
  int? id;
  String? title;
  String? body;

  GetApiCall({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory GetApiCall.fromJson(Map<String, dynamic> json) => GetApiCall(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
