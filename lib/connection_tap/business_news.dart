import 'package:flutter/material.dart';
import 'package:flutter_node_store/components/business_news_container.dart';
import 'package:flutter_node_store/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class BusinessNews extends StatefulWidget {
  @override
  State<BusinessNews> createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
 //-----------------Animation Box platform  fees----------------- 
  double boxHeight = 125;
  double boxWidth = 150;

  void _expandbox() {
    setState(() {
      boxHeight = 260;
      boxWidth = 300;
    });
  }

  void _unexpandbox() {
    setState(() {
      boxHeight = 125;
      boxWidth = 150;
    });
  }
//-------Animation Box Transport  fees-----------------

  double boxHeight2 = 125;
  double boxWidth2 = 150;

void _expandbox2() {
    setState(() {
      boxHeight2 = 200;
      boxWidth2 = 300;
    });
  }
  void _unexpandbox2() {
    setState(() {
      boxHeight2 = 125;
      boxWidth2 = 150;
    });
  }
//------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Consumer<ThemeProvider>(builder: (context, provider, child) {
        Text(provider.isDark ? 'Dark Mode' : 'Light Mode');
        return ListView(shrinkWrap: true, children: [
          GestureDetector(
            onTap: _expandbox,
            onDoubleTap: _unexpandbox,
            child: AnimatedContainer(
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.topLeft,
              duration: const Duration(seconds: 1),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Color(0xffb3c9ff), Color(0xffb8e7ff)],
                    stops: [0.25, 0.75],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                    )
                  ]),
              height: boxHeight,
              width: boxWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 5),
                    const Text(
                      '       ค่าธรรมเนียมแพตฟอร์ม วันนี้ !',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9900FF),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //----------------Container Detail--------------------------------------------------//
                    //--------Row Title Detail
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          containerStyleSocial2(
                              color: Colors.transparent,
                              child: const Text(
                                '',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 10),
                              )),
                          containerStyleSocial(
                              color: const Color(0xFF004CFF),
                              child: Text(
                                'Facebook',
                                style: textStyleBusinessNewsBold(),
                              )),
                          containerStyleSocial(
                              color: const Color(0xFF04B51C),
                              child: Text(
                                'Line',
                                style: textStyleBusinessNewsBold(),
                              )),
                          containerStyleSocial(
                              color: const Color(0xFF000000),
                              child: Text(
                                'Tiktok',
                                style: textStyleBusinessNewsBold(),
                              )),
                          containerStyleSocial(
                              color: const Color(0xFFFF6200),
                              child: Text(
                                'Shoppee',
                                style: textStyleBusinessNewsBold(),
                              )),
                          containerStyleSocial(
                              color: const Color(0xFFFF00C8),
                              child: Text(
                                'Lazada',
                                style: textStyleBusinessNewsBold(),
                              )),
                        ]),
        
                    const SizedBox(height: 3),
        
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          containerStyleSocial2(
                              color: Colors.transparent,
                              child: const Text(
                                '',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 10),
                              )),
                          //----Facebook
                          containerStyleBusinessNewsWhite(
                            child: Text('0', style: textStyleBusinessNews4()),
                          ),
                          //----Line
                          containerStyleBusinessNewsWhite(
                            child: Text('3%', style: textStyleBusinessNews4()),
                          ),
                          //----Tiktok
                          containerStyleBusinessNewsWhite(
                            child: Text('7%', style: textStyleBusinessNews4()),
                          ),
                          //----Shopee
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('8-13%', style: textStyleBusinessNews4()),
                          ),
                          //----Lazada
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('6-10%', style: textStyleBusinessNews4()),
                          ),
                        ]),
        
                    const SizedBox(height: 3),
                    //-----------------รวมค่าธรรมเนียม-----------------------------------
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          containerStyleSocial2(
                              color: Colors.transparent,
                              child: const Text(
                                'ธรรม\nเนียม',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 10),
                              )),
                          //----Facebook
                          containerStyleBusinessNewsWhite(
                            child: Text('0', style: textStyleBusinessNews2()),
                          ),
                          //----Line
                          containerStyleBusinessNewsWhite(
                            child: Text('3%', style: textStyleBusinessNews2()),
                          ),
                          //----Tiktok
                          containerStyleBusinessNewsWhite(
                            child: Text('3%', style: textStyleBusinessNews2()),
                          ),
                          //----Shopee
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('3-6%', style: textStyleBusinessNews2()),
                          ),
                          //----Lazada
                          containerStyleBusinessNewsWhite(
                            child: Text('3%', style: textStyleBusinessNews2()),
                          ),
                        ]),
        
                    const SizedBox(height: 3),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          containerStyleSocial2(
                              color: Colors.transparent,
                              child: const Text(
                                'คอม\nมิชชั่น',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 10),
                              )),
                          //----Facebook
                          containerStyleBusinessNewsWhite(
                            child: Text('0', style: textStyleBusinessNews2()),
                          ),
                          //----Line
                          containerStyleBusinessNewsWhite(
                            child: Text('0%', style: textStyleBusinessNews2()),
                          ),
                          //----Tiktok
                          containerStyleBusinessNewsWhite(
                            child: Text('4%', style: textStyleBusinessNews2()),
                          ),
                          //----Shopee
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('3-7%', style: textStyleBusinessNews2()),
                          ),
                          //----Lazada
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('3-7%', style: textStyleBusinessNews2()),
                          ),
                        ]),
        
                    const SizedBox(height: 3),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          containerStyleSocial2(
                              color: Colors.transparent,
                              child: const Text(
                                'ขนส่ง',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 10),
                              )),
                          //----Facebook
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('ไม่รวม', style: textStyleBusinessNews()),
                          ),
                          //----Line
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('ไม่รวม', style: textStyleBusinessNews()),
                          ),
                          //----Tiktok
                          containerStyleBusinessNewsWhite(
                            child: Text('รวม', style: textStyleBusinessNews()),
                          ),
                          //----Shopee
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('ไม่รวม', style: textStyleBusinessNews()),
                          ),
                          //----Lazada
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('ไม่รวม', style: textStyleBusinessNews()),
                          ),
                        ]),
        
                    const SizedBox(height: 10),
                    //----------**** remark ***
                    const Row(
                      children: [
                        Text(
                            '             ***ยอดค่าใช้จ่ายนี้ยังไม่รวม VAT และค่าธรรมเนียมโปรแกรมส่งเสริมการขาย***',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 10)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: _expandbox2,
            onDoubleTap: _unexpandbox2,
            child: AnimatedContainer(
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.topLeft,
              duration: const Duration(seconds: 1),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFBCFFB3), Color(0xFFB8FFE5)],
                    stops: [0.25, 0.75],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                    )
                  ]),
              height: boxHeight2,
              width: boxWidth2,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 5),
                    const Text(
                      '       ค่าขนส่ง วันนี้ !',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9900FF),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //----------------Container Detail--------------------------------------------------//
                    //--------Row Title Detail
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          containerStyleSocial2(
                              color: Colors.transparent,
                              child: const Text(
                                '',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 10),
                              )),
                          containerStyleSocial1(
                            image: const DecorationImage(
                                image: AssetImage(
                              'assets/images/thaipost.png',
                            )),
                          ),
                          containerStyleSocial1(
                            image: const DecorationImage(
                                image: AssetImage(
                              'assets/images/flash.png',
                            )),
                          ),
                          containerStyleSocial1(
                            image: const DecorationImage(
                                image: AssetImage(
                              'assets/images/j&t.png',
                            )),
                          ),
                          containerStyleSocial1(
                            image: const DecorationImage(
                                image: AssetImage(
                              'assets/images/kerry.png',
                            )),
                          ),
                          containerStyleSocial1(
                            image: const DecorationImage(
                                image: AssetImage(
                              'assets/images/scg.png',
                            )),
                          ),
                        ]),
        
                    const SizedBox(height: 3),
        
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          containerStyleSocial2(
                              color: Colors.transparent,
                              child: const Text(
                                '',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 10),
                              )),
                          //----ไปรษณีย์ไทย
                          containerStyleBusinessNewsWhite(
                            child: Text('32', style: textStyleBusinessNews2()),
                          ),
                          //----Flash
                          containerStyleBusinessNewsWhite(
                            child: Text('25 | 35',
                                style: textStyleBusinessNews2()),
                          ),
                          //----J&T
                          containerStyleBusinessNewsWhite(
                            child: Text('24 | 26',
                                style: textStyleBusinessNews2()),
                          ),
                          //----Kerry
                          containerStyleBusinessNewsWhite(
                            child: Text('30 | 55',
                                style: textStyleBusinessNews2()),
                          ),
                          //----SCG
                          containerStyleBusinessNewsWhite(
                            child: Text('35 | 55',
                                style: textStyleBusinessNews2()),
                          ),
                        ]),
        
                    const SizedBox(height: 3),
                    //-----------------------------น้ำหนักจำกัด-----------------------------------
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          containerStyleSocial2(
                              color: Colors.transparent,
                              child: const Text(
                                'น้ำหนัก',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 10),
                              )),
                          //----ไปรษณีย์ไทย
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('30kg', style: textStyleBusinessNews2()),
                          ),
                          //----Flash
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('50kg', style: textStyleBusinessNews2()),
                          ),
                          //----J&T
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('50kg', style: textStyleBusinessNews2()),
                          ),
                          //----Kerry
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('30kg', style: textStyleBusinessNews2()),
                          ),
                          //----SCG
                          containerStyleBusinessNewsWhite(
                            child:
                                Text('25kg', style: textStyleBusinessNews2()),
                          ),
                        ]),
        
                    ///---------------เวลาส่งของ----------------------------------------------
                    const SizedBox(height: 3),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          containerStyleSocial2(
                              color: Colors.transparent,
                              child: const Text(
                                'ระยะเวลา',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 10),
                              )),
                          //----ไปรษณีย์ไทย
                          containerStyleBusinessNewsWhite(
                            child: Text('1-2', style: textStyleBusinessNews2()),
                          ),
                          //------Flash
                          containerStyleBusinessNewsWhite(
                            child: Text('1-2 | 2-3',
                                style: textStyleBusinessNews2()),
                          ),
                          //----J&T
                          containerStyleBusinessNewsWhite(
                            child: Text('1-3', style: textStyleBusinessNews2()),
                          ),
                          //----Kerry
                          containerStyleBusinessNewsWhite(
                            child: Text('1-2', style: textStyleBusinessNews2()),
                          ),
                          //----SCG
                          containerStyleBusinessNewsWhite(
                            child: Text('2-3 | 2-4',
                                style: textStyleBusinessNews2()),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          )
        ]);
      }),
    ]);
  }

  //-----------------------------------------
  SizedBox sizedBoxHeight_3() {
    return const SizedBox(height: 3.5);
  }

  //-----------------------------------------
  SizedBox sizedBoxNewsWidth_() {
    return const SizedBox(height: 3.5);
  }
}
