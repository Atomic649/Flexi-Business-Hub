// To parse this JSON data, do
//
//     final billModel = billModelFromJson(jsonString);

import 'dart:convert';

List<BillModel> billModelFromJson(String str) => List<BillModel>.from(json.decode(str).map((x) => BillModel.fromJson(x)));

String billModelToJson(List<BillModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BillModel {
    int? id;
    DateTime? createAt;
    DateTime? updatedAt;
    String? cName;
    String? cLastname;
    String? cPhone;
    String? cGender;
    String? cAdress;
    String? cProvince;
    String? cPostId;
    String? product;
    String? payment;
    int? amount;
    DateTime? purcheseAt;
    String? platform;
    bool? cashStatus;
    int? price;
    String? imageBill;
    String? memberId;
    int? businessAcc;

    BillModel({
        this.id,
        this.createAt,
        this.updatedAt,
        this.cName,
        this.cLastname,
        this.cPhone,
        this.cGender,
        this.cAdress,
        this.cProvince,
        this.cPostId,
        this.product,
        this.payment,
        this.amount,
        this.purcheseAt,
        this.platform,
        this.cashStatus,
        this.price,
        this.imageBill,
        this.memberId,
        this.businessAcc,
    });

    factory BillModel.fromJson(Map<String, dynamic> json) => BillModel(
        id: json["id"],
        createAt: json["createAt"] == null ? null : DateTime.parse(json["createAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        cName: json["cName"],
        cLastname: json["cLastname"],
        cPhone: json["cPhone"],
        cGender: json["cGender"],
        cAdress: json["cAdress"],
        cProvince: json["cProvince"],
        cPostId: json["cPostId"],
        product: json["product"],
        payment: json["payment"],
        amount: json["amount"],
        purcheseAt: json["purcheseAt"] == null ? null : DateTime.parse(json["purcheseAt"]),
        platform: json["platform"],
        cashStatus: json["cashStatus"],
        price: json["price"],
        imageBill: json["imageBill"],
        memberId: json["memberId"],
        businessAcc: json["businessAcc"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createAt": createAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "cName": cName,
        "cLastname": cLastname,
        "cPhone": cPhone,
        "cGender": cGender,
        "cAdress": cAdress,
        "cProvince": cProvince,
        "cPostId": cPostId,
        "product": product,
        "payment": payment,
        "amount": amount,
        "purcheseAt": purcheseAt?.toIso8601String(),
        "platform": platform,
        "cashStatus": cashStatus,
        "price": price,
        "imageBill": imageBill,
        "memberId": memberId,
        "businessAcc": businessAcc,
    };
}
