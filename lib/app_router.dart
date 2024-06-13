

import 'package:flexi_business_hub/screens/bills/bill_add.dart';
import 'package:flexi_business_hub/screens/bills/bill_update.dart';
import 'package:flexi_business_hub/screens/dashbroad/dashbroad_screen.dart';
import 'package:flexi_business_hub/screens/drawerpage/about_screen.dart';
import 'package:flexi_business_hub/screens/drawerpage/contact_screen.dart';
import 'package:flexi_business_hub/screens/drawerpage/info_screen.dart';
import 'package:flexi_business_hub/screens/drawerpage/product_screen.dart';
import 'package:flexi_business_hub/screens/forgotpassword/forgot_password_screen.dart';
import 'package:flexi_business_hub/screens/login/login_screen.dart';
import 'package:flexi_business_hub/screens/member/member_screen.dart';
import 'package:flexi_business_hub/screens/products/product_add.dart';
import 'package:flexi_business_hub/screens/products/product_detail.dart';
import 'package:flexi_business_hub/screens/products/product_update.dart';
import 'package:flexi_business_hub/screens/register/register_screen.dart';
import 'package:flexi_business_hub/screens/welcome/welcome_screen.dart';

class AppRouter {
  //Router Map Key
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String register = 'register';
  static const String forgotPassword = 'forgotPassword';
  static const String dashboard = 'dashboard';
  static const String info = 'info';
  static const String about = 'about';
  static const String contact = 'contact';
  static const String productAdd = 'productAdd';
  static const String productDetail = 'productDetail';
  static const String productUpdate = 'productUpdate';
  static const String productScreen = 'productScreen';
  static const String billAdd = 'billAdd';
  static const String billUpdate = 'billUpdate';
  static const String memberScreen = 'memberScreen';
  
  
  //Ronter Map
  static get routes => {
        welcome: (context) => WelcomeScreen(),
        login: (context) => LoginScreen(),
        register: (context) => RegisterScreen(),
        forgotPassword: (context) => ForgotPasswordScreen(),
        dashboard: (context) => DashboardScreen(),
        info: (context) => InfoScreen(),
        about: (context) => AboutScreen(),
        contact: (context) => ContactScreen(),
        productAdd: (context) => ProductAdd(),
        productDetail: (context) => ProductDetail(),
        productUpdate: (context) => ProductUpdate(),      
        productScreen: (context) => ProductScreen(),
        billAdd: (context) => BillAdd(),     
        billUpdate: (context) => BillUpdate(),
        memberScreen: (context) => MemberScreen(),
      };
}
