import 'package:satsung/services/auth.dart';
import 'package:satsung/shared/constants.dart';
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
        backgroundColor: Colors.yellow,
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          SizedBox(height: 60),
          FlatButton.icon(
            color: Colors.white,
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () => widget.toggleView(),
          ),
        ],
        
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 10.0),
       
        decoration: new BoxDecoration(color: Colors.yellow),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'krishna@gmail.com'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.red[300],
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
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
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget pic() {
  return new Scaffold(
    body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/coffee_bg.png"), fit: BoxFit.cover,),
          ),
        ),
      ],
    )
  );
}