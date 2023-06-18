import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'searchbar.dart';
import 'dart:math' as math;
import 'mylistings.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'category-mobile.dart';
import 'ChatBot.dart';

void main() {
  return runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  OverlayEntry? entry;
  bool NotificationisActive = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatBot(),
                ));
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
    bool inListings = false;
    //707 height for small phone, 867 height for large phone, width 411
    int elementWidth = screenSize.height < 999 ? 0 : 30;
    int elementHeight = screenSize.height < 1000 ? 0 : 30;

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
                        onPressed: () {},
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
                    width: inListings ? 0 : 205,
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
                  ),
                  Container(
                    width: inListings ? 205 : 0,
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
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: SearchInputFb2(
                      searchController: TextEditingController(),
                      hintText: "Enter some text here"),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MobileCat(),
                            ));
                      },
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.resolveWith(
                              (states) => 20.0),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white),
                          shadowColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.resolveWith(
                              (states) => Size(138.0 + elementHeight,
                                  131.0 + elementWidth))),
                      child: Column(
                        children: [
                          Container(
                            width: 76.0 + elementWidth,
                            height: 67.0 + elementHeight,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(24.0),
                                    bottomRight: Radius.circular(24.0),
                                    topLeft: Radius.circular(24.0),
                                    bottomLeft: Radius.circular(24.0))),
                            child: Center(
                                child: Image(
                              width: (elementWidth != 0) ? 70 : 50,
                              height: (elementWidth != 0) ? 70 : 50,
                              image:
                                  AssetImage('images/mobile-category-icon.png'),
                            )),
                          ),
                          Text(
                            "Mobile",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Color.fromRGBO(75, 173, 86, 1),
                              fontSize: 18, //elementHeight != 0 ? 16.0 : 13.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (_) => MyJourney(),
                        //     ));
                      },
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.resolveWith(
                              (states) => 20.0),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white),
                          shadowColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.resolveWith(
                              (states) => Size(138.0 + elementHeight,
                                  131.0 + elementWidth))),
                      child: Column(
                        children: [
                          Container(
                            width: 76.0 + elementWidth,
                            height: 67.0 + elementHeight,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(24.0),
                                    bottomRight: Radius.circular(24.0),
                                    topLeft: Radius.circular(24.0),
                                    bottomLeft: Radius.circular(24.0))),
                            child: Center(
                                child: Image(
                              width: (elementWidth != 0) ? 70 : 50,
                              height: (elementWidth != 0) ? 70 : 50,
                              image:
                                  AssetImage('images/tablet-category-icon.png'),
                            )),
                          ),
                          Text(
                            "Tablets",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Color.fromRGBO(75, 173, 86, 1),
                              fontSize: 18, //elementHeight != 0 ? 16.0 : 13.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (_) => MyJourney(),
                    //     ));
                  },
                  style: ButtonStyle(
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 20.0),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white),
                      shadowColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.resolveWith((states) =>
                          Size(138.0 + elementHeight, 131.0 + elementWidth))),
                  child: Column(
                    children: [
                      Container(
                        width: 76.0 + elementWidth,
                        height: 67.0 + elementHeight,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24.0),
                                bottomRight: Radius.circular(24.0),
                                topLeft: Radius.circular(24.0),
                                bottomLeft: Radius.circular(24.0))),
                        child: Center(
                            child: Image(
                          width: (elementWidth != 0) ? 70 : 50,
                          height: (elementWidth != 0) ? 70 : 50,
                          image:
                              AssetImage('images/accessory-category-icon.png'),
                        )),
                      ),
                      Text(
                        "Accessories",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color.fromRGBO(75, 173, 86, 1),
                          fontSize: 18, //elementHeight != 0 ? 16.0 : 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(children: const [
                  SizedBox(width: 30),
                  Image(
                      width: 30,
                      height: 30,
                      image: AssetImage('images/discount-icon.png')),
                  SizedBox(width: 10),
                  Text(
                    "Offers",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Color.fromRGBO(75, 173, 86, 1),
                      fontSize: 18, //elementHeight != 0 ? 16.0 : 13.0,
                    ),
                  ),
                ]),
                SizedBox(height: 20),
                Container(
                  width: 700,
                  height: 188,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    SizedBox(width: 20),
                    Column(
                      children: [
                        SizedBox(height: 3),
                        TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (_) => MyJourney(),
                            //     ));
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.resolveWith(
                                  (states) => 20.0),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
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
                              Container(
                                width: 325.0 + elementWidth,
                                height: 165.0 + elementHeight,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(24.0),
                                        bottomRight: Radius.circular(24.0),
                                        topLeft: Radius.circular(24.0),
                                        bottomLeft: Radius.circular(24.0))),
                                child: Row(children: [
                                  Image(
                                    width: 130,
                                    height: 150,
                                    image: AssetImage(
                                        'images/samsung-galaxy-a13.png'),
                                  ),
                                  Column(children: [
                                    Text(
                                      "Samsung Galaxy A13,\n 128GB, 4GB RAM",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Color.fromRGBO(75, 173, 86, 1),
                                        fontSize:
                                            18, //elementHeight != 0 ? 16.0 : 13.0,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(children: [
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(75, 173, 86, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(75, 173, 86, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(75, 173, 86, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(75, 173, 86, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                      ),
                                    ]),
                                    SizedBox(height: 10),
                                    Text(
                                      "30 in Stock",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Color.fromRGBO(75, 173, 86, 1),
                                        fontSize:
                                            16, //elementHeight != 0 ? 16.0 : 13.0,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(children: [
                                      Text(
                                        "AED 328",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Color.fromRGBO(75, 173, 86, 1),
                                          fontSize:
                                              18, //elementHeight != 0 ? 16.0 : 13.0,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "25% off",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Color.fromRGBO(75, 173, 86, 1),
                                          fontSize:
                                              18, //elementHeight != 0 ? 16.0 : 13.0,
                                        ),
                                      ),
                                    ]),
                                  ])
                                ]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        SizedBox(height: 3),
                        TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (_) => MyJourney(),
                            //     ));
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.resolveWith(
                                  (states) => 20.0),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
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
                              Container(
                                width: 325.0 + elementWidth,
                                height: 165.0 + elementHeight,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(24.0),
                                        bottomRight: Radius.circular(24.0),
                                        topLeft: Radius.circular(24.0),
                                        bottomLeft: Radius.circular(24.0))),
                                child: Row(children: [
                                  Image(
                                    width: 130,
                                    height: 150,
                                    image: AssetImage('images/phone-2.jpg'),
                                  ),
                                  Column(children: [
                                    Text(
                                      "Xiaomi Redmi 10,\n 64GB, 4GB RAM",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Color.fromRGBO(75, 173, 86, 1),
                                        fontSize:
                                            18, //elementHeight != 0 ? 16.0 : 13.0,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(children: [
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(75, 173, 86, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(75, 173, 86, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(75, 173, 86, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                      ),
                                    ]),
                                    SizedBox(height: 10),
                                    Text(
                                      "12 in Stock",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Color.fromRGBO(75, 173, 86, 1),
                                        fontSize:
                                            16, //elementHeight != 0 ? 16.0 : 13.0,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(children: [
                                      Text(
                                        "AED 258",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Color.fromRGBO(75, 173, 86, 1),
                                          fontSize:
                                              18, //elementHeight != 0 ? 16.0 : 13.0,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "30% off",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Color.fromRGBO(75, 173, 86, 1),
                                          fontSize:
                                              18, //elementHeight != 0 ? 16.0 : 13.0,
                                        ),
                                      ),
                                    ]),
                                  ])
                                ]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3),
                      ],
                    ),
                    SizedBox(width: 20),
                  ]),
                ),
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
