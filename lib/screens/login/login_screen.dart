
import 'package:flexi_business_hub/components/mobile_layout.dart';
import 'package:flexi_business_hub/components/responsive_layout.dart';
import 'package:flexi_business_hub/components/web_layout.dart';
import 'package:flexi_business_hub/screens/login/login_form.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        webChild: WebLayout(
          imageWidget: Image.asset(
            "assets/images/login.png",
            width: 200,
          ),
          dataWidget: LoginForm(),
        ),
        mobileChild: MobileLayout(
          imageWidget: Image.asset(
            "assets/images/login.png",
            width: 200,
          ),
          dataWidget: LoginForm(),
        ));
  }
}
