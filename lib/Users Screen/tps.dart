import 'package:autisa/Users%20Screen/newplayskills.dart';
import 'package:autisa/Users%20Screen/playingtogether.dart';
import 'package:autisa/Users%20Screen/playskills.dart';
import 'package:autisa/Users%20Screen/practiceplay.dart';
import 'package:autisa/Users%20Screen/reinforcement.dart';
import 'package:autisa/Users%20Screen/tnewplayskills.dart';
import 'package:autisa/Users%20Screen/tplayingtogether.dart';
import 'package:autisa/Users%20Screen/tplayskills.dart';
import 'package:autisa/Users%20Screen/tpracticeplay.dart';
import 'package:autisa/Users%20Screen/treinforcement.dart';
import 'package:flutter/material.dart';

class tps extends StatefulWidget {
  final String email;
  const tps({Key? key,required this.email}) : super(key: key);

  @override
  State<tps> createState() => _tpsState();
}

class _tpsState extends State<tps> {
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
            MaterialPageRoute(builder: (context) => tplayskills(email:widget.email ,)),
          );
          // Navigate to socialskills page
        },
      ),
    ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: OptionContainer(
              title: 'ஒன்றாக விளையாடுதல்',
              color: Color(0xFFD3D7F8),
              percentComplete: 75,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => tplayingtogether(email:widget.email ,)),
                );
                // Navigate to EyeContactSkill page
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: OptionContainer(
              title: 'புதிய விளையாட்டு திறன்கள்',
              color: Color(0xFFD3D7F8),
              percentComplete: 25,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => tnewplayskills(email:widget.email ,)),
                );
                // Navigate to PointingSkill page
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: OptionContainer(
              title: 'பயிற்சி விளையாட்டு',
              color: Color(0xFFD3D7F8),
              percentComplete: 90,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => tpracticeplay(email:widget.email ,)),
                );
                // Navigate to ImitationSkill page
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: OptionContainer(
              title: 'வலுவூட்டல்',
              color: Color(0xFFD3D7F8),
              percentComplete: 10,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => treinforcement(email:widget.email ,)),
                );
                // Navigate to JointAttentionSkill page
              },
            ),
          ),
          SizedBox(height: 40),
          Image.asset(
            'assets/img_3.png', // Replace 'your_image.png' with your actual image asset path
            height: 330,
            width: 330,
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
        widget.title == 'ஒன்றாக விளையாடுதல்' ||
        widget.title == 'புதிய விளையாட்டு திறன்கள்' ||
        widget.title == 'பயிற்சி விளையாட்டு' ||
        widget.title == 'வலுவூட்டல்') {
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