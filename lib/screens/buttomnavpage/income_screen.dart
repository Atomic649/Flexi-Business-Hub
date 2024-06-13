import 'package:flexi_business_hub/app_router.dart';
import 'package:flexi_business_hub/models/bill_model.dart';
import 'package:flexi_business_hub/screens/bills/components/bill_items.dart';
import 'package:flexi_business_hub/services/API/rest_api_bill.dart';
import 'package:flutter/material.dart';


//--------------สร้างตัวแปร refreshKey สำหรับการ RefreshIndicator-----------------//
var refreshKey = GlobalKey<RefreshIndicatorState>();
//-----------------------------------------------------------------------------//

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {},
          child: FutureBuilder(
            future: CallAPI().getAllBills(),
            builder: (context, AsyncSnapshot snapshot) {
              // กรณีที่มี error
              if (snapshot.hasError) {
                return const Center(
                  child: Text('มีข้อผิดพลาด โปรดลองใหม่อีกครั้ง'),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                // กรณีที่โหลดข้อมูลสำเร็จ
                List<BillModel> bills = snapshot.data;
                return ListView.builder(
                    itemCount: bills.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 1, left: 2.0, right: 2.0),
                        child: SizedBox(
                          height: 115,
                          width: double.infinity,                          
                          child: //Text(' รายการสั่งซื้อ : ${bills[index].customerName}'),
                              Dismissible(
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              setState(() {
                                CallAPI().deleteBillAPI(bills[index].id!);
                                bills.removeAt(index);
                                refreshKey.currentState!.show();
                              });
                            },
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 25.0),
                              color: Colors.red,
                              child: const Icon(Icons.delete, color: Colors.white),
                            ),
                            key: UniqueKey(),
                            child: BillItem(
                              bill: bills[index],
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRouter.billUpdate, arguments: {
                                  'bills': bills[index].toJson()
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                // กรณีที่กำลังโหลดข้อมูล
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF01FFFF),
            foregroundColor: Color(0xFF061E54),
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color: Color(0xFF061E54)),
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.billAdd);
            }));
  }
}
