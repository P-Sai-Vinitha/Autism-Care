import 'package:autisa/Users%20Screen/eyecontactskill.dart';
import 'package:autisa/Users%20Screen/imitationskill.dart';
import 'package:autisa/Users%20Screen/jointattentionskill.dart';
import 'package:autisa/Users%20Screen/pointingskill.dart';
import 'package:autisa/Users%20Screen/socialskills.dart';
import 'package:autisa/Users%20Screen/teyecontactskill.dart';
import 'package:autisa/Users%20Screen/timitationskill.dart';
import 'package:autisa/Users%20Screen/tpointingskill.dart';
import 'package:autisa/Users%20Screen/tsocialskills.dart';
import 'package:flutter/material.dart';

class tss extends StatefulWidget {
  final String email;
  const tss({Key? key, required this.email}) : super(key: key);

  @override
  State<tss> createState() => _tssState();
}

class _tssState extends State<tss> {
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
                title: 'அறிமுகம்',
                color: Color(0xFFD3D7F8),
                percentComplete: 50,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tsocialskills(email: widget.email,)),
                  );
                  // Navigate to IntroductionOption page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'கண் தொடர்பு திறன்',
                color: Color(0xFFD3D7F8),
                percentComplete: 75,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => teyecontactskill(email: widget.email,)),
                  );
                  // Navigate to EyeContactSkill page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'குறி திறன்',
                color: Color(0xFFD3D7F8),
                percentComplete: 25,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tpointingskill(email: widget.email,)),
                  );
                  // Navigate to PointingSkill page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'அணுகுமுறை திறன்',
                color: Color(0xFFD3D7F8),
                percentComplete: 90,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => timitationskill(email: widget.email,)),
                  );
                  // Navigate to ImitationSkill page
                },
              ),
            ),
            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'கூட்டு கவனத்திறன்',
                color: Color(0xFFD3D7F8),
                percentComplete: 10,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JointAttentionSkill(email: widget.email,)),
                  );
                  // Navigate to JointAttentionSkill page
                },
              ),
            ),
            SizedBox(height: 40),
            Image.asset(
              'assets/img_2.png', // Replace 'your_image.png' with your actual image asset path
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
        widget.title == 'கண் தொடர்பு திறன்' ||
        widget.title == 'குறி திறன்' ||
        widget.title == 'அணுகுமுறை திறன்' ||
        widget.title == 'கூட்டு கவனத்திறன்') {
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
