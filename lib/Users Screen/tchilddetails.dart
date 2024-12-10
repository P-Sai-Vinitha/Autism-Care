import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../ip.dart';

class tchilddetails extends StatefulWidget {
  final String email;

  const tchilddetails({Key? key, required this.email}) : super(key: key);

  @override
  _tchilddetailsState createState() => _tchilddetailsState();
}

class _tchilddetailsState extends State<tchilddetails> {
  List<Map<String, dynamic>> _childList = [];

  Future<void> _fetchChildDetails() async {
    try {
      final response = await http.post(
        Uri.parse('$ip/childdetails.php'),
        body: {'email': widget.email},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        setState(() {
          _childList = jsonResponse.cast<Map<String, dynamic>>();
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
    _fetchChildDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8689A1),
      body: Center(
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
              child: ListView.builder(
                itemCount: _childList.length,
                itemBuilder: (context, index) {
                  final child = _childList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: MemoryImage(
                                base64Decode(child['profileimage']),
                              ),
                              radius: 40,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'குழந்தை\n        விவரங்கள்',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 80),
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
                              text: child['childname'],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
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
                              text: '${child['childage']}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
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
                              text: child['childdiagnosis'],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
