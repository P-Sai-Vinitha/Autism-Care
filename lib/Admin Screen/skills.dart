import 'package:autisa/Admin%20Screen/play.dart';
import 'package:autisa/Admin%20Screen/selfhelp.dart';
import 'package:autisa/Admin%20Screen/social.dart';
import 'package:autisa/Admin%20Screen/handling.dart';
import 'package:flutter/material.dart';

class skills extends StatefulWidget {
  const skills({Key? key}) : super(key: key);

  @override
  State<skills> createState() => _skillsState();
}

class _skillsState extends State<skills> {
  void _navigateToSkillsPage(String pageTitle) {
    // You need to define navigation logic here
    switch (pageTitle) {
      case 'Social Skills':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => social()),
        );
        break;
      case 'Play Skills':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => play()),
        );
        break;
      case 'Self-Help Skills':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => selfhelp()),
        );
        break;
      case 'Handling Behaviour Issues':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => handling()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define padding for specific containers
    EdgeInsets containerPadding = EdgeInsets.symmetric(vertical: 20, horizontal: 20);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 80),
            GestureDetector(
              onTap: () => _navigateToSkillsPage('Social Skills'),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF353271),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: containerPadding,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Social Skills',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () => _navigateToSkillsPage('Play Skills'),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF353271),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: containerPadding,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Play Skills',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () => _navigateToSkillsPage('Self-Help Skills'),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF353271),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: containerPadding,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Self-Help Skills',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () => _navigateToSkillsPage('Handling Behaviour Issues'),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF353271),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: containerPadding,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Handling Behaviour Issues',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Image.asset(
              'assets/img_9.png', // Replace 'your_image.png' with your actual image asset path
              height: 400,
              width: 400,
            ),
          ],
        ),
      ),
    );
  }
}

class SocialSkillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Skills Page'),
      ),
      body: Center(
        child: Text('This is the Social Skills page.'),
      ),
    );
  }
}

class PlaySkillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Skills Page'),
      ),
      body: Center(
        child: Text('This is the Play Skills page.'),
      ),
    );
  }
}

class SelfHelpSkillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Self-Help Skills Page'),
      ),
      body: Center(
        child: Text('This is the Self-Help Skills page.'),
      ),
    );
  }
}

class BehaviourIssuesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Behaviour Issues Page'),
      ),
      body: Center(
        child: Text('This is the Behaviour Issues page.'),
      ),
    );
  }
}
