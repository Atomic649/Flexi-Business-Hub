
import 'package:flexi_business_hub/components/mobile_layout.dart';
import 'package:flexi_business_hub/components/responsive_layout.dart';
import 'package:flexi_business_hub/components/web_layout.dart';
import 'package:flexi_business_hub/screens/member/member_form.dart';
import 'package:flutter/material.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({super.key});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
 
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        webChild: WebLayout(
          imageWidget: Image.asset(
            "assets/images/signup.png",
            width: 200,
          ),

          dataWidget:
              MemberForm(), //Lets define widget for Sign up form & use here
        ),
        mobileChild: MobileLayout(
          imageWidget: Image.asset(
            "assets/images/signup.png",
            width: 75,
          ),
          dataWidget: MemberForm(),
        ));
  }
}
