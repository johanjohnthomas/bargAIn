import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'searchbar.dart';
import 'dart:math' as math;
import 'main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'analytics-1.dart';
import 'analytics-2.dart';
import 'analytics-3.dart';

class MyListings extends StatefulWidget {
  @override
  State<MyListings> createState() => _MyListingsState();
}

class _MyListingsState extends State<MyListings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyListing());
  }
}

class MyListing extends StatefulWidget {
  @override
  State<MyListing> createState() => _MyListingState();
}

class _MyListingState extends State<MyListing> {
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
                        onPressed: () {},
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
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: SearchInputFb2(
                      searchController: TextEditingController(),
                      hintText: "Enter some text here"),
                ),
                SizedBox(height: 20),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'Filter by',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    items: items.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        //disable default onTap to avoid closing menu when selecting an item
                        enabled: false,
                        child: StatefulBuilder(
                          builder: (context, menuSetState) {
                            final _isSelected = selectedItems.contains(item);
                            return InkWell(
                              onTap: () {
                                _isSelected
                                    ? selectedItems.remove(item)
                                    : selectedItems.add(item);
                                //This rebuilds the StatefulWidget to update the button's text
                                setState(() {});
                                //This rebuilds the dropdownMenu Widget to update the check mark
                                menuSetState(() {});
                              },
                              child: Container(
                                height: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  children: [
                                    _isSelected
                                        ? const Icon(Icons.check_box_outlined)
                                        : const Icon(
                                            Icons.check_box_outline_blank),
                                    const SizedBox(width: 16),
                                    Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color.fromRGBO(75, 173, 86, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                    //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                    value: selectedItems.isEmpty ? null : selectedItems.last,
                    onChanged: (value) {},
                    selectedItemBuilder: (context) {
                      return items.map(
                        (item) {
                          return Container(
                            alignment: AlignmentDirectional.center,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              selectedItems.join(', '),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(75, 173, 86, 1),
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                          );
                        },
                      ).toList();
                    },
                    dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 200,
                        padding: null,
                        elevation: 8,
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        )),
                    buttonStyleData: ButtonStyleData(
                        height: 40,
                        width: 140,
                        elevation: 2,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color.fromRGBO(75, 173, 86, 1),
                            Color.fromRGBO(34, 179, 174, 1)
                          ]),
                          borderRadius: BorderRadius.circular(5),
                        )),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.grey,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 360,
                  height: 500,
                  child: ListView(children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 5),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Analytics(),
                                ));
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
                              SizedBox(height: 10),
                              Container(
                                width: 325.0 + elementWidth,
                                height: 185.0 + elementHeight,
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
                                    image: AssetImage('images/phone-3.jpg'),
                                  ),
                                  Column(children: [
                                    Text(
                                      "Samsung Galaxy S22,\n 128GB, 8GB RAM",
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
                                      Text(
                                        "AED 1,865",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Color.fromRGBO(75, 173, 86, 1),
                                          fontSize:
                                              18, //elementHeight != 0 ? 16.0 : 13.0,
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height: 10),
                                    Text(
                                      "23 sold of 120",
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
                                  ])
                                ]),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 5),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Analytics2(),
                                ));
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
                              SizedBox(height: 10),
                              Container(
                                width: 325.0 + elementWidth,
                                height: 185.0 + elementHeight,
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
                                    image: AssetImage('images/phone-4.jpg'),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Column(children: [
                                        Text(
                                          "iPhone 14 Pro,\n 128GB",
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
                                        Row(children: [
                                          Text(
                                            "AED 4,299",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              color: Color.fromRGBO(
                                                  75, 173, 86, 1),
                                              fontSize:
                                                  18, //elementHeight != 0 ? 16.0 : 13.0,
                                            ),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Text(
                                          "56 sold of 60",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                            fontSize:
                                                16, //elementHeight != 0 ? 16.0 : 13.0,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Icon(
                                            Icons.star,
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                      ]),
                                    ],
                                  )
                                ]),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 5),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Analytics3(),
                                ));
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
                              SizedBox(height: 10),
                              Container(
                                width: 325.0 + elementWidth,
                                height: 185.0 + elementHeight,
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
                                    image: AssetImage('images/phone-5.png'),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Column(children: [
                                        Text(
                                          "Huawei P60 Pro,\n 256GB, 8GB RAM",
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
                                        Row(children: [
                                          Text(
                                            "AED 4,199",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              color: Color.fromRGBO(
                                                  75, 173, 86, 1),
                                              fontSize:
                                                  18, //elementHeight != 0 ? 16.0 : 13.0,
                                            ),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Text(
                                          "40 sold of 80",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                            fontSize:
                                                16, //elementHeight != 0 ? 16.0 : 13.0,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Icon(
                                            Icons.star,
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color:
                                                Color.fromRGBO(75, 173, 86, 1),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                      ]),
                                    ],
                                  )
                                ]),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    SizedBox(height: 10),
                  ]),
                ),
                SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Add Listing",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: 16, //elementHeight != 0 ? 16.0 : 13.0,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(75, 173, 86, 1),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )))),
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
