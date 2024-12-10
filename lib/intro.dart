import 'package:autisa/Users%20Screen/login_options.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/saveetha medical logo 1.jpg',
                  height: 400,
                  width: 400,
                ),
              ),
            ),
            Text(
              'WELCOME!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Saveetha Autism App',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 90),
            Container(
              width: 300, height: 60, // Adjust the width as needed
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                  // Add your functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A0F59), // Background color
                  foregroundColor: Colors.white, // Text color
                  minimumSize: Size(double.infinity, 81), // Height
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Edge padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 21, // Increased font size
                    fontWeight: FontWeight.bold, // Semibold
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