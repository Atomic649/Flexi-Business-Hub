import 'package:flexi_business_hub/connection_tap/shop/account.dart';
import 'package:flexi_business_hub/connection_tap/shop/agency_marketting.dart';
import 'package:flexi_business_hub/connection_tap/shop/bank.dart';
import 'package:flexi_business_hub/connection_tap/shop/business_coach.dart';
import 'package:flexi_business_hub/connection_tap/shop/inventory.dart';
import 'package:flexi_business_hub/connection_tap/shop/oem_factory.dart';
import 'package:flexi_business_hub/connection_tap/shop/packaging.dart';
import 'package:flutter/material.dart';

class BusinessShop extends StatelessWidget {
  const BusinessShop({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 7,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              labelPadding: EdgeInsets.all(12),
              indicatorColor: Color(0xFF00FFC8),
              indicatorWeight: 5,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              unselectedLabelStyle: TextStyle(
                  color: Color(0xFF8400FF),
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
              unselectedLabelColor: Color.fromARGB(255, 76, 76, 116),
              labelColor: Color(0xFF004CFF),
              labelStyle: TextStyle(
                  color: Color(0xFF004CFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
              tabs: [
                Tab(
                    text: 'Loan',
                    icon: Icon(
                      Icons.monetization_on_rounded,
                    )),
                Tab(
                    text: 'Coach',
                    icon: Icon(
                      Icons.person_pin_sharp,
                    )),
                Tab(
                    text: 'OEM',
                    icon: Icon(
                      Icons.factory,
                    )),
                Tab(
                    text: 'Agency',
                    icon: Icon(
                      Icons.newspaper,
                    )),
                Tab(
                    text: 'Package',
                    icon: Icon(
                      Icons.photo_filter_rounded,
                    )),
                Tab(
                    text: 'Account',
                    icon: Icon(
                      Icons.price_change,
                    )),
                Tab(
                    text: 'Inventory',
                    icon: Icon(
                      Icons.inventory,
                    )),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                //1st tab
                Bank(),
                BusinessCoach(),
                OEMFactory(),
                AgencyMarketing(),
                Packaging(),
                Account(),
                Inventory()

                //2nd tab

                //3rd tab
              ]),
            )
          ],
        ),
      ),
    );
  }
}
