import 'dart:convert';
import 'package:autisa/Admin%20Screen/adminoptions.dart';
import 'package:autisa/Admin%20Screen/skills.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ip.dart';

class adddoctor extends StatefulWidget {
  const adddoctor({Key? key}) : super(key: key);

  @override
  State<adddoctor> createState() => _adddoctorState();
}

class _adddoctorState extends State<adddoctor> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _signUp() async {
    try {
      final response = await http.post(
        Uri.parse('$ip/addpatient.php'),
        body: {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('success')) {
          // Sign-up successful
          // Go back to the previous screen
          Navigator.pop(context);
        } else if (jsonResponse.containsKey('error')) {
          // Display error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(jsonResponse['error'])),
          );
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign up. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150),
              Text(
                'WELCOME!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Add Doctor information',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 50),
              buildTextField('Enter your email', emailController),
              SizedBox(height: 20),
              buildTextField('Enter your password', passwordController, isObscure: true),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A0F59),
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 81),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller, {bool isObscure = false}) {
    return TextField(
      controller: controller,
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
