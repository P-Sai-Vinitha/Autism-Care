import 'dart:convert';
import 'package:autisa/Users%20Screen/tchilddetails.dart';
import 'package:autisa/Users%20Screen/thbi.dart';
import 'package:autisa/Users%20Screen/tparentdetails.dart';
import 'package:autisa/Users%20Screen/tps.dart';
import 'package:autisa/Users%20Screen/tshs.dart';
import 'package:autisa/Users%20Screen/tss.dart';
import 'package:autisa/Users%20Screen/tuserprogress.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:autisa/Users%20Screen/parentlogin.dart';
import 'dart:math';
import '../ip.dart';
import 'childdetails.dart';
import 'package:autisa/Users%20Screen/hbi.dart';
import 'parentdetails.dart';
import 'userprogress.dart';
import 'package:autisa/Users%20Screen/ps.dart';
import 'package:autisa/Users%20Screen/shs.dart';
import 'package:autisa/Users%20Screen/ss.dart';

class tprogress extends StatefulWidget {
  final String email;

  const tprogress({Key? key, required this.email}) : super(key: key);

  @override
  State<tprogress> createState() => _tprogressState();
}

class _tprogressState extends State<tprogress> {
  double totalProgress = 0.0;
  double socialSkillsProgress = 0.0;
  double playSkillsProgress = 0.0;
  double selfHelpSkillsProgress = 0.0;
  double handlingBehavioralIssuesProgress = 0.0;
  String childName = ''; // Added variable to hold child name
  String profileimage = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchChildData();
    fetchProgressData();
  }

  Future<void> fetchChildData() async {
    try {
      final response = await http.post(
        Uri.parse('$ip/menu.php'),
        body: {'email': widget.email},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'failure') {
          throw Exception(jsonResponse['message']);
        }

        setState(() {
          childName = jsonResponse['childname'];
          profileimage = jsonResponse['profileimage'];
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> fetchProgressData() async {
    try {
      final response = await http.post(
        Uri.parse('$ip/graph.php'), // Replace with your PHP endpoint
        body: json.encode({'email': widget.email}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          totalProgress = double.parse(data['overallPercentage'].toString());
          socialSkillsProgress = double.parse(data['socialSkillsPercentage'].toString());
          playSkillsProgress = double.parse(data['playSkillsPercentage'].toString());
          selfHelpSkillsProgress = double.parse(data['selfHelpSkillsPercentage'].toString());
          handlingBehavioralIssuesProgress = double.parse(data['behavioralIssuesPercentage'].toString());
        });
      } else {
        throw Exception('Failed to load progress data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD3D7F8),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'முதன்மை பக்கம்',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFD3D7F8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: MemoryImage(
                      base64Decode(profileimage),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    childName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.email,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.black),
              title: Text('முதன்மை பக்கம்', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.child_care, color: Colors.black),
              title: Text('குழந்தை விவரங்கள்', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => tchilddetails(
                      email: widget.email,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.black),
              title: Text('பெற்றோர் விவரங்கள்', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => tparentdetails(
                      email: widget.email,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.timeline, color: Colors.black),
              title: Text('பகுப்பாய்வு', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => tuserprogress(email: widget.email)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.black), // Sign Out Icon
              title: Text('வெளியேறு', style: TextStyle(color: Colors.black)), // Sign Out Text
              onTap: () {
                // Navigate to Parent Login Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ParentLogin()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'மொத்தம்',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                CircularProgressBar(
                  percentage: totalProgress,
                  size: 180,
                  strokeWidth: 14,
                  onTap: () {
                    // Handle tap event
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildSkillColumn('சமூக திறன்', socialSkillsProgress, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => tss(email: widget.email)),
                      );
                    }),
                    _buildSkillColumn('விளையாட்டு திறன்', playSkillsProgress, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => tps(email: widget.email)),
                      );
                    }),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildSkillColumn('சுய உதவி திறன்', selfHelpSkillsProgress, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => tshs(email: widget.email)),
                      );
                    }),
                    _buildSkillColumn('நடைமுறை சிக்கல்கள் தீர்க்கும்', handlingBehavioralIssuesProgress, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => thbi(email: widget.email)),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillColumn(String label, double progress, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircularProgressBar(
            percentage: progress,
            size: 125,
            onTap: onTap,
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 160,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularProgressBar extends StatelessWidget {
  final double percentage;
  final VoidCallback? onTap;
  final double size;
  final double strokeWidth;

  const CircularProgressBar({
    required this.percentage,
    this.onTap,
    this.size = 100,
    this.strokeWidth = 8,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _CircularProgressPainter(progress: percentage),
          child: Center(
            child: Text(
              '$percentage%',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class _CircularProgressPainter extends CustomPainter {
  final double progress;

  _CircularProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..strokeWidth = 12
      ..color = Color(0xFFD3D7F8)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Rect rect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2);

    final double sweepAngle = pi * 2 * progress / 100;

    canvas.drawArc(rect, -pi / 2, pi * 2, false, backgroundPaint); // Draw background arc

    final Paint paint = Paint()
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final gradient = SweepGradient(
      colors: [
        Color(0xFF423DA1),
        Color(0xFF9D3D9F),
        Color(0xFF050220),
        Color(0xFF423DA1),
      ],
      stops: [0.0, 0.33, 0.66, 1.0],
    );

    paint.shader = gradient.createShader(rect);

    canvas.drawArc(rect, -pi / 2, sweepAngle, false, paint); // Draw progress arc
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TamilPage extends StatelessWidget {
  final String email;

  const TamilPage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tamil Page'),
      ),
      body: Center(
        child: Text(
          'Tamil Content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
