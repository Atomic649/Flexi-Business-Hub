// To parse this JSON data, do
//
//     final memberModel = memberModelFromJson(jsonString);

import 'dart:convert';

List<MemberModel> memberModelFromJson(String str) => List<MemberModel>.from(json.decode(str).map((x) => MemberModel.fromJson(x)));

String memberModelToJson(List<MemberModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MemberModel {
    String? uniqueId;
    String? role;
    String? permission;
    DateTime? createAt;
    DateTime? updatedAt;

    MemberModel({
        this.uniqueId,
        this.role,
        this.permission,
        this.createAt,
        this.updatedAt,
    });

    factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
        uniqueId: json["uniqueId"],
        role: json["role"],
        permission: json["permission"],
        createAt: json["createAt"] == null ? null : DateTime.parse(json["createAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "uniqueId": uniqueId,
        "role": role,
        "permission": permission,
        "createAt": createAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
