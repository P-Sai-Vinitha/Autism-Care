import 'package:autisa/Admin%20Screen/adddoctor.dart';
import 'package:autisa/Admin%20Screen/skills.dart';
import 'package:flutter/material.dart';
class adminoptions extends StatefulWidget {
  const adminoptions({Key? key}) : super(key: key);

  @override
  State<adminoptions> createState() => _adminoptionsState();
}

class _adminoptionsState extends State<adminoptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/login.jpg',
                height: 400,
                width: 400,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300, height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A0F59),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => adddoctor()),
                  );

                  // Add functionality for parent login
                },
                child: Text('Add Doctor',
                  style: TextStyle(
                    fontSize: 21, // Increased font size
                    fontWeight: FontWeight.bold, // Semibold
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 60, width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A0F59),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => skills()),
                  );
                  // Add functionality for doctor login
                },
                child: Text('Update Video',
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