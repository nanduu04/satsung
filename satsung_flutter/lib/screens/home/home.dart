
import 'dart:ui';
import 'package:satsung/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:satsung/screens/contact/contactus.dart';
import 'package:satsung/screens/file/file.dart';
import 'package:google_fonts/google_fonts.dart';

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
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/nackground.jpg'), fit: BoxFit.cover)

            ),
          ),
          BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 15.0),
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
              )
          ),
          Positioned(
              top: 10.0,
              child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width - 1.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              
                              Text('Upcoming Satsangs',
                              
                                  style: GoogleFonts.montserrat(
                                    
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    textStyle: TextStyle(color: Colors.white),
                                  )
                              ),
                              
                              // IconButton(
                              //   icon: Icon(Icons.more_vert, color: Colors.white),
                              //   onPressed: () {},
                              // )
                            ],
                          )
                      ),
                      SizedBox(height: 10.0),
                      Stack(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Container(
                                height: 200.0,
                                width: 325.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        image: AssetImage('assets/home1.jpg'),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)
                                    )
                                ),
                              )
                          ),
                          Positioned(
                              top: 125.0,
                              left: 10.0,
                              child: Container(
                                  width: MediaQuery.of(context).size.width - 60.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Tuesday Geeta Class',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  textStyle:
                                                  TextStyle(color: Colors.white)
                                              )
                                          ),
                                          Text(
                                            'Sharma Residence at 7:00pm',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 14.0,
                                                textStyle:
                                                TextStyle(color: Colors.white)),
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 40.0,
                                        width: 40.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7.0),
                                            color: Colors.white),
                                        child: Center(
                                          child: Icon(Icons.arrow_forward_ios, color: Color(0xFFFD4F99), size: 14.0),
                                        ),
                                      )
                                    ],
                                  )
                              )
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                          width: MediaQuery.of(context).size.width - 15.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('More Satsangs',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    textStyle: TextStyle(color: Colors.white),
                                  )
                              )
                            ],
                          )
                      ),
                      SizedBox(height: 15.0),
                      Container(
                          height: 200.0,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              _buildListItem('assets/home4.jpg', 'Saturday Satsang',
                                  '5:00pm'),
                              _buildListItem('assets/home2.jpg', 'Sunday Satsang',
                                  '6:00pm'),
                              _buildListItem('assets/home3.jpg', 'Tuesday Satsang',
                                  '7:00pm')
                            ],
                          )
                      )
                    ],
                  )
              )
          )
        ],
      ),
    );
  }

  _buildListItem(String imgPath, String placeName, String price) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Stack(
            children: [
              Container(
                  height: 175.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      image: DecorationImage(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)
                      )
                  )
              ),
              Positioned(
                  top: 15.0,
                  right: 15.0,
                  child: Container(
                      height: 25.0,
                      width: 25.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white
                      ),
                      child: Center(
                          child: Icon(
                            Icons.location_on,
                            color: Color(0xFFFD4F99),
                            size: 14.0,
                          )
                      )
                  )
              ),
              Positioned(
                  top: 125.0,
                  left: 15.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(placeName,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                              textStyle: TextStyle(
                                  color: Colors.white
                              )
                          )
                      ),
                      Text(price,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              textStyle: TextStyle(
                                  color: Colors.white
                              )
                          )
                      )
                    ],
                  )
              )
            ]
        )
    );
  }
}
