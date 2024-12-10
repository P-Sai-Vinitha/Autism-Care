import 'package:autisa/Users%20Screen/bathing.dart';
import 'package:autisa/Users%20Screen/brushing.dart';
import 'package:autisa/Users%20Screen/dressing.dart';
import 'package:autisa/Users%20Screen/eating.dart';
import 'package:autisa/Users%20Screen/selfhelpskills.dart';
import 'package:flutter/material.dart';

class shs extends StatefulWidget {
  final String email;
  const shs({Key? key,required this.email}) : super(key: key);

  @override
  State<shs> createState() => _shsState();
}

class _shsState extends State<shs> {
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
                title: 'Introduction',
                color: Color(0xFFD3D7F8),
                percentComplete: 50,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => selfhelpskills(email:widget.email ,)),
                  );
                  // Navigate to socialskills page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'Brushing',
                color: Color(0xFFD3D7F8),
                percentComplete: 75,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => brushing(email:widget.email ,)),
                  );
                  // Navigate to EyeContactSkill page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'Bathing',
                color: Color(0xFFD3D7F8),
                percentComplete: 25,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => bathing(email:widget.email ,)),
                  );
                  // Navigate to PointingSkill page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'Dressing',
                color: Color(0xFFD3D7F8),
                percentComplete: 90,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => dressing(email:widget.email ,)),
                  );
                  // Navigate to ImitationSkill page
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OptionContainer(
                title: 'Eating',
                color: Color(0xFFD3D7F8),
                percentComplete: 10,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => eating(email:widget.email ,)),
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
    if (widget.title == 'Introduction' ||
        widget.title == 'Brushing' ||
        widget.title == 'Bathing' ||
        widget.title == 'Dressing' ||
        widget.title == 'Eating') {
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
