import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:jsk_app/info_menu.dart';

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
      backgroundColor: Colors.black,
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
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            child: NeumorphicButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Info()));
              },
              style: NeumorphicStyle(
                lightSource: LightSource.bottom,
                shape: NeumorphicShape.convex,
                depth: 5,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20.0)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Center(
                  child: Text(
                "Go back",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
