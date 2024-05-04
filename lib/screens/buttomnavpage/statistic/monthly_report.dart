import 'package:flutter/material.dart';

class MonthlyReport extends StatelessWidget {
  const MonthlyReport({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
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
            headingRowColor: MaterialStateProperty.all(const Color(0xFFEEEEEE)),
            dataRowColor: MaterialStateProperty.all(Colors.white),
            headingRowHeight: 40,
            horizontalMargin: 10,
            showCheckboxColumn: true,
            columns: const <DataColumn>[
              DataColumn(label: Text('เดือน')),
              DataColumn(label: Text('ยอดขาย ')),
              DataColumn(label: Text('ค่าแอด')),
              DataColumn(label: Text('ส่วนต่าง')),
              DataColumn(label: Text('%ads')),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('มกราคม')),
                  DataCell(Text('100000 ')),
                  DataCell(Text('30000')),
                  DataCell(Text('+70000',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),)),
                  DataCell(Text('30%')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('กุมภาพันธ์')),
                  DataCell(Text('100000 ')),
                  DataCell(Text('30000')),
                  DataCell(Text('+70000',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),)),
                  DataCell(Text('30%')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('มีนาคม')),
                  DataCell(Text('100000 ')),
                  DataCell(Text('30000')),
                  DataCell(Text('+70000',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),)),
                  DataCell(Text('30%')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('เมษายน')),
                  DataCell(Text('30000 ')),
                  DataCell(Text('50000')),
                  DataCell(Text('-20000',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 77, 0)),)),
                  DataCell(Text('120%')),
            ],
      )],
      ),
        ]
    ),
    );
  }
}