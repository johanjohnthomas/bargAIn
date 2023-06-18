import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'searchbar.dart';
import 'dart:math' as math;
import 'main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'analytics-1.dart';
import 'package:d_chart/d_chart.dart';
import 'mylistings.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ProductPages());
  }
}

class ProductPages extends StatefulWidget {
  @override
  State<ProductPages> createState() => _ProductPagesState();
}

class _ProductPagesState extends State<ProductPages> {
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
                        colors: !inListings
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
                          Color.fromRGBO(255, 255, 255, 1),
                          Color.fromRGBO(255, 255, 255, 1)
                        ],
                      ),
                    )),
                  )
                ]),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                          SizedBox(height: 10),
                          Container(
                            width: 325.0 + elementWidth,
                            height: 605.0 + elementHeight,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(24.0),
                                    bottomRight: Radius.circular(24.0),
                                    topLeft: Radius.circular(24.0),
                                    bottomLeft: Radius.circular(24.0))),
                            child: Container(
                              width: 500,
                              height: 700,
                              child: ListView(children: [
                                Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Column(children: [
                                      Column(children: [
                                        Text(
                                          "Samsung Galaxy S22,\n 128GB, 8GB RAM",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                            fontSize:
                                                18, //elementHeight != 0 ? 16.0 : 13.0,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Image(
                                          width: 230,
                                          height: 270,
                                          image:
                                              AssetImage('images/phone-3.jpg'),
                                        ),
                                        Text(
                                          "Sold by ABC LLC",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                            fontSize:
                                                12, //elementHeight != 0 ? 16.0 : 13.0,
                                          ),
                                        ),
                                        Text(
                                          "AED 1,865",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                            fontSize:
                                                30, //elementHeight != 0 ? 16.0 : 13.0,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Colours:",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                            fontSize:
                                                16, //elementHeight != 0 ? 16.0 : 13.0,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Row(children: [
                                          SizedBox(
                                            width: 120,
                                          ),
                                          Icon(
                                            Icons.circle,
                                            color: Color.fromRGBO(
                                                198, 183, 216, 1),
                                          ),
                                          SizedBox(width: 5),
                                          Icon(
                                            Icons.circle,
                                            color:
                                                Color.fromRGBO(19, 36, 61, 1),
                                          ),
                                          SizedBox(width: 5),
                                          Icon(
                                            Icons.circle,
                                            color:
                                                Color.fromRGBO(83, 88, 89, 1),
                                          )
                                        ]),
                                        SizedBox(height: 10),
                                      ])
                                    ]),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(width: 15),
                                        Image(
                                          image: AssetImage("images/Spec.png"),
                                        ),
                                        SizedBox(width: 20),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(width: 15),
                                        Image(
                                          width: 280,
                                          image: AssetImage(
                                              "images/Sentiment.png"),
                                        ),
                                        SizedBox(width: 20),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Image(
                                      width: 280,
                                      image: AssetImage(
                                          "images/commonOpinions.png"),
                                    ),
                                    SizedBox(height: 20),
                                    Image(
                                      width: 280,
                                      image: AssetImage("images/reviews.png"),
                                    ),
                                    SizedBox(height: 20),
                                    TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => 20.0),
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => Color.fromRGBO(
                                                      75, 173, 86, 1)),
                                          shadowColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => Colors.black),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                          minimumSize:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => Size(160.0 + elementHeight, 50.0 + elementWidth))),
                                      child: Text(
                                        "Add to Cart",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          fontSize:
                                              elementHeight != 0 ? 23.0 : 23.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
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
