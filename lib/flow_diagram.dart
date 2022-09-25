import 'package:flutter/material.dart';

class Diagram extends StatefulWidget {
  const Diagram({super.key});

  @override
  State<Diagram> createState() => _DiagramState();
}

class _DiagramState extends State<Diagram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flow Diagram",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        leading: Image.asset('assets/images/logo.png'),
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(25.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 10,
            color: Colors.pink,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Image.asset('assets/images/flow.jpeg'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("GO Back"),
              
            ),
          )
        ],
      ),
    );
  }
}
