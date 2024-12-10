import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:autisa/Doctors%20Screen/graphdoctor.dart';

import '../ip.dart';

class ChildListView extends StatefulWidget {
  const ChildListView({Key? key}) : super(key: key);

  @override
  State<ChildListView> createState() => _ChildListViewState();
}

class _ChildListViewState extends State<ChildListView> {
  late TextEditingController _searchController;
  List<ChildItem> childItems = [];
  List<ChildItem> filteredChildItems = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    fetchChildData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void fetchChildData() async {
    var url = Uri.parse('$ip/childlistview.php');
    var response = await http.post(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        childItems = data
            .map((item) => ChildItem(
          email: item['email'],
          name: item['childname'],
          details: 'Details',
          profileImage: item['profileimage'],
        ))
            .toList();
        // Initially, set filteredChildItems to be the same as childItems
        filteredChildItems = List.from(childItems);
      });
    } else {
      print('Failed to load child data');
    }
  }

  void filterChildList(String query) {
    setState(() {
      filteredChildItems = childItems
          .where((child) => child.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFCDCDD2),
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        filterChildList(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredChildItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GraphDoctor(childId: filteredChildItems[index].email)),
                      );
                      // Handle item tap
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD3D7F8),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: MemoryImage(
                              base64Decode(filteredChildItems[index].profileImage),
                            ),
                          ),
                          title: Text(filteredChildItems[index].name),
                          subtitle: Text(filteredChildItems[index].details),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChildItem {
  final String email;
  final String name;
  final String details;
  final String profileImage;

  ChildItem({
    required this.email,
    required this.name,
    required this.details,
    required this.profileImage,
  });
}
