import 'package:satsung/screens/contact/config.dart';
import 'package:flutter/material.dart';


class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Us'), backgroundColor: Colors.orangeAccent[400],
        ),
        bottomNavigationBar: ContactUsBottomAppBar(
          email: 'krishna@gmail.com',
          backgroundColor: Colors.orangeAccent[400],
          textColor: Colors.black,
        ),
        backgroundColor: Colors.orange[400],
        body: ContactUs(
          cardColor: Colors.orangeAccent[400],
          textColor: Colors.black,
          logo: AssetImage("assets/rk.png"),
          email: 'Krishna@gmail.com',
          companyName: 'Contact Us',
          companyColor: Colors.white,
          phoneNumber: '3657734347',
        ),
      );
    }
  }