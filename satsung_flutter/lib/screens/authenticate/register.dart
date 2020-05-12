import 'package:satsung/services/auth.dart';
import 'package:satsung/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomPadding: false,
      
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Register', style: TextStyle(
          color: Colors.black
        ),), actions: <Widget>[
          SizedBox(height: 50.0),
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () => widget.toggleView(),
          ),
        ],
        leading: BackButton(
          color: Color(0xff39d47f)),
         ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            
            children: <Widget>[
              SizedBox(height: 50.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email',
                border: OutlineInputBorder(),
                hintText: 'JonDoe@gmail.com',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'New Password',
                border: OutlineInputBorder(),
                hintText: 'Jondoe123',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Color(0xff39d47f),
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        loading = false;
                        error = 'Please supply a valid email';
                      });
                    }
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color:  Color(0xff39d47f),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}