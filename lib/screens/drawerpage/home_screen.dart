import 'package:flexi_business_hub/screens/socialmedia_dashbroad/components/facebook_box.dart';
import 'package:flexi_business_hub/screens/socialmedia_dashbroad/components/google_box.dart';
import 'package:flexi_business_hub/screens/socialmedia_dashbroad/components/line_box.dart';
import 'package:flexi_business_hub/screens/socialmedia_dashbroad/components/shopee_box.dart';
import 'package:flexi_business_hub/screens/socialmedia_dashbroad/components/tiltok_box.dart';
import 'package:flexi_business_hub/screens/socialmedia_dashbroad/components/youtube_box.dart';
import 'package:flexi_business_hub/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _dateController = TextEditingController();

  // create datetime variable
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
//Date picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: DropdownButton(
                  hint: Text('เลือกบริษัท'),
                  value: 'Rezet',
                  onChanged: (value) {
                    // This is called when the user selects an item.
                    print(value!);
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Rezet',
                      child: Text('Rezet'),
                    ),
                    DropdownMenuItem(
                      value: 'BetaX',
                      child: Text('BetaX'),
                    ),
                    DropdownMenuItem(
                      value: 'LYO',
                      child: Text('LYO'),
                    ),
                  ],
                )),
                Expanded(
                    child: DropdownButton(
                  hint: Text('เลือกเซลล์'),
                  value: 'Ning',
                  onChanged: (value) {
                    // This is called when the user selects an item.
                    print(value!);
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Ning',
                      child: Text('Ning'),
                    ),
                    DropdownMenuItem(
                      value: 'Ome',
                      child: Text('Ome'),
                    ),
                    DropdownMenuItem(
                      value: 'Tankhun',
                      child: Text('Tankhun'),
                    ),
                  ],
                )),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    controller: _dateController,
                    maxLines: 1,
                    obscureText: false,
                    style: const TextStyle(
                        fontSize: 12.7, color: Color.fromARGB(255, 19, 18, 85)),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        size: 15.0,
                      ),
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      filled: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      hintText: 'เลือกช่วงวันที่',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 129, 46, 255)),
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
                              primary: const Color.fromARGB(255, 128, 29, 233),
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
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // ค่าใช้จ่าย

            Container(
              padding: const EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
              width: 420,
              height: 230,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2B00FF).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircularPercentIndicator(
                        animation: true,
                        animationDuration: 1000,
                        circularStrokeCap: CircularStrokeCap.round,
                        radius: 45,
                        lineWidth: 10,
                        percent: 0.36,
                        progressColor: const Color(0xFFFF3700),
                        backgroundColor: const Color(0xFF00EAAC),
                        center: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Text('%ads',style:TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.white)),
                            Text('36%',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromARGB(255, 155, 156, 183))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Text('ยอดขายรวม',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFABABD5))),
                  const Text('999,999,999.99฿',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 14, 41, 123))),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('ค่าแอดรวม',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFFABABD5))),
                          Text('999,999.99฿',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF8B3EFF))),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text('กำไรรวม',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFFABABD5))),
                          Text('+999,999.99฿',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF01E9B3))),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GridView(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 5.0, left: 5.0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 1.16,
                ),
                children: [
                  FacebookBox(),
                  const TiktokBox(),
                  const LineBox(),
                  const ShopeeBox(),
                  const YoutubeBox(),
                  const GoogleBox(),
                ]),
          ],
        ));
  }

  //------------------------------------------------------
  SizedBox sizeboxWidth() {
    return const SizedBox(
      width: 2,
    );
  }
//----------------------------------------------------------
}
