import 'package:autisa/Admin%20Screen/playintro.dart';
import 'package:autisa/Admin%20Screen/playnew.dart';
import 'package:autisa/Admin%20Screen/playplaying.dart';
import 'package:autisa/Admin%20Screen/playpractice.dart';
import 'package:autisa/Admin%20Screen/playreinforcement.dart';
import 'package:flutter/material.dart';
class play extends StatefulWidget {
  const play({Key? key}) : super(key: key);

  @override
  State<play> createState() => _playState();
}

class _playState extends State<play> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 70),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'Introduction',
                color: Color(0xFFD3D7F8),
                percentComplete: 50,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => playintro()),
                  );

                  // Handle onTap for Introduction
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'Playing Together',
                color: Color(0xFFD3D7F8),
                percentComplete: 75,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => playplaying()),
                  );
                  // Handle onTap for Eye Contact Skill
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'New Play Skills',
                color: Color(0xFFD3D7F8),
                percentComplete: 25,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => playnew()),
                  );
                  // Handle onTap for Pointing Skill
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'Practice Play',
                color: Color(0xFFD3D7F8),
                percentComplete: 90,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => playpractice()),
                  );
                  // Handle onTap for Imitation Skill
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'Reinforcement',
                color: Color(0xFFD3D7F8),
                percentComplete: 10,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => playreinforcement()),
                  );
                  // Handle onTap for Joint Attention Skill
                },
              ),
            ),
            SizedBox(height: 40),
            Image.asset(
              'assets/img_3.png', // Replace 'your_image.png' with your actual image asset path
              height: 330,
              width: 330,
            ),
          ],
        ),
      ),
    );
  }
}

class OptionContainer extends StatefulWidget {
  final String title;
  final Color color;
  final int percentComplete;
  final VoidCallback onTap;

  const OptionContainer({
    required this.title,
    required this.color,
    required this.percentComplete,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _OptionContainerState createState() => _OptionContainerState();
}

class _OptionContainerState extends State<OptionContainer> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
        if (_expanded) {
          widget.onTap();
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: widget.color,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down), // Static arrow icon
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
