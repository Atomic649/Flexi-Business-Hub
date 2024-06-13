import 'package:flutter/material.dart';
import 'package:flexi_business_hub/screens/buttomnavpage/expense/ads_cost.dart';
import 'package:flexi_business_hub/screens/buttomnavpage/expense/others_cost.dart';
class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              indicatorColor: Color.fromARGB(255, 0, 255, 200),
              indicatorWeight: 10,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              unselectedLabelStyle: TextStyle(color: Color(0xFF8400FF),fontWeight: FontWeight.bold),
              labelStyle: TextStyle(color: Color(0xFF004CFF), fontWeight: FontWeight.bold),
              tabs: [
                Tab(  
                  text: 'Ads Cost',                
                  //icon: Icon(Icons.motion_photos_auto, color: Color(0xFF004CFF))
                  ),
                Tab(
                  text: 'Others Cost', 
                  //icon: Icon(Icons.monetization_on_sharp, color: Color(0xFF004CFF))
                  ),
              
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                //1st tab
                AdsCost(),
                OthersCost()
          
              ]),
            )
          ],
        ),
      ),
    );
  }
}
