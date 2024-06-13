
import 'package:flexi_business_hub/components/mobile_layout.dart';
import 'package:flexi_business_hub/screens/business_acc/businesss_acc_form.dart';
import 'package:flutter/material.dart';

import '../../components/responsive_layout.dart';
import '../../components/web_layout.dart';

class BusinessAccScreen extends StatefulWidget {
  const BusinessAccScreen({super.key});

  @override
  State<BusinessAccScreen> createState() => _BusinessAccScreenState();
}

class _BusinessAccScreenState extends State<BusinessAccScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        webChild: WebLayout(
          imageWidget: Image.asset(
            "assets/images/signup.png",
            width: 200,
          ),

          dataWidget:
              BusinessAccForm(), //Lets define widget for Sign up form & use here
        ),
        mobileChild: MobileLayout(
          imageWidget: Image.asset(
            "assets/images/signup.png",
            width: 75,
          ),
          dataWidget: BusinessAccForm(),
        ));
  }
}
