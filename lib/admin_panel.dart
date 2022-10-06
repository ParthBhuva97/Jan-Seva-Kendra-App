import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
// ignore_for_file: prefer_const_constructors

const List<String> list = <String>[
  "Select Service",
  'Certificates',
  'Magisterial',
  'Miscellaneous',
  'Revenue',
  'RTI',
  'Social Security',
  'Supply'
];

List<String> documentsList = [];

final documentController = TextEditingController();

final subServiceController = TextEditingController();

List<String> subServices = ["Select Sub-Service"];

String? cName;

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  int currentIndex = 0;
  // late String selected_node;

  String? dropdownValue = list.first;
  String? subServicesValue = "Select Sub-Service";
  // List<String> items = [
  //   'પ્રમાણપત્ર',
  //   'કાર્ડ',
  // ];
  // String? selectedItem = 'પ્રમાણપત્ર';

  @override
  void initState() {
    super.initState();
    getListitems("Select Service");
  }

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
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 153, 51, 1),
                            Colors.white,
                            Color.fromRGBO(19, 136, 8, 1)
                            //add more colors
                          ],
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(
                                  0, 0, 0, 0.57), //shadow for button
                              blurRadius: 5) //blur radius of shadow
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: DropdownButton(
                          value: dropdownValue,
                          items: list.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value;
                              cName = dropdownValue;
                              getListitems(value!);
                            });
                          },
                          isExpanded:
                              true, //make true to take width of parent widget
                          underline: Container(), //empty line
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 128, 1),
                          ),
                          dropdownColor: Colors.white,
                          iconEnabledColor:
                              Color.fromRGBO(0, 0, 128, 1), //Icon color
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: subServiceController,
                      decoration: const InputDecoration(
                        labelText: 'Sub-Service Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.room_service,
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   width: double.infinity,
                  //   margin: EdgeInsets.all(20.0),
                  //   child: DropdownButtonFormField<String>(
                  //     decoration: InputDecoration(
                  //         enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //       borderSide: BorderSide(width: 3, color: Colors.black),
                  //     )),
                  //     value: selectedItem,
                  //     items: items
                  //         .map((item) =>
                  //             DropdownMenuItem(value: item, child: Text(item)))
                  //         .toList(),
                  //     onChanged: (value) => setState(() {
                  //       selectedItem = value;
                  //       // selected_node = selectedItem!;
                  //     }),
                  //   ),
                  // ),
                  // Container(
                  // width: double.infinity,
                  // margin: EdgeInsets.all(20.0),

                  // child: StreamBuilder<QuerySnapshot>(
                  //   stream: FirebaseFirestore.instance
                  //       .collection("Certificates")
                  //       .snapshots(),
                  //   builder: (context, snapshot) {
                  //     if (!snapshot.hasData) {
                  //       Text("Loading");
                  //       return Scaffold();
                  //     } else {
                  //       List<DropdownMenuItem> subNode = [];
                  //       for (int i = 0;
                  //           i < (snapshot.data!.docs.length);
                  //           i++) {
                  //         DocumentSnapshot snap = snapshot.data!.docs[i];
                  //         subNode.add(
                  //           DropdownMenuItem(
                  //             value: "${snap.id}",
                  //             child: Text(
                  //               snap.id,
                  //               style: TextStyle(color: Color(0xff11b719)),
                  //             ),
                  //           ),
                  //         );
                  //       }
                  //       return DropdownButton(
                  //         items: subNode,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             selectedItem = value;
                  //           });
                  //         },
                  //         value: selectedItem,
                  //         isExpanded: false,
                  //       );
                  //     }
                  //   },
                  // ),
                  // ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20.0),
                    child: TextFormField(
                      minLines: 3,
                      maxLines: 15,
                      controller: documentController,
                      decoration: const InputDecoration(
                          labelText: 'List of Documents..',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.file_copy,
                          )),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection(cName!)
                            .doc(subServiceController.text)
                            .set({"documents": documentController.text});

                        subServiceController.text = "";
                        documentController.text = "";
                      },
                      child: Text("Add Document"))
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 153, 51, 1),
                            Colors.white,
                            Color.fromRGBO(19, 136, 8, 1)
                            //add more colors
                          ],
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(
                                  0, 0, 0, 0.57), //shadow for button
                              blurRadius: 5) //blur radius of shadow
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: DropdownButton(
                          value: dropdownValue,
                          items: list.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value;
                              getListitems(value!);
                            });
                          },
                          isExpanded:
                              true, //make true to take width of parent widget
                          underline: Container(), //empty line
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 128, 1),
                          ),
                          dropdownColor: Colors.white,
                          iconEnabledColor:
                              Color.fromRGBO(0, 0, 128, 1), //Icon color
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 153, 51, 1),
                            Colors.white,
                            Color.fromRGBO(19, 136, 8, 1)
                            //add more colors
                          ],
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(
                                  0, 0, 0, 0.57), //shadow for button
                              blurRadius: 5) //blur radius of shadow
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: DropdownButton(
                          value: subServicesValue,
                          items: subServices.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            setState(() {
                              subServicesValue = value;
                              getDocuments(dropdownValue!, subServicesValue!);
                              documentController.text = "";
                              for (int i = 0; i < documentsList.length; i++) {
                                documentController.text += documentsList[i];
                              }
                            });
                          },
                          isExpanded:
                              true, //make true to take width of parent widget
                          underline: Container(), //empty line
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 128, 1),
                          ),
                          dropdownColor: Colors.white,
                          iconEnabledColor:
                              Color.fromRGBO(0, 0, 128, 1), //Icon color
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   width: double.infinity,
                  //   margin: EdgeInsets.all(20.0),
                  //   child: DropdownButtonFormField<String>(
                  //     decoration: InputDecoration(
                  //         enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //       borderSide: BorderSide(width: 3, color: Colors.black),
                  //     )),
                  //     value: selectedItem,
                  //     items: items
                  //         .map((item) =>
                  //             DropdownMenuItem(value: item, child: Text(item)))
                  //         .toList(),
                  //     onChanged: (value) => setState(() {
                  //       selectedItem = value;
                  //     }),
                  //   ),
                  // ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20.0),
                    child: TextFormField(
                      minLines: 3,
                      maxLines: 12,
                      controller: documentController,
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
                    onPressed: () {
                      updateDocument(dropdownValue!, subServicesValue!);
                    },
                    child: Text("Update Document"),
                  )
                ],
              ),
            ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add),
      //       label: "Add Item",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.update),
      //       label: "Update Item",
      //     ),
      //   ],
      //   currentIndex: currentIndex,
      //   onTap: (int index) {
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      // ),
      bottomNavigationBar: CircleBottomNavigationBar(
        initialSelection: currentIndex,
        circleSize: 50,
        circleColor: Colors.black,
        activeIconColor: Colors.white,
        inactiveIconColor: Colors.grey,
        tabs: [
          TabData(
            icon: Icons.add,
            iconSize: 25, // Optional // Optional
            fontSize: 12, // Optional
          ),
          TabData(icon: Icons.update),
        ],
        onTabChangedListener: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}

Future<void> getListitems(String value) async {
  // Get docs from collection reference
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection(value).get();
  subServices.clear();
  subServices.add("Select Sub-Service");
  querySnapshot.docs.map((doc) => subServices.add(doc.id.toString())).toList();
}

Future<void> getDocuments(String cName, String docData) async {
  DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection(cName).doc(docData).get();
  var snapData = snapshot.data().toString();

  final data = snapData.substring(12, snapData.length - 1);
  documentsList = data.split(";");
}

Future<void> updateDocument(String cName, String docName) async {
  var documents = {'documents': documentController.text};

  await FirebaseFirestore.instance
      .collection(cName)
      .doc(docName)
      .update(documents);
}
