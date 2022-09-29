import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: prefer_const_constructors

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  int currentIndex = 0;
  late String selected_node;
  List<String> items = [
    'પ્રમાણપત્ર',
    'કાર્ડ',
  ];
  String? selectedItem = 'પ્રમાણપત્ર';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/logo.png'),
        title: const Text(
          "Admin Module",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: currentIndex == 0
          ? SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      )),
                      value: selectedItem,
                      items: items
                          .map((item) =>
                              DropdownMenuItem(value: item, child: Text(item)))
                          .toList(),
                      onChanged: (value) => setState(() {
                        selectedItem = value;
                        selected_node = selectedItem!;
                      }),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20.0),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection(selected_node)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          Text("Loading");
                        } else {
                          List<DropdownMenuItem> subNode = [];
                        }
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20.0),
                    child: TextFormField(
                      minLines: 3,
                      maxLines: 15,
                      decoration: const InputDecoration(
                        labelText: 'List of Documents..',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Add Document"))
                ],
              ),
            )
          : SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      )),
                      value: selectedItem,
                      items: items
                          .map((item) =>
                              DropdownMenuItem(value: item, child: Text(item)))
                          .toList(),
                      onChanged: (value) => setState(() {
                        selectedItem = value;
                      }),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      )),
                      value: selectedItem,
                      items: items
                          .map((item) =>
                              DropdownMenuItem(value: item, child: Text(item)))
                          .toList(),
                      onChanged: (value) => setState(() {
                        selectedItem = value;
                      }),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20.0),
                    child: TextFormField(
                      minLines: 3,
                      maxLines: 15,
                      decoration: const InputDecoration(
                        labelText: 'List of Documents..',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Update Document"),
                  )
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Item",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: "Update Item",
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
