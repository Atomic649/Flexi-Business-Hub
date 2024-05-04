import 'package:flutter/material.dart';

class AdsCost extends StatelessWidget {
  const AdsCost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   // title: const Text(
        //   //   'Ads Cost',
        //   //   style: TextStyle(
        //   //       color: Color.fromARGB(255, 82, 78, 117),
        //   //       fontWeight: FontWeight.bold),
        //   // ),

        //   actions: [
        //     IconButton(
        //         onPressed: () {},
        //         icon: const Icon(Icons.edit, color: Color(0xFF615F80))),
        //   ],
        // ),

        //#TODO The last Date is Today
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF01FFFF),
          foregroundColor: const Color(0xFF061E54),
          shape: const CircleBorder(),
          onPressed: () {},
          child: const Icon(Icons.edit, color: Color(0xFF615F80)),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            DataTable(
                columnSpacing: 12,
                dividerThickness: 0.05,
                sortAscending: true,
                sortColumnIndex: 0,
                showBottomBorder: true,
                headingTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 26, 18, 109),
                ),
                dataTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 43, 41, 56),
                ),
                headingRowColor: MaterialStateProperty.all(Color(0xFFEEEEEE)),
                dataRowColor: MaterialStateProperty.all(Colors.white),
                headingRowHeight: 40,
                horizontalMargin: 10,
                showCheckboxColumn: true,
                columns: const <DataColumn>[
                  DataColumn(label: Text('วันที่')),
                  DataColumn(label: Text('Tiktok ')),
                  DataColumn(label: Text('Facebook')),
                  DataColumn(label: Text('Shopee')),
                  DataColumn(label: Text('Google ')),
                  DataColumn(label: Text('Youtube ')),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('03/01/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('02/02/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('01/03/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('31/02/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('30/03/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('29/04/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('28/05/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('27/06/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('26/07/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('25/08/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('24/09/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('23/10/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('22/11/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('21/12/2022')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('20/01/2023')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('19/02/2023')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('18/03/2023')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('17/04/2023')),
                      DataCell(Text('100')),
                      DataCell(Text('500')),
                      DataCell(Text('100')),
                      DataCell(Text('200')),
                      DataCell(Text('200')),
                    ],
                  ),
                ]),
          ],
        ));
  }
}
