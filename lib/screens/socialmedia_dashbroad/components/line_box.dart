import 'package:flexi_business_hub/components/social_media_stack.dart';
import 'package:flutter/material.dart';


class LineBox extends StatefulWidget {
  const LineBox({super.key});

  @override
  State<LineBox> createState() => _LineBoxState();
}

class _LineBoxState extends State<LineBox> {
  double boxHeightLine = 160;
  double boxWidthLine = 200;

  void _hideLineBox() {
    setState(() {
      boxHeightLine = 35;
      boxWidthLine = 35;
    });
  }

  void _showLineBox() {
    setState(() {
      boxHeightLine = 160;
      boxWidthLine = 200;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topLeft,
      children: [
      socialMediaContainer(
            height: boxHeightLine,
            width: boxWidthLine,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(children: [
                              Text('ยอดขาย',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF9497A1))),
                              Text(
                                '9,999,999฿',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0B2783)),
                              ),
                            ]),
                            SizedBox(height: 2),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text('ค่าแอด',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF9497A1))),
                                          Text('9,999฿',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF8B3EFF))),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Column(
                                        children: [
                                          Text('%ads',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF9497A1))),
                                          Text('32%',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF5D6A97))),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text('กำไรขั้นต้น',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF9497A1))),
                                            Text('-3,499฿',
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFF3700),
                                                )),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('เฉลี่ย/ลูกค้า',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF9497A1))),
                                            Text('99.99฿',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF5D6A97))),
                                          ],
                                        ),
                                      ])
                                ]),
                          ]),
                    ),
                  ),
                )),
          ),
          // google
          socialBoxPosition(
              ontap: _hideLineBox,
              onDoubleTap: _showLineBox,
              child: Container(
                margin: EdgeInsets.all(3.0),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xFF3300FF),
                ),
                child: const Icon(
                Icons.local_police_sharp,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 25,
                ),
              )),

          // Image.asset(
          //   "assets/images/facebook.png",
          //   width: 45,
          // ))
        ]);
  }
}
