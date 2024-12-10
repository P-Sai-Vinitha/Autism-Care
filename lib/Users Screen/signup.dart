import 'dart:convert';

import 'package:autisa/Users%20Screen/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../ip.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> _signUp() async {
    try {
      final response = await http.post(
        Uri.parse('$ip/signup.php'),
        body: {
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'confirmPassword': confirmPasswordController.text,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('success')) {
          // Sign-up successful
          // Navigate to the details screen or any other screen as needed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Details()),
          );
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
                'Your information is safe with us',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 40),
              buildTextField('Enter your full name', nameController),
              SizedBox(height: 20),
              buildTextField('Enter your email', emailController),
              SizedBox(height: 20),
              buildTextField('Enter your password', passwordController, isObscure: true),
              SizedBox(height: 20),
              buildTextField('Confirm your password', confirmPasswordController, isObscure: true),
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
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous screen
                  },
                  child: Text(
                    "Already have an account? Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
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

void main() {
  runApp(MaterialApp(
    home: SignUp(),
  ));
}
