import 'package:flutter/material.dart';

class Bank extends StatelessWidget {
  const Bank({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'สินเชื่อและบัตรเครดิต เพื่อธุรกิจ',
          style: TextStyle(fontWeight: FontWeight.w400),
        )),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 180,
            // Assuming you have a separate Widget for the horizontal list item
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Replace with your actual number of items
              itemBuilder: (context, index) {
                return HistoryLoanWidget(); // Replace with your custom featured item widget
              },
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: (1 / 1.2),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(10, (index) {
              return LoanWidget(); // Replace with your custom card widget
            }),
          ),
        ],
      ),
    );
  }
}

// You would need to create a separate stateless widget for the featured item
class HistoryLoanWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 150,
      child: Stack(children: [
        Card(
          clipBehavior: Clip.hardEdge,
          shadowColor: Color(0xFF2B00FF),
          elevation: 2.0,
          child: Column(
            children: <Widget>[
              Image(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/loan03.jpg'),
              ),
              SizedBox(height: 10),
              Text('สินเชื่อมณีทันใจ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 25, 0, 150))),
              Text(
                'วงเงิน  100,000',
                style: TextStyle(
                    color: Color.fromARGB(255, 66, 69, 105), fontSize: 12),
              ),
              SizedBox(height: 10),
              Text(
                '2 day ago',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Icon(Icons.star, color: Color(0xFFFF3700)),
        ),
      ]),
    );
  }
}

// You would also create a separate stateless widget for the grid card
class LoanWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const Card(
      clipBehavior: Clip.hardEdge,
      shadowColor: Color(0xFF2B00FF),
      elevation: 2.0,
      child: Column(
        children: <Widget>[
          Image(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/loan03.jpg'),
          ),
          SizedBox(height: 10),
          Text('ABC สินเชื่อธุรกิจทันใจ',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 25, 0, 150))),
          Text(
            'วงเงิน  100,000',
            style: TextStyle(
                color: Color.fromARGB(255, 66, 69, 105), fontSize: 12),
          ),
          Text(
            'รายได้ขั้นต่ํา  100,000',
            style: TextStyle(
                color: Color.fromARGB(255, 66, 69, 105), fontSize: 12),
          ),
          Text(
            'จดทะเบียน <2 ปี',
            style: TextStyle(
                color: Color.fromARGB(255, 66, 69, 105), fontSize: 12),
          ),
          
          
        ],
      ),
    );
  }
}
