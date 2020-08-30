import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth= AuthService();
  final _formkey = GlobalKey<FormState>();
  String email="";
  String password="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Register"),
        elevation: 0.0,
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Sign In"))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical:9.0 ,horizontal:20.0 ),
          child: Form(
            key: _formkey,
              child:Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  TextFormField(
                    validator: (val) => val.isEmpty? 'Enter an email' : null ,
                    onChanged: (val){
                      setState(()=>email=val);
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    obscureText: true,
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null ,
                    onChanged: (val){
                      setState(()=>password=val);
                    },

                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    child: Text("Register"),
                    onPressed: (){
                      if(_formkey.currentState.validate())
                        print(email);
                        print(password);
                    },
                  )

                ],
              )
          )
      ),
    );
  }
}
