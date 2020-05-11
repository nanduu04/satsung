import 'package:satsung/services/auth.dart';
import 'package:satsung/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
   
    return loading ? Loading( ) : Scaffold(

      resizeToAvoidBottomPadding: false ,
      appBar: AppBar(
        //backgroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text('Sign In', style: TextStyle(
          color: Colors.black
         ),),
        leading: BackButton(
          color: Color(0xff39d47f)),
          
        actions: <Widget>[
          SizedBox(height: 50),
          FlatButton.icon(
            //color: Colors.grey,
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () => widget.toggleView(),
          ),
        ],
        
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
                obscureText: true,
                decoration: InputDecoration(labelText: 'New Password',
                border: OutlineInputBorder(),
                hintText: 'Jondoe123',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Color(0xff39d47f),
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        loading = false;
                        error = 'Could not sign in with those credentials';
                      });
                    }
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Color(0xff39d47f), fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing:  2.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
