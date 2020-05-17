import 'package:satsung/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:satsung/screens/contact/contactus.dart';
import 'package:satsung/screens/file/file.dart';

class Home extends StatefulWidget {

  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<Home> {
  int _selectedTabIndex = 0;
  final AuthService _auth = AuthService();

  List _pages = [
    Text("Home page displaying where the next satsung is"),
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
      appBar: AppBar(
          title: Text("Home Page"), backgroundColor: Colors.lightBlue[900],
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),]),
      body: Center(child: _pages[_selectedTabIndex]),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,

        onTap: _changeIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.picture_as_pdf), title: Text("Files")),

          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text("Contact")),
        ],
      ),
    );
  }
}
