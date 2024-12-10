import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../ip.dart';

class tparentdetails extends StatefulWidget {
  final String email;
  const tparentdetails({Key? key,required this.email}) : super(key: key);

  @override
  State<tparentdetails> createState() => _tparentdetailsState();
}

class _tparentdetailsState extends State<tparentdetails> {
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
          parentAge = int.parse(jsonResponse['parentage']);
          registrationDate = jsonResponse['registereddate'];
          childName = jsonResponse['childname'];
          childAge = int.parse(jsonResponse['childage']);
          childDiagnosis = jsonResponse['childdiagnosis'];
          profileimage = jsonResponse['profileimage'];
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
                          'பெற்றோர்\n       விவரங்கள்',
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
                          text: 'பெற்றோர் பெயர் : ',
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
                          text: 'பெற்றோர் வயது: ',
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
                          text: 'பதிவன தேதி : ',
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
                          text: 'குழந்தைபின் பெயர் : ',
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
                          text: 'குழந்தையின் வயது: ',
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
                          text: 'குழந்தையின் அறிகுறி : ',
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
