// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jsk_app/main.dart';

import 'info_menu.dart';

class collectionData extends StatefulWidget {
  const collectionData({super.key});

  @override
  State<collectionData> createState() => _collectionDataState();
}

List<String> subServices = [];

class _collectionDataState extends State<collectionData> {
  @override
  Widget build(BuildContext context) {
    final msg = ModalRoute.of(context)!.settings.arguments as String;
    getListitems(msg);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),

        title: const Text(
          "Services",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        //leading: Image.asset('assets/images/logo.png'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: subServices.length,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Info(),
                        settings:
                            RouteSettings(arguments: subServices[position])));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    subServices[position],
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Future<void> getListitems(String value) async {
  // Get docs from collection reference
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection(value).get();
  subServices.clear();
  querySnapshot.docs.map((doc) => subServices.add(doc.id.toString())).toList();
}