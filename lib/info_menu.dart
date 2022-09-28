import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jsk_app/documents_list.dart';
import 'package:jsk_app/flow_diagram.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// ignore_for_file: prefer_const_constructors

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Navigation Panel",
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
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  shadowLightColor: Color(0xffff9933).withOpacity(1),
                  shadowDarkColor: Color(0xff198808),
                  depth: 8,
                  lightSource: LightSource.topLeft,
                  color: Colors.white,
                ),
                child: NeumorphicText(
                  "Available Information",
                  style: NeumorphicStyle(
                    depth: 20, //customize depth here
                    color: Colors.blueAccent, //customize color here
                    lightSource: LightSource.bottomRight,
                    shape: NeumorphicShape.convex,
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold //customize size here
                      // AND others usual text style properties (fontFamily, fontWeight, ...)
                      ),
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (BuildContext context) => Documents()));
            //   },
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: const [
            //       Icon(Icons.card_giftcard),
            //       Text("Documents"),
            //       Icon(Icons.arrow_right)
            //     ],
            //   ),
            // ),
            NeumorphicButton(
              padding: EdgeInsets.all(20.0),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Documents()));
              },
              style: NeumorphicStyle(
                lightSource: LightSource.bottom,
                shape: NeumorphicShape.convex,
                depth: 5,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(FontAwesomeIcons.file),
                  Text("Documents"),
                  Container(
                    child: Icon(Icons.arrow_right),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(color: Colors.black, width: 3.0))),
                  ),
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (BuildContext context) => Diagram()));
            //   },
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: const [
            //       Icon(Icons.card_membership),
            //       Text("Process"),
            //       Icon(Icons.arrow_right)
            //     ],
            //   ),
            // ),
            NeumorphicButton(
              margin: EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(20.0),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Diagram()));
              },
              style: NeumorphicStyle(
                lightSource: LightSource.bottom,
                shape: NeumorphicShape.convex,
                depth: 5,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(FontAwesomeIcons.arrowsSpin),
                  Text("Process"),
                  Container(
                    child: Icon(Icons.arrow_right),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(color: Colors.black, width: 3.0))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
