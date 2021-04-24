import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'authenticate.dart';

class LoginScreen extends StatefulWidget {
  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<LoginScreen> {

  var email, password, token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Name'
            ),
            onChanged: (val){
              email = val;
            }
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Password'
            ),
            onChanged: (val){
              password = val;
            }
          ),
          SizedBox(height:10),
          RaisedButton(
            child: Text('Authenticate'),
            color: Colors.blue,
            onPressed: () {
              AuthService().login(email, password).then((val){
                if(val.data['success']) {
                  token = val.data['token'];
                  Fluttertoast.showToast(
                      msg: 'Authenticated',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
              });
          }
          ),
        ],

      ),
    );
  }
}
