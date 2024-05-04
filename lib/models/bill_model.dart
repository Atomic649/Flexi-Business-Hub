import 'dart:convert';

List<BillModel> billModelFromJson(String str) => List<BillModel>.from(json.decode(str).map((x) => BillModel.fromJson(x)));

String billModelToJson(List<BillModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BillModel {
    int? billId;
    String? customerName;
    String? imageBill;
    String? customerPhone;
    String? customerGender;
    String? promotion;
    int? buyAmount;
    int? price;
    String? adress;
    String? provence;
    String? postId;
    String? payment;
    String? logisticStatus;
    String? cashInDate;
    String? platform;
    dynamic salesId;
    String? purchaseAt;
    DateTime? createAt;
    DateTime? updateAt;

    BillModel({
        this.billId,
        this.customerName,
        this.imageBill,
        this.customerPhone,
        this.customerGender,
        this.promotion,
        this.buyAmount,
        this.price,
        this.adress,
        this.provence,
        this.postId,
        this.payment,
        this.logisticStatus,
        this.cashInDate,
        this.platform,
        this.salesId,
        this.purchaseAt,
        this.createAt,
        this.updateAt,
    });

    factory BillModel.fromJson(Map<String, dynamic> json) => BillModel(
        billId: json["bill_id"],
        customerName: json["customer_name"],
        imageBill: json["image_bill"],
        customerPhone: json["customer_phone"],
        customerGender: json["customer_gender"],
        promotion: json["promotion"],
        buyAmount: json["buy_amount"],
        price: json["price"],
        adress: json["adress"],
        provence: json["provence"],
        postId: json["post_id"],
        payment: json["payment"],
        logisticStatus: json["logistic_status"],
        cashInDate: json["cash_in_date"],
        platform: json["platform"],
        salesId: json["sales_id"],
        purchaseAt: json["purchase_at"],
        createAt: json["create_at"] == null ? null : DateTime.parse(json["create_at"]),
        updateAt: json["update_at"] == null ? null : DateTime.parse(json["update_at"]),
    );

    Map<String, dynamic> toJson() => {
        "bill_id": billId,
        "customer_name": customerName,
        "image_bill": imageBill,
        "customer_phone": customerPhone,
        "customer_gender": customerGender,
        "promotion": promotion,
        "buy_amount": buyAmount,
        "price": price,
        "adress": adress,
        "provence": provence,
        "post_id": postId,
        "payment": payment,
        "logistic_status": logisticStatus,
        "cash_in_date": cashInDate,
        "platform": platform,
        "sales_id": salesId,
        "purchase_at": purchaseAt,
        "create_at": createAt?.toIso8601String(),
        "update_at": updateAt?.toIso8601String(),
    };
}
