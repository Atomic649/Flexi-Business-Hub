import 'package:flexi_business_hub/providers/theme_provider.dart';
import 'package:flexi_business_hub/themes/colors.dart';
import 'package:flexi_business_hub/utils/utility.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

//---------------------------------------------------------------------------//
class SampleAvatar extends StatelessWidget {
  const SampleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50.0,
        height: 50.0,
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/samitk.jpg')));
  }
}

//---------------------------------------------------------------------------//

class BusinessProfile extends StatefulWidget {
  const BusinessProfile({super.key});

  @override
  State<BusinessProfile> createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  //LOGIC: อ่านข้อมูล profile จาก shared preference ---------------------//

  String? _firstName, _lastName;

// สร้างฟังก์ชัน getUserProfile สำหรับอ่านข้อมูลจาก shared preference
  getUserProfile() async {
    var firstName = await Utility.getSharedPreference('firstName');
    var lastName = await Utility.getSharedPreference('lastName');

    setState(() {
      _firstName = firstName;
      _lastName = lastName;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      Text(provider.isDark ? 'Dark Mode' : 'Light Mode');
      return ListView(shrinkWrap: true, children: [
        //-----Profile Picture
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 8),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/tananya.jpg'),
            ),
            const SizedBox(height: 8),
            Text(
              '$_firstName $_lastName',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF253866)),
            ),
            const Text(
              'Founder&Board Director',
              style: TextStyle(fontSize: 12, color: Color(0xFF253866)),
            )
          ],
        ),

        const SizedBox(height: 20),

        //--------Show Profile Credit Score
        Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 85),
            height: 75.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text('100', style: getStyle1()),
                    Text('Credit Score', style: getStyle2())
                  ],
                ),
                Column(
                  children: [
                    Text('12K', style: getStyle1()),
                    Text('Crediters', style: getStyle2())
                  ],
                ),
                Column(
                  children: [
                    Text('96.4K', style: getStyle1()),
                    Text('Point', style: getStyle2())
                  ],
                ),
              ],
            )),

        //--------Show Cutomer Creditor
        Container(
            padding: const EdgeInsets.all(15.0),
            height: 220.0,
            color: provider.isDark ? primaryText : primary,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cutomer Creditor',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5D6577)),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 35,                      
                      backgroundImage:
                          AssetImage('assets/images/samitk.jpg'),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/nichnipa.jpg'),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/top.jpg'),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/moo.jpg'),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/noavartar.png'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/noavartar.png'),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/noavartar.png'),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/noavartar.png'),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/noavartar.png'),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/noavartar.png'),
                    ),
                  ],
                ),
              ],
            )),

        //--------About
        Container(
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //   colors: [Color(0xff29ffbf), Color(0xff00ffff)],
            //   stops: [0.35, 0.85],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // )),
            padding: const EdgeInsets.all(15.0),
            height: 220.0,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('About',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color:  Color(0xFF253866))),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.business, color:  Color(0xFF253866)),
                    SizedBox(width: 10),
                    Text('บริษัท อะตอมมิิค อินเตอร์กรุ๊ป'),
                  ],
                ),
                const SizedBox(height: 3),
                const Row(
                  children: [
                    Icon(Icons.location_on, color:  Color(0xFF253866)),
                    SizedBox(width: 10),
                    Text(
                        '555/39 พลีโน่รามอินทรา จตุโชติิ ถ.ไทยรามัญ \nแขวงสามวาตะวันตก เขตคลองสามวา กรุงเทพมหานคร 10510',
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
                const SizedBox(height: 3),
                const Row(
                  children: [
                    Icon(Icons.credit_card, color:  Color(0xFF253866)),
                    SizedBox(width: 10),
                    Text('VAT ID 010556126834'),
                  ],
                ),
                const SizedBox(height: 5),
                // business contact
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/google.png",
                        width: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/facebook.png",
                        width: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/line.png",
                        width: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/phone.png",
                        width: 30,
                      ),
                    ),
                  ],
                )
              ],
            )),

        //-------Supplier Contact
        Container(
            padding: const EdgeInsets.all(15.0),
            height: 140.0,
            //color: Color(0xFF00FFBF),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Supplier Contact',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color:  Color(0xFF253866)),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/noavartar.png'),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/noavartar.png'),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/noavartar.png'),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/noavartar.png'),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/noavartar.png'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            )),
        //--------------
        Container(
            height: 200.0,
            color: const Color(0x47067AFF),
            child: const Center(child: Text('Supplier Profile'))),
      ]);
    });
  }

  //-------------------------------Font Setting-----------------------------//
  TextStyle getStyle1() => const TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 4, 61, 220));

  TextStyle getStyle2() => const TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black);
  //-------------------------------------------------------------------------//
}
