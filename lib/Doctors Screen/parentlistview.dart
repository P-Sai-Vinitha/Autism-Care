import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'parentdetails.dart'; // Adjust the import path as necessary
import '../ip.dart';

class ParentListView extends StatefulWidget {
  const ParentListView({Key? key}) : super(key: key);

  @override
  State<ParentListView> createState() => _ParentListViewState();
}

class _ParentListViewState extends State<ParentListView> {
  TextEditingController _searchController = TextEditingController();
  List<ParentItem> parentItems = [];
  List<ParentItem> filteredParentItems = [];

  @override
  void initState() {
    super.initState();
    fetchParentData();
  }

  void fetchParentData() async {
    var url = Uri.parse('$ip/parentlistview.php');
    var response = await http.post(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        parentItems = data.map((item) => ParentItem.fromJson(item)).toList();
        filteredParentItems = List.from(parentItems);
      });
    } else {
      print('Failed to load parent data');
    }
  }

  void filterParentList(String query) {
    setState(() {
      filteredParentItems = parentItems
          .where((parent) => parent.name.toLowerCase().contains(query.toLowerCase()))
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
                        filterParentList(value);
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
                itemCount: filteredParentItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ParentDetails(parentId: filteredParentItems[index].id),
                        ),
                      );
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
                              base64Decode(filteredParentItems[index].profileImage),
                            ),
                          ),
                          title: Text(filteredParentItems[index].name),
                          subtitle: Text(filteredParentItems[index].details),
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

class ParentItem {
  final String id;
  final String name;
  final String details;
  final String profileImage;

  ParentItem({
    required this.id,
    required this.name,
    required this.details,
    required this.profileImage,
  });

  factory ParentItem.fromJson(Map<String, dynamic> json) {
    return ParentItem(
      id: json['id'].toString(),
      name: json['parentname'] ?? '',
      details: json['details'] ?? 'Details',
      profileImage: json['profileimage'] ?? '',
    );
  }
}
