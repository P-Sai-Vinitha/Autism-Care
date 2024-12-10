import 'dart:convert';
import 'dart:io'; // Import the dart:io library

import 'package:autisa/Users%20Screen/parentlogin.dart';
import 'package:autisa/Users%20Screen/progress.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../ip.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late ImagePicker _picker;
  File? _imageFile; // Use File type to store the picked image file

  TextEditingController parentNameController = TextEditingController();
  TextEditingController parentAgeController = TextEditingController();
  TextEditingController childNameController = TextEditingController();
  TextEditingController childAgeController = TextEditingController();
  TextEditingController childDiagnosisController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
  }

  Future<void> _getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(image!.path); // Convert XFile to File
    });
  }

  Future<void> _getImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = File(image!.path); // Convert XFile to File
    });
  }

  Future<void> _sendDetails() async {
    try {
      final response = await http.post(
        Uri.parse('$ip/details.php'),
        body: jsonEncode({
          'parentname': parentNameController.text,
          'parentage': parentAgeController.text,
          'childname': childNameController.text,
          'childage': childAgeController.text,
          'childdiagnosis': childDiagnosisController.text,
          'email': emailController.text,
          'base64image': base64Encode(_imageFile!.readAsBytesSync()), // Convert image to base64
        }),
      );

      if (response.statusCode == 200) {
        print(response.body); // Print the response from the server
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ParentLogin()),
        );
        // Handle response as needed
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
      // Handle error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove the app bar
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                'ENTER DETAILS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              // Circular Image View with Camera Icon
              GestureDetector(
                onTap: () {
                  // Show modal bottom sheet for options
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              leading: Icon(Icons.photo),
                              title: Text('Choose from Gallery'),
                              onTap: () {
                                // Implement gallery access functionality
                                _getImageFromGallery();
                                Navigator.pop(context); // Close the bottom sheet
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.camera_alt),
                              title: Text('Take a Photo'),
                              onTap: () {
                                // Implement camera access functionality
                                _getImageFromCamera();
                                Navigator.pop(context); // Close the bottom sheet
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: _imageFile != null
                      ? CircleAvatar(
                    backgroundImage: FileImage(_imageFile!), // Use FileImage to load image
                    radius: 50,
                  )
                      : Icon(Icons.camera_alt, size: 40),
                ),
              ),
              SizedBox(height: 40),
              // Text Field for Parent Name
              buildTextField('Enter Parent Name', parentNameController),
              SizedBox(height: 10),
              // Text Field for Parent Age
              buildTextField('Enter Parent Age', parentAgeController),
              SizedBox(height: 10),
              // Text Field for Child Name
              buildTextField('Enter Child Name', childNameController),
              SizedBox(height: 10),
              // Text Field for Child Age
              buildTextField('Enter Child Age', childAgeController),
              SizedBox(height: 10),
              // Text Field for Child Diagnosis
              buildTextField('Enter Child Diagnosis', childDiagnosisController),
              SizedBox(height: 10),
              // Text Field for Email
              buildTextField('Enter Email', emailController),
              SizedBox(height: 30),
              // Next Button
              SizedBox(
                width: 100,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: ElevatedButton(
                    onPressed: _sendDetails,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1A0F59), // Change button color
                    ),
                    child: Text('NEXT'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
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
    home: Details(),
  ));
}
