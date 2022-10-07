import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jsk_app/collection_data.dart';
import 'package:jsk_app/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore_for_file: prefer_const_constructors

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MSG {
  final String msg;

  const MSG(this.msg);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            "Jan Seva Kendra",
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
        endDrawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                    child: Column(
                  children: const [
                    Icon(
                      Icons.person,
                      size: 75.0,
                      color: Color.fromARGB(255, 223, 221, 221),
                    ),
                    Text(
                      'Welcome, User',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.login,
                ),
                title: const Text('Login as Administratior'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const Login()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: SizedBox(
                height: 200.0,
                child: ListView(
                  children: [
                    CarouselSlider(
                      items: [
                        //1st Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/banner-1.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/banner-2.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        //3rd Image of Slider
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 200.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 10.0, left: 20.0),
              child: Text(
                "Search for Services :",
                style: TextStyle(
                    color: Color.fromARGB(255, 198, 230, 255), fontSize: 20.0),
              ),
            ),
            GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: DataSearch());
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                // child: TextFormField(
                //   onTap: () {
                //     showSearch(context: context, delegate: DataSearch());
                //   },
                //   readOnly: true,
                //   decoration: const InputDecoration(
                //     labelText: 'Search Anything...',
                //     border: OutlineInputBorder(),
                //     suffixIcon: Icon(Icons.search),
                //   ),
                // ),
                child: Icon(
                  Icons.search,
                  size: 40.0,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 120.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            var url = Uri.parse(
                                "https://www.incometax.gov.in/iec/foportal");

                            _launchUrl(url);
                          },
                          child: Icon(Icons.document_scanner),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text("Certificates"))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            var url = Uri.parse(
                                "https://rajkot.nic.in/service/magistrial/");

                            _launchUrl(url);
                          },
                          child: Icon(Icons.person),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text("Magestrial"))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            var url = Uri.parse(
                                "https://www.digitalgujarat.gov.in/CitizenNew/CitizenServicesNew.aspx");

                            _launchUrl(url);
                          },
                          child: Icon(Icons.folder),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text("Miscellaneous"))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            var url = Uri.parse(
                                "https://iora.gujarat.gov.in/OnlineAppl.aspx");

                            _launchUrl(url);
                          },
                          child: Icon(Icons.monetization_on_sharp),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text("Revenue"))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            var url = Uri.parse(
                                "https://onlinerti.gujarat.gov.in/rti_portal/#:~:text=The%20basic%20object%20of%20the,the%20people%20in%20real%20sense");

                            _launchUrl(url);
                          },
                          child: Icon(Icons.person_pin),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5), child: Text("RTI"))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            var url = Uri.parse(
                                "https://services.india.gov.in/service/detail/gujarat-obtain-widow-certificate");

                            _launchUrl(url);
                          },
                          child: Icon(Icons.security),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text("Social Security"))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            var url = Uri.parse(
                                "https://services.india.gov.in/service/detail/gujarat-obtain-new-ration-card");

                            _launchUrl(url);
                          },
                          child: Icon(Icons.support_outlined),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text("Supply"))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: Text(
                          "Use Our Web App From Here : ",
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          var _url = Uri.parse(
                              'https://ssiptest-6fee6.web.app/pages/dash.html');
                          _launchUrl(_url);
                        },
                        child: Text("Jan Seva Kendra",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 206, 234, 255))),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () {},
                            child: Text("Contact Us")),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  List<String> wlist = [
    'Certificates',
    'Magisterial',
    'Miscellaneous',
    'Revenue',
    'RTI',
    'Social Security',
    'Supply'
  ];
  List<String> recents = [
    'Certificates',
    'Magisterial',
    'Miscellaneous',
    'Revenue',
    'RTI',
    'Social Security',
    'Supply'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "null");
      },
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  void showResults(BuildContext context) {
    if (query.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => collectionData(
              cName: query,
            ),
          ));
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = query.isEmpty
        ? recents
        : wlist.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            query = list[index];
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => collectionData(
                    cName: query,
                  ),
                ));
          },
          leading: Icon(Icons.pages),
          title: RichText(
            text: TextSpan(
              text: list[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: list[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          )),
      itemCount: list.length,
    );
  }
}

Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $_url';
  }
}
