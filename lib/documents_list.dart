import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

List<String> documentsList = [];

class Documents extends StatefulWidget {
  String cName;
  String docName;
  Documents({super.key, required this.cName, required this.docName});

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  @override
  void initState() {
    super.initState();
    getDocuments(widget.cName, widget.docName);
  }

  @override
  Widget build(BuildContext context) {
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
          "Required Documents",
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
          itemCount: documentsList.length,
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  documentsList[position],
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> getDocuments(String cName, String docData) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection(cName).doc(docData).get();
    var snapData = snapshot.data().toString();

    final data = snapData.substring(12, snapData.length - 1);
    setState(() {
      documentsList = data.split(";");
    });
  }
}
