import 'package:flutter/material.dart';
import 'package:flutter_node_store/screens/buttomnavpage/statistic/cash_report.dart';
import 'package:flutter_node_store/screens/buttomnavpage/statistic/daily_report.dart';
import 'package:flutter_node_store/screens/buttomnavpage/statistic/monthly_report.dart';
import 'package:flutter_node_store/screens/buttomnavpage/statistic/tax_report.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              indicatorColor: Color(0xFF00FF22),
              indicatorWeight: 5,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              tabs: [
                Tab(icon: Icon(Icons.star, color: Color(0xFF004CFF))),
                Tab(icon: Icon(Icons.calendar_month, color: Color(0xFF004CFF))),
                Tab(icon: Icon(Icons.privacy_tip, color: Color(0xFF004CFF))),
                Tab(icon: Icon(Icons.monetization_on_rounded, color: Color(0xFF004CFF))),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                //1st tab
                DailyReport(),                
                MonthlyReport(),
                TaxReport(),
                CashReport()

                //3rd tab

              ]),
            )
          ],
        ),
      ),
    );
  }
}
