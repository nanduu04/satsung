import 'package:satsung/models/brew.dart';
import 'package:satsung/services/auth.dart';
import 'package:satsung/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'settings_form.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    // void _showSettingsPanel() {
    //   showModalBottomSheet( context: context, builder: (context) {
    //     return Container(
    //       padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
    //       //child: SettingsForm(),
    //     );
        
    //   });
    // }
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        resizeToAvoidBottomPadding: false ,

        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Home Page'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            // FlatButton.icon(
            //   icon: Icon(Icons.settings),
            //   label: Text('settings'),
            //   //onPressed: () => _showSettingsPanel(),
            // )
          ],
        ),
       
        //this is from the dumpling one rajayogan
        body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: <Widget>[
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icecream.jpg'),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              height: 250.0,
              color: Colors.white.withOpacity(0.9),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.0, left: 30.0, right: 30.0),
              child: Container(
                padding: EdgeInsets.only(left: 45.0),
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white
                ),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search,
                            size: 16.0, color: Color(0xFF999798)),
                      hintText: 'Find something special',
                      hintStyle: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 12.0,
                        color: Color(0xFF999798)
                      )
                    )
                  )
                )
              )
            ),
            Positioned(
                top: 110.0,
                left: 30.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'The Best Food',
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 25.0,
                          color: Color(0xFF312F2E),
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'In Only 20 Mins',
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 25.0,
                          color: Color(0xFF312F2E),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on,
                            color: Color(0xFF7C7574), size: 15.0),
                        SizedBox(width: 10.0),
                        Text(
                          '951 Rue Gleichner Coves, Suite 648',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 12.0,
                              color: Color(0xFF7C7574),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                )),
                Positioned(
                  top: 225.0,
                  child: Container(
                    height: screenHeight - 225.0,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)
                      ),
                      color: Colors.white
                    ),
                    child: ListView(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      children: <Widget>[
                        Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'WEEKLY SPECIAL',
                          style: TextStyle(
                              fontFamily: 'OpenSans', color: Color(0xFFC4C2C2), fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          icon:
                              Icon(Icons.rotate_left, color: Color(0xFFC4C2C2)),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 150.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  boxShadow: [
                                    BoxShadow(color: Color(0xFFD1C0B9), blurRadius: 4.0, spreadRadius: 3.0)
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage('assets/chefhat.jpg'),
                                    fit: BoxFit.cover
                                  )
                                ),
                              ),
                              Text('Gerald Jacobs',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 14.0,
                                color: Color(0xFF353535),
                                fontWeight: FontWeight.w600
                              )
                              )
                            ],
                          )
                        ),
                        Text('Location',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 14.0,
                                color: Color(0xFFE0AC9B),
                                fontWeight: FontWeight.w600
                              )
                              )
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Container(
              width: MediaQuery.of(context).size.width - 30.0,
              child: Text(
                'Our donuts have over 18 flavors and each of them will give you the different impression. Select any 6 donuts to make a package in a special price this week.',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 12.5,
                    color: Color(0xFF939190)),
              ),
            ),
            SizedBox(height: 15.0),
            Text(
                          '\$15.99',
                          style: TextStyle(
                              // fontFamily: 'OpenSans',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF322F2E)),
                        ),
                        Image(
                          image: AssetImage('assets/donuts.png'),
                          fit: BoxFit.cover,
                          height: 250.0,
                        )
                      ],
                    ),
                  )
                )
          ],
        )
      )
      ),
    );
  }
}



// Widget Vine() {
//   return Image(
//     image: AssetImage('assets/images/vine.png'),
//     height: 25,
//   );
// }

// Widget Email() {
//   return Padding(
//       padding: const EdgeInsets.fromLTRB(22.0, 0, 22, 0),
//       child: TextFormField(
//           keyboardType: TextInputType.emailAddress,
//           autofocus: false,
//           decoration: InputDecoration(
//             hintText: 'Email',
//             contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//             border: OutlineInputBorder(),
//           )));
// }

// Widget Password() {
//   return Padding(
//       padding: const EdgeInsets.fromLTRB(22.0, 0, 22, 0),
//       child: TextFormField(
//           keyboardType: TextInputType.visiblePassword,
//           obscureText: true,
//           autofocus: false,
//           decoration: InputDecoration(
//             hintText: 'New Password',
//             contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//             border: OutlineInputBorder(),
//           )));
// }

// Widget ContinueWithFacebookButton(BuildContext context) {
//   return Center(
//     child: Column(
//       children: <Widget>[
//         SizedBox(
//           width: 300,
//           child: RaisedButton(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(24),
//                 side: BorderSide(color: Colors.black)),
//             color: Color(0xff4267b2),
//             onPressed: () {},
//             textColor: Colors.white,
//             child: Container(
//               padding: const EdgeInsets.all(10.0),
//               child: const Text('SIGNIN WITH FACEBOOK',
//                   style: TextStyle(
//                     fontSize: 13,
//                     letterSpacing: 2.0,
//                     fontWeight: FontWeight.bold,
//                   )),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget ContinueWithGoogleButton() {
//   return Center(
//     child: Column(
//       children: <Widget>[
//         SizedBox(
//           width: 300,
//           child: RaisedButton(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(24),
//                 side: BorderSide(color: Colors.black)),
//             color: Color(0xff4385F4),
//             onPressed: () {},
//             textColor: Colors.white,
//             child: Container(
//               padding: const EdgeInsets.all(10.0),
//               child: const Text('SIGNIN WITH GOOGLE',
//                   style: TextStyle(
//                     fontSize: 13,
//                     letterSpacing: 2.0,
//                     fontWeight: FontWeight.bold,
//                   )),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget SignIn(BuildContext context) {
//   return Center(
//     child: Column(
//       children: <Widget>[
//         SizedBox(
//           width: 200,
//           child: RaisedButton(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(24),
//                 side: BorderSide(color: Colors.black)),
//             color: Color(0xff39d47f),
//             onPressed: () {},
//             textColor: Colors.black,
//             child: Container(
//               padding: const EdgeInsets.all(10.0),
//               child: const Text('SIGN IN',
//                   style: TextStyle(
//                     fontSize: 13,
//                     letterSpacing: 2.0,
//                     fontWeight: FontWeight.bold,
//                   )),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }


// Widget ForgetPassword(BuildContext context) {
//   return Center(
//     child: Column(
//       children: <Widget>[
//         SizedBox(
//           width: 200,
//           child: RaisedButton(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(24),
//                 side: BorderSide(color: Colors.black)),
//             color: Color(0xFFBDBDBD),
//             onPressed: () {},
//             textColor: Colors.black,
//             child: Container(
//               padding: const EdgeInsets.all(10.0),
//               child: const Text('FORGET PASSWORD',
//                   style: TextStyle(
//                     fontSize: 11,
//                     letterSpacing: 2.0,
//                     fontWeight: FontWeight.bold,
//                   )),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
