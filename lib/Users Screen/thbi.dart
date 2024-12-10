import 'package:autisa/Users%20Screen/aggressivebehaviour.dart';
import 'package:autisa/Users%20Screen/handlingbehavioralissues.dart';
import 'package:autisa/Users%20Screen/repetitivebehaviour.dart';
import 'package:autisa/Users%20Screen/screaming.dart';
import 'package:autisa/Users%20Screen/selfinjuriousbehaviour.dart';
import 'package:autisa/Users%20Screen/taggressivebehaviour.dart';
import 'package:autisa/Users%20Screen/thandlingbehavioralissues.dart';
import 'package:autisa/Users%20Screen/trepetitivebehaviour.dart';
import 'package:autisa/Users%20Screen/tscreaming.dart';
import 'package:autisa/Users%20Screen/tselfinjuriousbehaviour.dart';
import 'package:flutter/material.dart';

class thbi extends StatefulWidget {
  final String email;
  const thbi({Key? key,required this.email}) : super(key: key);

  @override
  State<thbi> createState() => _thbiState();
}

class _thbiState extends State<thbi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'அறிமுகம்',
                color: Color(0xFFD3D7F8),
                percentComplete: 50,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => thandlingbehavioralissues(email:widget.email ,)),
                  );
                  // Navigate to socialskills page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'சுயதீங்கு நடவடிக்கை',
                color: Color(0xFFD3D7F8),
                percentComplete: 75,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tselfinjuriousbehaviour(email:widget.email ,)),
                  );
                  // Navigate to EyeContactSkill page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'ஆக்கிரமிப்பு நடத்தை',
                color: Color(0xFFD3D7F8),
                percentComplete: 25,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => taggressivebehaviour(email:widget.email ,)),
                  );
                  // Navigate to PointingSkill page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'திரும்ப செய்தல்',
                color: Color(0xFFD3D7F8),
                percentComplete: 90,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => trepetitivebehaviour(email:widget.email ,)),
                  );
                  // Navigate to ImitationSkill page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'அலறுதல்',
                color: Color(0xFFD3D7F8),
                percentComplete: 10,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tscreaming(email:widget.email ,)),
                  );
                  // Navigate to JointAttentionSkill page
                },
              ),
            ),
            SizedBox(height: 40),
            Image.asset(
              'assets/img_5.png', // Replace 'your_image.png' with your actual image asset path
              height: 250,
              width: 250,
              // Adjust image fitting as needed
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
    // Define padding for specific containers
    EdgeInsets padding = EdgeInsets.all(10);
    if (widget.title == 'அறிமுகம்' ||
        widget.title == 'சுயதீங்கு நடவடிக்கை' ||
        widget.title == 'ஆக்கிரமிப்பு நடத்தை' ||
        widget.title == 'திரும்ப செய்தல்' ||
        widget.title == 'அலறுதல்') {
      padding = EdgeInsets.symmetric(vertical: 20, horizontal: 20); // Adjust vertical padding
    }

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
          padding: padding,
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
