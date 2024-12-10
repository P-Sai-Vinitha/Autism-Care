import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../ip.dart';

class pd extends StatefulWidget {
  final String email;

  const pd({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  _pdState createState() => _pdState();
}

class _pdState extends State<pd> {
  String parentName = '';
  int parentAge = 0;
  String registrationDate = '';
  String childName = '';
  int childAge = 0;
  String childDiagnosis = '';
  String profileimage = '';

  Future<void> _fetchParentDetails() async {
    try {
      final response = await http.post(
        Uri.parse('$ip/pdetails.php'),
        body: {'email': widget.email},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'failure') {
          throw Exception(jsonResponse['message']);
        }

        setState(() {
          parentName = jsonResponse['parentname'];
          parentAge = jsonResponse['parentage'];
          registrationDate = jsonResponse['registereddate'];
          childName = jsonResponse['childname'];
          childAge = jsonResponse['childage'];
          childDiagnosis = jsonResponse['childdiagnosis'];
          profileimage=jsonResponse['profileimage'];
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchParentDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8689A1), // Page background color
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: SizedBox(
            height: 677,
            width: 330,
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(0xFFD3D7F8), // Color of the rectangular box
                borderRadius: BorderRadius.circular(15.0), // Rounded radius
                border: Border.all(
                  // Add border here
                  color: Color(0xFFB0B7FF), // Stroke color
                  width: 5.0, // Stroke width
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30), // Padding top 30 for the image and text
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: MemoryImage(
                            base64Decode(profileimage),
                          ),
                          radius: 40,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'PARENT DETAILS',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Parent Name : ',
                        ),
                        TextSpan(
                          text: parentName,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Parent Age: ',
                        ),
                        TextSpan(
                          text: '$parentAge', // Display parent age dynamically
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Registered On(date) : ',
                        ),
                        TextSpan(
                          text: registrationDate, // Display registration date dynamically
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Child Name: ',
                        ),
                        TextSpan(
                          text: childName, // Display child name dynamically
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Child Age : ',
                        ),
                        TextSpan(
                          text: '$childAge', // Display child age dynamically
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Child Diagnosis: ',
                        ),
                        TextSpan(
                          text: childDiagnosis, // Display child diagnosis dynamically
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
