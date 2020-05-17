import 'package:satsung/screens/contact/config.dart';
import 'package:flutter/material.dart';


class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        
        backgroundColor: Colors.white,

        body: ContactUs(
          cardColor: Color(0xff39d47f),
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