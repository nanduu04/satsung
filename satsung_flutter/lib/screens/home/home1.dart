

import 'package:satsung/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:satsung/screens/contact/contactus.dart';
import 'package:satsung/screens/file/file.dart';
import 'package:satsung/screens/home/home.dart';

class Home1 extends StatefulWidget {

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home1> {
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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Radhey Radhey'),
              decoration: BoxDecoration(
                color: Color(0xFFFD4F99),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
          title: Text("Satsung"), backgroundColor: Colors.blue,
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
