import 'package:flutter/material.dart';

class BusinessGemini extends StatelessWidget {
  const BusinessGemini({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
        width: double.infinity,
        height: 80,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: Colors.white, // Replace with your desired background color
          borderRadius:
              BorderRadius.circular(20.0), // Adjust for desired rounding
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Color(0xFF2B00FF), // Adjust color and opacity
              spreadRadius: 0.5,
              blurRadius: 3.0,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: const Row(
          children: <Widget>[
            Icon(
              Icons.message, // Replace with your desired icon
              color: Color.fromARGB(
                  255, 200, 200, 200), // Replace with your desired icon color
            ),
            SizedBox(width: 10.0), // Adjust the width for desired spacing
            Expanded(
              // Wrap the TextField in an Expanded widget to fill the available space
              child: TextField(
                decoration: InputDecoration(
                  border:
                      InputBorder.none, // No border to maintain the flat design
                  hintText: 'Message Flexi Asistance...', // Placeholder text
                  hintStyle: TextStyle(
                    color: Colors.grey, // Placeholder text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
