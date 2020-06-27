

import 'package:flutter/services.dart';
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
         appBar: AppBar(
          iconTheme: IconThemeData(
          color: Color(0xff39d47f), //change your color here
        ),
          title: Text("Radhey Radhey", style: TextStyle(decoration: TextDecoration.none, color: Color(0xff39d47f)),),
         backgroundColor: Colors.white, 
        ),
      
      drawer: Drawer(

        child: ListView(
          
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('',style: TextStyle( decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold, color: Color(0xff39d47f), fontSize: 20, backgroundColor: Colors.green, 
              ),
            ),
            decoration: BoxDecoration(
              
            image: DecorationImage(
                image: AssetImage('assets/rk.png'), fit: BoxFit.cover),
            ),
            ),
            new Container(
                child: ListTile(
               leading: Icon(Icons.picture_as_pdf),
              title: Text('Files' ,style: TextStyle( decoration: TextDecoration.none,
              fontWeight: FontWeight.bold, color: Color(0xff39d47f), fontSize: 20,)),

               onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => File())
                  );
                },
              
            ),

            decoration:
              new BoxDecoration(
                border: new Border(
                    bottom: new BorderSide()
                )
            )
            ,
            
            ),
           
           new Container( 
               child: ListTile(
                 leading: Icon(Icons.contacts),
              title: Text('Contact', style: TextStyle( decoration: TextDecoration.none,
              fontWeight: FontWeight.bold, color: Color(0xff39d47f), fontSize: 20,)),
              onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Contact())
                  );
                },
             
            ),
            decoration:
              new BoxDecoration(
                border: new Border(
                    bottom: new BorderSide()
                )
            )
           ),
           
             FlatButton.icon(
              label: Text('logout'),
               icon: Icon(Icons.person),
              padding: EdgeInsets.fromLTRB(0, 340, 220, 0),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
      ),
      // appBar: AppBar(
      //     title: Text("Radhey Radhey"), backgroundColor: Colors.blue,
      //     actions: <Widget>[
      //       FlatButton.icon(
      //         icon: Icon(Icons.person),
      //         label: Text('logout'),
      //         onPressed: () async {
      //           await _auth.signOut();
      //         },
      //       ),]),
      body: Center(child: _pages[_selectedTabIndex]),

      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   selectedItemColor:Color(0xff39d47f),
      //   unselectedItemColor: Colors.black,
      //   currentIndex: _selectedTabIndex,

      //   onTap: _changeIndex,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
      //     BottomNavigationBarItem(icon: Icon(Icons.picture_as_pdf), title: Text("Files")),
      //     BottomNavigationBarItem(icon: Icon(Icons.contacts), title: Text("Contact")),
      //   ],
      // ),
    );
  }
}
