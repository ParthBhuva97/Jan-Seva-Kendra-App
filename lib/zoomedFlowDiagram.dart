import 'package:flutter/material.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';

void main() {
  runApp(const ZoomedFlow());
}

class ZoomedFlow extends StatelessWidget {
  const ZoomedFlow({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
          "Flow Diagram",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(183, 0, 0, 0),
        ),
        backgroundColor: Color.fromARGB(177, 0, 0, 0),
        //leading: Image.asset('assets/images/logo.png'),
      ),
      body: Container(
        color: Color.fromARGB(216, 0, 0, 0),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 150,
              ),
              Center(
                child: PinchZoomReleaseUnzoomWidget(
                  useOverlay: false,
                  //fingersRequiredToPinch: -1,
                  child: Image.asset('assets/images/flow.jpeg'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
