import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:satsung/screens/authenticate/register.dart';
import 'package:satsung/screens/authenticate/sign_in.dart';
import 'package:satsung/screens/home/home.dart';
import 'package:satsung/shared/loading.dart';



class HomePage extends StatefulWidget {

   final Function toggleView;
  HomePage({ this.toggleView });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  bool loading = false;
  Widget build(BuildContext context) {
    return loading ? Loading() : Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              logo(),
              SizedBox(
                height: 120,
              ),
              Help(),
              SizedBox(
                height: 50,
              ),
              SignUpButton(context),
              LoginButton(context),
            ],
          ),
        ),
      ),
    );
  }
}


Widget SignUpButton(BuildContext context) {
  return Center(
    child: Column(
      children: <Widget>[
        SizedBox(
          width: 300,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(color: Colors.black)),
            color: Color(0xff39d47f),
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => Register()));
            },
            textColor: Colors.black,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 13,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}



Widget LoginButton(BuildContext context) {
  return Center(
    child: Column(
      children: <Widget>[
        SizedBox(
          width: 300,
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (context) => SignIn()));
            },
            textColor: Colors.black,
            child: Container(
              child: const Text('LOG IN',
                  style: TextStyle(
                    fontSize: 13,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget logo() {
  return Image(
    image: AssetImage('assets/rk.png'),
    height: 200,
  );
}

Widget Help() {
  return Text('Radhey Radhey',
      style: TextStyle(
        fontSize: 25,
        letterSpacing: 2.0,
        wordSpacing: 10.0,
        fontWeight: FontWeight.bold,
      ));
}