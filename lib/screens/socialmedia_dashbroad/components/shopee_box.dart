import 'package:flutter/material.dart';
import 'package:flutter_node_store/components/social_media_stack.dart';

class ShopeeBox extends StatefulWidget {
  const ShopeeBox({super.key});

  @override
  State<ShopeeBox> createState() => _ShopeeBoxState();
}

class _ShopeeBoxState extends State<ShopeeBox> {
  double boxHeightShopee = 160;
  double boxWidthShopee = 200;

  void _hideShopeeBox() {
    setState(() {
      boxHeightShopee = 35;
      boxWidthShopee = 35;
    });
  }

  void _showShopeeBox() {
    setState(() {
      boxHeightShopee = 160;
      boxWidthShopee = 200;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          socialMediaContainer(
            height: boxHeightShopee,
            width: boxWidthShopee,
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
              ontap: _hideShopeeBox,
              onDoubleTap: _showShopeeBox,
              child: Container(
                margin: EdgeInsets.all(3.0),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xFF3300FF),
                ),
                child: const Icon(
                  Icons.storefront_rounded,
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
