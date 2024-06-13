// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:flexi_business_hub/components/custom_textfield.dart';
import 'package:flexi_business_hub/models/bill_model.dart';
import 'package:flexi_business_hub/screens/bills/components/bill_image.dart';
import 'package:flexi_business_hub/utils/utility.dart';
import 'package:flutter/material.dart';

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
              controller: widget.bill.createAt!=null?_dateController:_dateController,
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
              onSaved: (value) => widget.bill.createAt = DateTime.parse(value!),
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
              initialValue: widget.bill.cName.toString(),
              obscureText: false,
              hintText: 'ชื่อลูกค้า',
              prefixIcon: const Icon(Icons.person),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกชื่อลูกค้า';
                }
                return null;
              },
              onSaved: (value) => widget.bill.cName = value!,
            ),
            const SizedBox(height: 10),

            //เบอร์ติดต่อ
            Row(
              children: [
                Expanded(
                  child: customTextFieldBill(
                    initialValue: widget.bill.cPhone.toString(),
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
                    onSaved: (value) => widget.bill.cPhone = value!,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: customDropDownFieldBill(
                      initialValue: widget.bill.cGender.toString(),
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
                      onSaved: (value) => widget.bill.cGender = value!,
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
              initialValue: widget.bill.product.toString(),
              obscureText: false,
              hintText: 'โปรโมชั่น',
              prefixIcon: const Icon(Icons.star),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกโปรโมชั่น';
                }
                return null;
              },
              onSaved: (value) => widget.bill.product = value!,
            ),
            const SizedBox(height: 10),

            //จำนวนสินค้า
            Row(
              children: [
                Expanded(
                  child: customTextFieldProduct(
                    initialValue: widget.bill.amount.toString(),
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
                        widget..bill.amount = int.parse(value!),
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
              initialValue: widget.bill.cAdress.toString(),
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
              onSaved: (value) => widget.bill.cAdress = value!,
            ),
            const SizedBox(height: 10),

            //จังหวัด
            Row(
              children: [
                Expanded(
                  child: customTextFieldBill(
                    initialValue: widget.bill.cProvince.toString(),
                    obscureText: false,
                    hintText: 'จังหวัด',
                    prefixIcon: const Icon(Icons.home),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกจังหวัดของลูกค้า';
                      }
                      return null;
                    },
                    onSaved: (value) => widget.bill.cProvince = value!,
                  ),
                ),
                const SizedBox(width: 10),

                //รหัสไปรษณีย์
                Expanded(
                  child: customTextFieldBill(
                    initialValue: widget.bill.cPostId.toString(),
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
                    onSaved: (value) => widget..bill.cPostId = value!,
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
              initialValue: widget.bill.cashStatus.toString(),
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
              onSaved: (value) => widget.bill.cashStatus = bool.parse(value!),
            ),
            const SizedBox(height: 10),

            //ช่องทางการขาย
            customTextFieldBill(
              initialValue: widget.bill.platform.toString(),
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
              onSaved: (value) => widget.bill.platform = value!,
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
