import 'package:flutter/material.dart';

class OthersCost extends StatelessWidget {
  const OthersCost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10),
        children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              // Upload PDF File Container
              child: Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2B00FF).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ]
                ),
                height: 150,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.upload_file),
                      iconSize: 35,
                      color: Color(0xFFCACACA),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      'Upload PDF File Of  \n Your Business Statment\n AI will detects your expenses atomatically',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 157, 157, 157)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'รายการค่าใช้จ่าย',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 97, 95, 128)),
            ),
            const SizedBox(
              height: 20,
            ),
            DataTable(
                columnSpacing: 40,
                dividerThickness: 0.05,
                sortAscending: true,
                sortColumnIndex: 2,
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
                headingRowColor:
                    MaterialStateProperty.all(const Color(0xFFEEEEEE)),
                dataRowColor: MaterialStateProperty.all(Colors.white),
                headingRowHeight: 40,
                horizontalMargin: 10,
                showCheckboxColumn: true,
                columns: const <DataColumn>[
                  DataColumn(label: Text('วันที่')),
                  DataColumn(label: Text('รายการ')),
                  DataColumn(label: Text('จํานวน')),
                  DataColumn(label: Text('')),
                 
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('Facebook Ads')),
                      const DataCell(Text('5896.42')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                      
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('ค่าส่งของ')),
                      const DataCell(Text('29.00')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                         
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('Tiktok Ads')),
                      const DataCell(Text('6974.20')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                                          
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('Youtube Ads')),
                      const DataCell(Text('5896.42')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                                          
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('กล่องส่งของ')),
                      const DataCell(Text('200.00')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                                          
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('น้ำมันรถ')),
                      const DataCell(Text('500.00')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                                          
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('ค่าส่งของ')),
                      const DataCell(Text('29.00')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                         
                    ],
                  ),DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('ค่าส่งของ')),
                      const DataCell(Text('29.00')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                         
                    ],
                  ),DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('ค่าส่งของ')),
                      const DataCell(Text('29.00')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                         
                    ],
                  ),DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('ค่าส่งของ')),
                      const DataCell(Text('29.00')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                         
                    ],
                  ),DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('ค่าส่งของ')),
                      const DataCell(Text('29.00')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                         
                    ],
                  ),DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('ค่าส่งของ')),
                      const DataCell(Text('29.00')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                         
                    ],
                  ),DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('ค่าส่งของ')),
                      const DataCell(Text('29.00')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                         
                    ],
                  ),DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('ค่าส่งของ')),
                      const DataCell(Text('29.00')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                         
                    ],
                  ),DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('ค่าส่งของ')),
                      const DataCell(Text('29.00')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                         
                    ],
                  ),DataRow(
                    cells: <DataCell>[
                      const DataCell(const Text('02/02/2022')),
                      const DataCell(Text('ค่าส่งของ')),
                      const DataCell(Text('29.00')),
                      DataCell(
                          IconButton(onPressed: () {}, icon: uploadFileIcon())),
                         
                    ],
                  ),
                ])
          ],
        ),
      ]),
    );
  }
}

IconButton uploadFileIcon() {
  return IconButton(
    onPressed: () {},
    icon: const Icon(Icons.upload_file),
    style: IconButton.styleFrom(foregroundColor: Colors.grey[600]),
    iconSize: 20,
  );
}

IconButton groupIcon() {
  return IconButton(
    onPressed: () {},
    icon: const Icon(Icons.group),
    style: IconButton.styleFrom(foregroundColor: Colors.grey[600]),
    iconSize: 20,
  );
}
