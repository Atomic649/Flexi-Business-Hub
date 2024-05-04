import 'package:flutter/material.dart';
import 'package:flutter_node_store/components/social_media_stack.dart';

class FacebookBox extends StatefulWidget {
  @override
  State<FacebookBox> createState() => _FacebookBoxState();
}

class _FacebookBoxState extends State<FacebookBox> {
  double boxHeightFacebook = 160;
  double boxWidthFacebook = 200;

  void _hideFacebookBox() {
    setState(() {
      boxHeightFacebook = 35;
      boxWidthFacebook = 35;
    });
  }

  void _showFacebookBox() {
    setState(() {
      boxHeightFacebook = 160;
      boxWidthFacebook = 200;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          socialMediaContainer(
            height: boxHeightFacebook,
            width: boxWidthFacebook,
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
                                            Text('+9,999฿',
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF06E7C2),
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
              ontap: _hideFacebookBox,
              onDoubleTap: _showFacebookBox,
              child:  const Icon(
                Icons.facebook,
                color: Color(0xFF3300FF),
                size: 45,
              )),

          // Image.asset(
          //   "assets/images/facebook.png",
          //   width: 45,
          // ))
        ]);
  }
}