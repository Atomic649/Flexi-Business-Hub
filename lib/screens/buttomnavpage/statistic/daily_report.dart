import 'package:flutter/material.dart';

class DailyReport extends StatelessWidget {
  const DailyReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              DataColumn(label: Text('วันที่')),
              DataColumn(label: Text('ยอดขาย ')),
              DataColumn(label: Text('ค่าแอด')),
              DataColumn(label: Text('ส่วนต่าง')),
              DataColumn(label: Text('%ads')),
            ],
            rows: const [
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('03/01/2023')),
                  DataCell(Text('10000 ฿')),
                  DataCell(Text('3000 ฿')),
                  DataCell(Text(
                    ' +7000฿',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),
                  )),
                  DataCell(Text('30%')),
                ],                
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('02/01/2023')),
                  DataCell(Text('10000 ฿')),
                  DataCell(Text('3000 ฿')),
                  DataCell(Text(
                    ' +7000฿',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),
                  )),
                  DataCell(Text('30%')),
                ],                
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('01/01/2023')),
                  DataCell(Text('10000 ฿')),
                  DataCell(Text('3000 ฿')),
                  DataCell(Text(
                    ' +7000฿',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),
                  )),
                  DataCell(Text('30%')),
                ],                
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('31/12/2022')),
                  DataCell(Text('10000 ฿')),
                  DataCell(Text('3000 ฿')),
                  DataCell(Text(
                    ' +7000฿',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),
                  )),
                  DataCell(Text('30%')),
                ],                
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('30/12/2022')),
                  DataCell(Text('10000 ฿')),
                  DataCell(Text('12000 ฿')),
                  DataCell(Text(
                    ' -2000฿',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 77, 0)),
                  )),
                  DataCell(Text('120%')),
                ],                
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('29/12/2022')),
                  DataCell(Text('10000 ฿')),
                  DataCell(Text('3000 ฿')),
                  DataCell(Text(
                    ' +7000฿',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),
                  )),
                  DataCell(Text('30%')),
                ],                
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('28/12/2022')),
                  DataCell(Text('10000 ฿')),
                  DataCell(Text('3000 ฿')),
                  DataCell(Text(
                    ' +7000฿',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),
                  )),
                  DataCell(Text('30%')),
                ],                
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('27/12/2022')),
                  DataCell(Text('10000 ฿')),
                  DataCell(Text('3000 ฿')),
                  DataCell(Text(
                    ' +7000฿',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),
                  )),
                  DataCell(Text('30%')),
                ],                
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('26/12/2022')),
                  DataCell(Text('10000 ฿')),
                  DataCell(Text('3000 ฿')),
                  DataCell(Text(
                    ' +7000฿',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),
                  )),
                  DataCell(Text('30%')),
                ],                
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('05/01/2023')),
                  DataCell(Text('10000 ฿')),
                  DataCell(Text('3000 ฿')),
                  DataCell(Text(
                    ' +7000฿',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),
                  )),
                  DataCell(Text('30%')),
                ],                
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('04/01/2023')),
                  DataCell(Text('10000 ฿')),
                  DataCell(Text('3000 ฿')),
                  DataCell(Text(
                    ' +7000฿',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),
                  )),
                  DataCell(Text('30%')),
                ],                
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('03/01/2023')),
                  DataCell(Text('10000 ฿')),
                  DataCell(Text('3000 ฿')),
                  DataCell(Text(
                    ' +7000฿',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 228, 8)),
                  )),
                  DataCell(Text('30%')),
                ],                
              ),
              

            ],
           
          ),
        ],
      ),
    );
  }
}
