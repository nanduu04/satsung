import 'package:flutter/material.dart';
import 'package:satsung/screens/file/chanting.dart';
import 'package:satsung/screens/file/uchharan.dart';
import 'package:satsung/screens/file/invocation.dart';
import 'invocation.dart';

class File extends StatefulWidget {
  @override
  _FileState createState() => _FileState();
}

class _FileState extends State<File> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              color: Colors.orangeAccent[400],
              child: ListTile(
                title: Text('Invocation Shlokas'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Invocation())
                  );
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              color: Colors.orangeAccent[400],
              child: ListTile(
                title: Text('Geeta Chanting Shlokas'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Geeta())
                  );
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              color: Colors.orangeAccent[400],
              child: ListTile(
                title: Text('Uchharan Guidelines'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Guidelines())
                  );
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Files"),backgroundColor: Colors.orangeAccent[400]
      ),
    );
  }
}
