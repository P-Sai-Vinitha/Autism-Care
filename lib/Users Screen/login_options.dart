import 'package:autisa/Admin%20Screen/adminlogin.dart';
import 'package:autisa/Doctors%20Screen/doctorlogin.dart';
import 'package:autisa/Users%20Screen/parentlogin.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    MaterialPageRoute(builder: (context) => ParentLogin()),
                  );
                  // Add functionality for parent login
                },
                child: Text('Parent',
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
                    MaterialPageRoute(builder: (context) => doctorlogin()),
                  );
                  // Add functionality for doctor login
                },
                child: Text('Doctor',
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
                    MaterialPageRoute(builder: (context) => AdminLogin()),
                  );
                  // Add functionality for admin login
                },
                child: Text('Admin',
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
