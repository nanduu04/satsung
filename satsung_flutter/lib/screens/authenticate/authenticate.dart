import 'package:satsung/screens/authenticate/register.dart';
import 'package:satsung/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:satsung/screens/authenticate/welcomePage.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();

}

class _AuthenticateState extends State<Authenticate> {
  
  bool hello = true;
  bool showSignIn = true;
  
  void toggleView() {
    
    setState(() {

      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) { 
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
  }
  

  
