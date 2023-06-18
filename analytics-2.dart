import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'searchbar.dart';
import 'dart:math' as math;
import 'main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'mylistings.dart';

class Analytics2 extends StatefulWidget {
  @override
  State<Analytics2> createState() => _Analytics2State();
}

class _Analytics2State extends State<Analytics2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Analytic2());
  }
}

class Analytic2 extends StatefulWidget {
  @override
  State<Analytic2> createState() => _Analytic2State();
}

class _Analytic2State extends State<Analytic2> {
  OverlayEntry? entry;
  bool NotificationisActive = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (_) => ChatBot(),
            //     ));
          },
          backgroundColor: const Color.fromRGBO(75, 173, 86, 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
              topLeft: Radius.circular(100),
            ),
          ),
          child: const Image(
            width: 35,
            height: 35,
            image: AssetImage('images/chatbot-icon.png'),
          ),
        ),
        appBar: AppBar(
          shadowColor: Colors.black,
          centerTitle: true,
          elevation: 1,
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          title: const Image(
            width: 97.5,
            height: 40.0,
            image: AssetImage("images/bargAIn-logo.png"),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_outlined,
                  color: Color.fromRGBO(75, 173, 86, 1),
                ))
          ],
        ),
        body: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List cardNumbers = ['123 123 1234', '456 762 9821'];
  List cardMoney = ['17.75', '13.00'];
  int currentCardIndex = 0;
  double width = double.maxFinite;
  //List<Widget> returnOffers() {}
  List<Widget> returnCircleDots() {
    List<Widget> circleDots = [];
    for (int i = 0; i < cardNumbers.length; i++) {
      if (i == currentCardIndex) {
        circleDots.add(const Icon(
          Icons.circle,
          color: Colors.white,
          size: 7.0,
        ));
      } else {
        circleDots.add(const Icon(
          Icons.circle_outlined,
          color: Colors.white,
          size: 7.0,
        ));
      }
    }
    return circleDots;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool inListings = true;
    //707 height for small phone, 867 height for large phone, width 411
    int elementWidth = screenSize.height < 999 ? 0 : 30;
    int elementHeight = screenSize.height < 1000 ? 0 : 30;
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
    ];
    List<String> selectedItems = [];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomePage(),
                              ));
                        },
                        child: Text(
                          "Buy Products",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Color.fromRGBO(75, 173, 86, 1),
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MyListings(),
                              ));
                        },
                        child: Text(
                          "My Listings",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Color.fromRGBO(75, 173, 86, 1),
                            fontSize: 20.0,
                          ),
                        ),
                      )
                    ]),
                Row(children: [
                  Container(
                    width: 205,
                    height: 4,
                    decoration: (BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: inListings
                            ? [
                                Color.fromRGBO(255, 255, 255, 1),
                                Color.fromRGBO(255, 255, 255, 1)
                              ]
                            : [
                                Color.fromRGBO(75, 173, 86, 1),
                                Color.fromRGBO(34, 179, 174, 1)
                              ],
                      ),
                    )),
                  ),
                  Container(
                    width: 205,
                    height: 4,
                    decoration: (BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(75, 173, 86, 1),
                          Color.fromRGBO(34, 179, 174, 1)
                        ],
                      ),
                    )),
                  )
                ]),
                SizedBox(height: 5),
                Text(
                  'Analytics Overview',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(75, 173, 86, 1),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'iPhone 14 Pro 128GB',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(75, 173, 86, 1),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 20),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.resolveWith(
                                (states) => 20.0),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.white),
                            shadowColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.resolveWith(
                                (states) => Size(138.0 + elementHeight,
                                    131.0 + elementWidth))),
                        child: Column(
                          children: [
                            Text(
                              "26,322",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color.fromRGBO(75, 173, 86, 1),
                                fontSize: elementHeight != 0 ? 30.0 : 30.0,
                              ),
                            ),
                            Text(
                              "AED",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color.fromRGBO(75, 173, 86, 1),
                                fontSize: elementHeight != 0 ? 12.0 : 12.0,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Total Revenue",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color.fromRGBO(75, 173, 86, 1),
                                fontSize: elementHeight != 0 ? 16.0 : 16.0,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.resolveWith(
                                (states) => 20.0),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.white),
                            shadowColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.resolveWith(
                                (states) => Size(138.0 + elementHeight,
                                    131.0 + elementWidth))),
                        child: Column(
                          children: [
                            Text(
                              "460,233",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color.fromRGBO(75, 173, 86, 1),
                                fontSize: elementHeight != 0 ? 30.0 : 30.0,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Impressions",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color.fromRGBO(75, 173, 86, 1),
                                fontSize: elementHeight != 0 ? 16.0 : 16.0,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                    ]),
                SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 20),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.resolveWith(
                                (states) => 20.0),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.white),
                            shadowColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.resolveWith(
                                (states) => Size(138.0 + elementHeight,
                                    131.0 + elementWidth))),
                        child: Column(
                          children: [
                            Text(
                              "102,034",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color.fromRGBO(75, 173, 86, 1),
                                fontSize: elementHeight != 0 ? 30.0 : 30.0,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Reach",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color.fromRGBO(75, 173, 86, 1),
                                fontSize: elementHeight != 0 ? 16.0 : 16.0,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.resolveWith(
                                (states) => 20.0),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.white),
                            shadowColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.resolveWith(
                                (states) => Size(138.0 + elementHeight,
                                    131.0 + elementWidth))),
                        child: Column(
                          children: [
                            Text(
                              "Predicted",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color.fromRGBO(75, 173, 86, 1),
                                fontSize: elementHeight != 0 ? 16.0 : 16.0,
                              ),
                            ),
                            Text(
                              "1d",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color.fromRGBO(75, 173, 86, 1),
                                fontSize: elementHeight != 0 ? 30.0 : 30.0,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Until Restock",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color.fromRGBO(75, 173, 86, 1),
                                fontSize: elementHeight != 0 ? 16.0 : 16.0,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                    ]),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 20.0),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white),
                      shadowColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.resolveWith((states) =>
                          Size(350.0 + elementHeight, 200.0 + elementWidth))),
                  child: Column(
                    children: [
                      Text(
                        "Sentiment Score: 70",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color.fromRGBO(75, 173, 86, 1),
                          fontSize: elementHeight != 0 ? 30.0 : 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        SizedBox(width: 10),
                        Row(children: [
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Color.fromRGBO(75, 173, 86, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Color.fromRGBO(75, 173, 86, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Color.fromRGBO(75, 173, 86, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Color.fromRGBO(75, 173, 86, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Color.fromRGBO(217, 217, 217, 1),
                          ),
                        ]),
                        SizedBox(width: 40),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.resolveWith(
                                  (states) => 20.0),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) =>
                                      Color.fromRGBO(75, 173, 86, 1)),
                              shadowColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.black),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.resolveWith(
                                  (states) => Size(160.0 + elementHeight,
                                      50.0 + elementWidth))),
                          child: Text(
                            "View More",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: elementHeight != 0 ? 23.0 : 23.0,
                            ),
                          ),
                        ),
                      ]),
                      Row(children: [])
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Row(children: [
                  SizedBox(width: 30),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 20.0),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Color.fromRGBO(75, 173, 86, 1)),
                        shadowColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.resolveWith(
                            (states) => Size(
                                130.0 + elementHeight, 30.0 + elementWidth))),
                    child: Text(
                      "Promote",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: elementHeight != 0 ? 20.0 : 20.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 20.0),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Color.fromRGBO(75, 173, 86, 1)),
                        shadowColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.resolveWith(
                            (states) => Size(
                                130.0 + elementHeight, 30.0 + elementWidth))),
                    child: Text(
                      "Restock",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: elementHeight != 0 ? 20.0 : 20.0,
                      ),
                    ),
                  ),
                ])
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );
  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(),
                  ));
            },
          )
        ],
      );
}
