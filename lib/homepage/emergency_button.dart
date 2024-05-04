import 'package:flutter/material.dart';
import 'package:flutter_playground/emergencypage/emergency_page.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({Key? key}) : super(key: key);

  // Function to launch URL
  void _launchURL() async {
    const url = 'https://www.ready.gov/floods';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 25),
      child: ElevatedButton(
        // Switch to emergency response page when this button is pressed
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EmergencyPage()),
          );
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const CircleBorder(side: BorderSide(color: Colors.white, width: 4)), // White stroke around the button
          ),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)), // Adjusted for optimal layout
          backgroundColor: MaterialStateProperty.all(Colors.red),
          elevation: MaterialStateProperty.all(10),
          minimumSize: MaterialStateProperty.all(const Size(300, 300)), // Increased size to fit contents
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.orange; // Splash color when pressed
              }
              return null;
            },
          ),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min, // Ensures the column only takes the space it needs
          children: [
            Icon(Icons.warning_rounded, size: 100, color: Colors.white), // Icon size adjusted
            SizedBox(height: 8), // Space between icon and text
            Text(
              "I'M IN AN EMERGENCY!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18, // Font size adjusted for readability
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}