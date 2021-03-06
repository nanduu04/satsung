import 'dart:ui';
import 'package:satsung/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:satsung/screens/contact/contactus.dart';
import 'package:satsung/screens/file/file.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flip_card/flip_card.dart';

class Home extends StatefulWidget {
  final imgPath, title;

  Home({this.imgPath, this.title});

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  int _selectedTabIndex = 0;
  final AuthService _auth = AuthService();

  List _pages = [
    Home(),
    File(),
    Contact(),
  ];

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
//Building the main big block on the home page

        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/mk.jpg'), fit: BoxFit.cover)),
          ),
          BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0)),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 1.0, 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Text('Radhey Radhey',
                  //     style: GoogleFonts.montserrat(
                  //         fontSize: 16.0,
                  //         fontWeight: FontWeight.w400,
                  //         textStyle: TextStyle(color: Colors.white)
                  //     )
                  // ),
                ],
              )),
          Positioned(
              top: 10.0,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 50, 1.0, 15.0),
                  child: Column(
                    children: <Widget>[
                      Text('Next Satsang',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF21BFBD),
                              fontSize: 30.0)),
                      SizedBox(height: 10.0),
                      Stack(
                        children: <Widget>[
                          FlipCard(
                              front: Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    height: 200.0,
                                    width: 325.0,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF21BFBD), width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/home1.jpg'),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.2),
                                                BlendMode.darken))),
                                  )),
                              back: Positioned(
                                  // top: 125.0,
                                  // left: 10.0,
                                  child: Container(
                                      height: 200.0,
                                      width: 325.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFF21BFBD),
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                              image:
                                                  AssetImage('assets/mk.jpg'),
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                  Colors.black.withOpacity(0.2),
                                                  BlendMode.darken))),
                                      //  width: MediaQuery.of(context).size.width - 60.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // children: <Widget>[
                                            //   Text('Tuesday Geeta Class',
                                            //       style: GoogleFonts.montserrat(
                                            //           fontSize: 18.0,
                                            //           fontWeight: FontWeight.bold,
                                            //           textStyle:
                                            //           TextStyle(color: Color(0xff39d47f))
                                            //       )
                                            //   ),

                                            // ],
                                          ),
                                          // Text(
                                          //   'Sharma Residence at 7:00pm',
                                          //   style: GoogleFonts.montserrat(
                                          //       fontSize: 14.0,
                                          //       textStyle:
                                          //       TextStyle(color: Colors.white)),
                                          // )
                                          Container()
                                        ],
                                      )))),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                          width: MediaQuery.of(context).size.width - 15.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Upcoming Satsangs',
                                  style: TextStyle(
                                      color: Color(0xFF21BFBD),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 26.0))
                            ],
                          )),
                      SizedBox(height: 15.0),
                      Container(
                          height: 200.0,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              _buildListItem('assets/home4.jpg',
                                  'Saturday Satsang', '5:00pm'),
                              _buildListItem('assets/home2.jpg',
                                  'Sunday Satsang', '6:00pm'),
                              _buildListItem('assets/home3.jpg',
                                  'Tuesday Satsang', '7:00pm'),
                              _buildListItem('assets/home2.jpg',
                                  'Tuesday Satsang', '7:00pm')
                            ],
                          ))
                    ],
                  )))
        ],
      ),
    );
  }

  _buildListItem(String imgPath, String placeName, String price) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Stack(children: [
          FlipCard(
              front: Container(
                  height: 175.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(color: Color(0xFF21BFBD), width: 2),
                      image: DecorationImage(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2),
                              BlendMode.darken))),
                  child: Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      //  image: DecorationImage(
                      //               image: AssetImage('assets/mk.jpg'),
                      //               fit: BoxFit.cover,
                      //               colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken)
                      // )
                    ),
                  )),
              back: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                          image: AssetImage('assets/mk.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.blue.withOpacity(0.2), BlendMode.darken))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(placeName,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                              textStyle: TextStyle(color: Color(0xff39d47f)))),
                      Text(price,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              textStyle: TextStyle(color: Colors.white)))
                    ],
                  )))
        ]));
  }
}
