import 'package:autisa/Users%20Screen/bathing.dart';
import 'package:autisa/Users%20Screen/brushing.dart';
import 'package:autisa/Users%20Screen/dressing.dart';
import 'package:autisa/Users%20Screen/eating.dart';
import 'package:autisa/Users%20Screen/selfhelpskills.dart';
import 'package:autisa/Users%20Screen/tbathing.dart';
import 'package:autisa/Users%20Screen/tbrushing.dart';
import 'package:autisa/Users%20Screen/tdressing.dart';
import 'package:autisa/Users%20Screen/teating.dart';
import 'package:autisa/Users%20Screen/tselfhelpskills.dart';
import 'package:flutter/material.dart';

class tshs extends StatefulWidget {
  final String email;
  const tshs({Key? key,required this.email}) : super(key: key);

  @override
  State<tshs> createState() => _tshsState();
}

class _tshsState extends State<tshs> {
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
                    MaterialPageRoute(builder: (context) => tselfhelpskills(email:widget.email ,)),
                  );
                  // Navigate to socialskills page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'பல் துலக்குதல்',
                color: Color(0xFFD3D7F8),
                percentComplete: 75,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tbrushing(email:widget.email ,)),
                  );
                  // Navigate to EyeContactSkill page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'குளித்தல் ',
                color: Color(0xFFD3D7F8),
                percentComplete: 25,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tbathing(email:widget.email ,)),
                  );
                  // Navigate to PointingSkill page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'ஆடை அணிதல்',
                color: Color(0xFFD3D7F8),
                percentComplete: 90,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tdressing(email:widget.email ,)),
                  );
                  // Navigate to ImitationSkill page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'சாப்பிடுதல்',
                color: Color(0xFFD3D7F8),
                percentComplete: 10,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => teating(email:widget.email ,)),
                  );
                  // Navigate to JointAttentionSkill page
                },
              ),
            ),
            SizedBox(height: 40),
            Image.asset(
              'assets/img_4.png', // Replace 'your_image.png' with your actual image asset path
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
        widget.title == 'பல் துலக்குதல்' ||
        widget.title == 'குளித்தல்' ||
        widget.title == 'ஆடை அணிதல்' ||
        widget.title == 'சாப்பிடுதல்') {
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
