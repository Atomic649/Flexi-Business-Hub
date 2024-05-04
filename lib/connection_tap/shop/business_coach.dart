import 'package:flutter/material.dart';

class BusinessCoach extends StatelessWidget {
  const BusinessCoach({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'โค้ชชิ่งธุรกิจ',
          style: TextStyle(fontWeight: FontWeight.w400),
        )),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 240,
            // Assuming you have a separate Widget for the horizontal list item
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Replace with your actual number of items
              itemBuilder: (context, index) {
                return const TopBusinessCoachWidget(); // Replace with your custom featured item widget
              },
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: (1 / 1.5),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(10, (index) {
              return BusinessCoachWidget(); // Replace with your custom card widget
            }),
          ),
        ],
      ),
    );
  }
}

// You would need to create a separate stateless widget for the featured item
class TopBusinessCoachWidget extends StatelessWidget {
  const TopBusinessCoachWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 150,
      child: Card(                  
        clipBehavior: Clip.hardEdge,
        shadowColor: Color(0xFF2B00FF),
        elevation: 2.0,
        child: Column(            
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
            ),
            Image(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/images/nida.png'),
            ),
            SizedBox(height: 5),
            Text('Coach  Nida',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 25, 0, 150))),
            Text(                
              maxLines: 3,                
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center, 
              softWrap: true,
              'พาคุณบรรลุเป้าหมายธุรกิจและความสัมพันธ์',
              style: TextStyle(
                  color: Color(0xFF424569), fontSize: 12),
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(Icons.star,
                        color: Color.fromARGB(255, 255, 213, 0))),
                SizedBox(width: 3),
                Text(
                  '4.9',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 3),
                Text(
                  '(100)',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// You would also create a separate stateless widget for the grid card
class BusinessCoachWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 150,      
      child: Card(                  
        clipBehavior: Clip.hardEdge,
        shadowColor: Color(0xFF2B00FF),
        elevation: 2.0,
        child: Column(            
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
            ),
            Image(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/images/nida.png'),
            ),
            SizedBox(height: 5),
            Text('Coach  Nida',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 25, 0, 150))),
            Text(                
              maxLines: 3,                
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center, 
              softWrap: true,
              'พาคุณบรรลุเป้าหมายธุรกิจและความสัมพันธ์',
              style: TextStyle(
                  color: Color(0xFF424569), fontSize: 12),
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(Icons.star,
                        color: Color.fromARGB(255, 255, 213, 0))),
                SizedBox(width: 3),
                Text(
                  '4.9',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 3),
                Text(
                  '(100)',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
