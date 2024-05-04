// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_node_store/components/custom_textfield.dart';
import 'package:flutter_node_store/models/bill_model.dart';
import 'package:flutter_node_store/screens/bills/components/bill_image.dart';
import 'package:flutter_node_store/utils/utility.dart';
// ignore: unused_import
import 'package:intl/intl.dart';

class BillForm extends StatefulWidget {
  final BillModel bill;
  final Function(File? file) callBackSetImage;
  final GlobalKey<FormState> formKey;

  const BillForm(
    this.bill, {
    required this.callBackSetImage,
    required this.formKey,
    Key? key,
  }) : super(key: key);

  @override
  State<BillForm> createState() => _BillFormState();
}

class _BillFormState extends State<BillForm> {
  final _dateController = TextEditingController();
 

  // create datetime variable
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
        child: Column(
          children: [
            //วันที่สั่งซื้อ
            TextFormField(
              readOnly: true,
              controller: widget.bill.purchaseAt!=null?_dateController:_dateController,
              maxLines: 1,
              obscureText: false,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_today,size: 15.0,),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                //hintText: 'วันที่สั่งซื้อ',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onTap: () async {
                FocusScope.of(context).requestFocus(new FocusNode());

                DateTime? newDate = await showDatePicker(
                  context: context,
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                        primary: Colors.tealAccent.shade400,
                      )),
                      child: child!,
                    );
                  },
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2025),
                  initialDate: _dateTime,

                  // Format Date
                ).then((value) {
                  //if cancel
                  if (value == null) {
                    return null;
                  }

                  //if ok
                  setState(() {
                    // Press Ok button
                    // ignore: unnecessary_null_comparison
                    if (value != null) {
                      _dateController.text = value!.toString();
                    }
                  });
                  return null;
                });

                Utility().logger.d(_dateController.text);
              },
              onSaved: (value) => widget.bill.purchaseAt = value!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาเลือกวันที่สั่งซื้อสินค้า';
                }
                return null;
              },
            ),

            const SizedBox(height: 10),
            //ชื่อลูกค้า
            customTextFieldBill(
              initialValue: widget.bill.customerName.toString(),
              obscureText: false,
              hintText: 'ชื่อลูกค้า',
              prefixIcon: const Icon(Icons.person),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกชื่อลูกค้า';
                }
                return null;
              },
              onSaved: (value) => widget.bill.customerName = value!,
            ),
            const SizedBox(height: 10),

            //เบอร์ติดต่อ
            Row(
              children: [
                Expanded(
                  child: customTextFieldBill(
                    initialValue: widget.bill.customerPhone.toString(),
                    obscureText: false,
                    hintText: 'เบอร์ลูกค้า',
                    textInputType: TextInputType.phone,
                    prefixIcon: const Icon(Icons.phone),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกเบอร์ลูกค้า';
                      }
                      return null;
                    },
                    onSaved: (value) => widget.bill.customerPhone = value!,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: customDropDownFieldBill(
                      initialValue: widget.bill.customerGender.toString(),
                      obscureText: false,
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกเพศของลูกค้า';
                        }
                        return null;
                      },
                      hintText: 'gender',
                      prefixIcon: const Icon(Icons.co_present),
                      onSaved: (value) => widget.bill.customerGender = value!,
                      items: const [
                        DropdownMenuItem(
                          value: 'ชาย',
                          child: Text('ชาย'),
                        ),
                        DropdownMenuItem(
                          value: 'หญิง',
                          child: Text('หญิง'),
                        )
                      ]),
                ),
              ],
            ),

            const SizedBox(height: 10),

            //โปรโมชั่น
            customTextFieldBill(
              initialValue: widget.bill.promotion.toString(),
              obscureText: false,
              hintText: 'โปรโมชั่น',
              prefixIcon: const Icon(Icons.star),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกโปรโมชั่น';
                }
                return null;
              },
              onSaved: (value) => widget.bill.promotion = value!,
            ),
            const SizedBox(height: 10),

            //จำนวนสินค้า
            Row(
              children: [
                Expanded(
                  child: customTextFieldProduct(
                    initialValue: widget.bill.buyAmount.toString(),
                    obscureText: false,
                    hintText: 'จำนวนสินค้า',
                    textInputType: TextInputType.number,
                    prefixIcon: const Icon(Icons.shopping_cart_outlined),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกจำนวนสินค้า';
                      }
                      return null;
                    },
                    onSaved: (value) =>
                        widget..bill.buyAmount = int.parse(value!),
                  ),
                ),
                const SizedBox(width: 10),

                //ราคาสินค้า
                Expanded(
                  child: customTextFieldBill(
                    initialValue: widget.bill.price.toString(),
                    obscureText: false,
                    hintText: 'ราคาสินค้า',
                    textInputType: TextInputType.number,
                    prefixIcon: const Icon(Icons.monetization_on_outlined),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกราคาสินค้า';
                      }
                      return null;
                    },
                    onSaved: (value) => widget.bill.price = int.parse(value!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //ที่อยู่
            customTextFieldBill(
              initialValue: widget.bill.adress.toString(),
              obscureText: false,
              hintText: 'ที่อยู่ลูกค้า',
              prefixIcon: const Icon(Icons.home),
              textInputType: TextInputType.multiline,
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกที่อยู่ลูกค้า';
                }
                return null;
              },
              onSaved: (value) => widget.bill.adress = value!,
            ),
            const SizedBox(height: 10),

            //จังหวัด
            Row(
              children: [
                Expanded(
                  child: customTextFieldBill(
                    initialValue: widget.bill.provence.toString(),
                    obscureText: false,
                    hintText: 'จังหวัด',
                    prefixIcon: const Icon(Icons.home),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกจังหวัดของลูกค้า';
                      }
                      return null;
                    },
                    onSaved: (value) => widget.bill.provence = value!,
                  ),
                ),
                const SizedBox(width: 10),

                //รหัสไปรษณีย์
                Expanded(
                  child: customTextFieldBill(
                    initialValue: widget.bill.postId.toString(),
                    obscureText: false,
                    hintText: 'รหัสไปรษณีย์',
                    textInputType: TextInputType.number,
                    prefixIcon: const Icon(Icons.home),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกรหัสไปรษณีย์ของลูกค้า';
                      }
                      return null;
                    },
                    onSaved: (value) => widget..bill.postId = value!,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //ช่องทางการสั่งซื้อ

            Row(
              children: [
                Expanded(
                  child: customDropDownFieldBill(
                      initialValue: widget.bill.payment.toString(),
                      obscureText: false,
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกวิธีการสั่งซื้อ';
                        }
                        return null;
                      },
                      hintText: 'gender',
                      prefixIcon: const Icon(Icons.co_present),
                      onSaved: (value) => widget.bill.payment = value!,
                      items: const [
                        DropdownMenuItem(
                          value: 'COD',
                          child: Text('COD'),
                        ),
                        DropdownMenuItem(
                          value: 'โอนเงิน',
                          child: Text('โอนเงิน'),
                        ),
                        DropdownMenuItem(
                          value: 'บัตรเครดิต',
                          child: Text('บัตรเครดิต'),
                        )
                      ]),
                ),

                const SizedBox(width: 10),
                Expanded(
                  child: customDropDownFieldBill(
                      initialValue: widget.bill.platform.toString(),
                      obscureText: false,
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกช่องทางการขาย';
                        }
                        return null;
                      },
                      hintText: 'Platform',
                      prefixIcon: const Icon(Icons.co_present),
                      onSaved: (value) => widget.bill.platform = value!,
                      items: const [
                        DropdownMenuItem(
                          value: 'Facebook',
                          child: Text('Facebook'),
                        ),
                        DropdownMenuItem(
                          value: 'Line',
                          child: Text('Line'),
                        ),
                        DropdownMenuItem(
                          value: 'TikTok',
                          child: Text('TikTok'),
                        ),
                        DropdownMenuItem(
                          value: 'Shopee',
                          child: Text('Shopee'),
                        ),
                        DropdownMenuItem(
                          value: 'Lazada',
                          child: Text('Lazada'),
                        )
                      ]),
                ),
                const SizedBox(width: 10),
                //logistic Status
              ],
            ),
            const SizedBox(height: 10),

            // Cash In Date
            customTextFieldBill(
              initialValue: widget.bill.cashInDate.toString(),
              obscureText: false,
              enabled: false,
              hintText: 'DD/MM/YYYY ที่ได้รับเงินสด',
              prefixIcon: const Icon(Icons.monetization_on_rounded),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกวันที่ได้รับเงินสด';
                }
                return null;
              },
              onSaved: (value) => widget.bill.cashInDate = value!,
            ),
            const SizedBox(height: 10),

            //ช่องทางการขาย
            customTextFieldBill(
              initialValue: widget.bill.logisticStatus.toString(),
              obscureText: false,
              hintText: 'ส่งแล้ว / กําลังส่ง / ยังไม่ส่ง',
              enabled: false,
              prefixIcon: const Icon(Icons.local_shipping_rounded),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกสถานะการส่งสินค้า';
                }
                return null;
              },
              onSaved: (value) => widget.bill.logisticStatus = value!,
            ),

            const SizedBox(height: 10),

            //Sale Id
            customTextFieldBill(
              initialValue: widget.bill.salesId.toString(),
              obscureText: false,
              enabled: false,
              hintText: 'Sale Id',
              prefixIcon: const Icon(Icons.app_registration),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกเลข Sale Id';
                }
                return null;
              },
              onSaved: (value) => widget.bill.salesId = value!,
            ),
            const SizedBox(height: 10),

            BillImage(
              widget.callBackSetImage,
              imageBill: widget.bill.imageBill,
            )
          ],
        ),
      ),
    );
  }

  //widget
}
