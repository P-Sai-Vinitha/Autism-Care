import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../ip.dart';

class UserProgress extends StatefulWidget {
  final String email;
  const UserProgress({Key? key, required this.email}) : super(key: key);

  @override
  State<UserProgress> createState() => _UserProgressState();
}

class _UserProgressState extends State<UserProgress> {
  double totalProgress = 0.0;
  double socialSkillsProgress = 0.0;
  double playSkillsProgress = 0.0;
  double selfHelpSkillsProgress = 0.0;
  double behavioralIssuesProgress = 0.0;

  Future<void> _fetchProgressData() async {
    try {
      final response = await http.post(
        Uri.parse('$ip/graph.php'),
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
          behavioralIssuesProgress = double.parse(data['behavioralIssuesPercentage'].toString());
        });
      } else {
        throw Exception('Failed to load progress data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchProgressData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress'),
        backgroundColor: Color(0xFFD3D7F8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'TOTAL',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  CircularProgressBar(progress: totalProgress,size: 170),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircularProgressBar(progress: socialSkillsProgress),
                    SizedBox(height: 10),
                    Text('Social Skills',style: TextStyle(
                      fontSize: 16, // Adjust the font size as per your preference
                    ),),
                  ],
                ),
                SizedBox(width: 40),
                Column(
                  children: [
                    CircularProgressBar(progress: playSkillsProgress),
                    SizedBox(height: 10),
                    Text('Play Skills',style: TextStyle(
                      fontSize: 16, // Adjust the font size as per your preference
                    ),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircularProgressBar(progress: selfHelpSkillsProgress),
                    SizedBox(height: 10),
                    Container(
                      width: 120, // Adjust the width as per your preference
                      child: Text(
                        'Self Help Skills',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16, // Adjust the font size as per your preference
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 40),
                Column(
                  children: [
                    // Specify width for handling behavioral issues progress
                    SizedBox(
                      width: 140,
                      child: Column(
                        children: [
                          CircularProgressBar(progress: behavioralIssuesProgress),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              'Handling Behavioral Issues',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16, // Adjust the font size as per your preference
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircularProgressBar extends StatelessWidget {
  final double progress;
  final double size;

  const CircularProgressBar({required this.progress, this.size = 125});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CircularProgressPainter(progress: progress),
        child: Center(
          child: Text('${progress.toStringAsFixed(0)}%', style: TextStyle(fontSize: 20)),
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

