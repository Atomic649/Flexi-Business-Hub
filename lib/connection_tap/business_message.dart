import 'package:flutter/material.dart';

//---------------------------------------------------------------------------//
class SampleAvatar extends StatelessWidget {
  const SampleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
              width: 80.0,
              height: 80.0,
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              // ignore: prefer_const_constructors
              child: CircleAvatar(
                  backgroundImage: const AssetImage('assets/images/noavartar.png'))),
          Container(
            width: 80.0,
            height: 80.0,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 3, color: Colors.white),
            ),
            // ignore: prefer_const_constructors
          ),
        ]);
  }
}

//---------------------------------------------------------------------------//

class BusinessConnections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 5),
        _buildBusinessConnection(),
        const SizedBox(height: 10),
        _buildMessageList(),
      ],
    );
  }
}

//สร้าง widget สำหรับแสดงข้อมูล Business Connection
Widget _buildBusinessConnection() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 10.0),
        margin: const EdgeInsets.all(5.0),
        height: 80.0,
        child: ListView.separated(
          itemCount: 15,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemBuilder: (_, i) => const SampleAvatar(),
          scrollDirection: Axis.horizontal,
        ),
      ),
    ],
  );
}

// Create ListView Builder for  a scrollable list of message cards
Widget _buildMessageList() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: 15,
    itemBuilder: (_, i) => _buildMessageCard(),
  );
}

Widget _buildMessageCard() {
  return const Card(
    clipBehavior: Clip.antiAlias,
    shadowColor: Color(0xFF2B00FF),
    elevation: 2.0,
    child: ListTile(
      contentPadding: EdgeInsets.all(5.0),
      leading: CircleAvatar(
        radius: 40.0,
        backgroundImage: AssetImage('assets/images/noavartar.png'),
        // Display user image
      ),
      title: Text('User name'), // Display user name
      subtitle: Text('Notification text'), // Display notification text
      trailing: Icon(Icons.navigate_next), // Three-dot menu icon
    ),
  );
}
