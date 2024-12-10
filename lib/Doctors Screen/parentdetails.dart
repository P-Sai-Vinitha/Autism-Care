import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ip.dart';

class ParentDetails extends StatefulWidget {
  final String parentId;

  const ParentDetails({
    Key? key,
    required this.parentId,
  }) : super(key: key);

  @override
  State<ParentDetails> createState() => _ParentDetailsState();
}

class _ParentDetailsState extends State<ParentDetails> {
  String parentName = '';
  int parentAge = 0;
  String registrationDate = '';
  String childName = '';
  int childAge = 0;
  String childDiagnosis = '';
  String profileImage = '';
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchParentDetails();
  }

  void fetchParentDetails() async {
    try {
      final response = await http.post(
        Uri.parse('$ip/parentdetails.php'),
        body: {'id': widget.parentId}, // Send the parentId in the request body
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['status'] == 'failure') {
          throw Exception(jsonResponse['message']);
        }

        setState(() {
          parentName = jsonResponse['data']['parentname'] ?? '';
          parentAge = jsonResponse['data']['parentage'] ?? 0;
          registrationDate = jsonResponse['data']['registereddate'] ?? '';
          childName = jsonResponse['data']['childname'] ?? '';
          childAge = jsonResponse['data']['childage'] ?? 0;
          childDiagnosis = jsonResponse['data']['childdiagnosis'] ?? '';
          profileImage = jsonResponse['data']['profileimage'] ?? '';
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
        errorMessage = error.toString();
      });
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF8689A1),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
            ? Center(child: Text(errorMessage))
            : Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: SizedBox(
              height: 677,
              width: 330,
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFD3D7F8),
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Color(0xFFB0B7FF),
                    width: 5.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: profileImage.isNotEmpty
                                ? MemoryImage(base64Decode(profileImage))
                                : null,
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
                            text: 'Parent Name: ',
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
                            text: '$parentAge',
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
                            text: 'Registered On(date): ',
                          ),
                          TextSpan(
                            text: registrationDate,
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
                            text: childName,
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
                            text: 'Child Age: ',
                          ),
                          TextSpan(
                            text: '$childAge',
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
                            text: childDiagnosis,
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
      ),
    );
  }
}
