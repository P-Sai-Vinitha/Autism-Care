import 'package:autisa/Doctors%20Screen/doctorlogin.dart';
import 'package:flutter/material.dart';

class forgotpass extends StatefulWidget {
  const forgotpass({Key? key}) : super(key: key);

  @override
  State<forgotpass> createState() => _forgotpassState();
}

class _forgotpassState extends State<forgotpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 200),
            Text(
              'ENTER DETAILS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your information is safe with us',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 50),
            buildTextField('Enter your email'),
            SizedBox(height: 20),
            buildTextField('Enter your password', isObscure: true),
            SizedBox(height: 20),
            buildTextField('Confirm your password', isObscure: true),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 60, // Set height to match text fields
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => doctorlogin()),
                  );
                  // Implement next button functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A0F59), // Change button color
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 81),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, {bool isObscure = false}) {
    return TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Color(0xFFD3D7F8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: forgotpass(),
  ));
}
