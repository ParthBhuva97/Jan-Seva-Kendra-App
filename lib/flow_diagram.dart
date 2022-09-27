import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
          Container(
            height: 500,
            child: GlassmorphicFlexContainer(
              borderRadius: 20,
              blur: 20,
              padding: EdgeInsets.all(40),
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff080808).withOpacity(0.1),
                    Color(0xff1f2687).withOpacity(0.05),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFffffff).withOpacity(0.5),
                  Color((0xFFFFFFFF)).withOpacity(0.5),
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Image.asset(
                  "assets/images/flow.jpeg",
                  height: double.infinity,
                ),
              ),
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
