// To parse this JSON data, do
//
//     final businessAccModel = businessAccModelFromJson(jsonString);

import 'dart:convert';

List<BusinessAccModel> businessAccModelFromJson(String str) => List<BusinessAccModel>.from(json.decode(str).map((x) => BusinessAccModel.fromJson(x)));

String businessAccModelToJson(List<BusinessAccModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusinessAccModel {
    int? id;
    String? businessName;
    String? vatId;
    String? businessType;
    String? taxType;
    int? userId;
    String? memberId;

    BusinessAccModel({
        this.id,
        this.businessName,
        this.vatId,
        this.businessType,
        this.taxType,
        this.userId,
        this.memberId,
    });

    factory BusinessAccModel.fromJson(Map<String, dynamic> json) => BusinessAccModel(
        id: json["id"],
        businessName: json["businessName"],
        vatId: json["vatId"],
        businessType: json["businessType"],
        taxType: json["taxType"],
        userId: json["userId"],
        memberId: json["memberId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "businessName": businessName,
        "vatId": vatId,
        "businessType": businessType,
        "taxType": taxType,
        "userId": userId,
        "memberId": memberId,
    };
}
