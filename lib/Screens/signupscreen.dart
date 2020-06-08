import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool _isHidden = true;

  void _togglePasswordVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 18, left: 30,right: 30),
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _header(),
                _form(),
              ],
          ),
        ),
      ),
    );
  }

  Widget _header(){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 289,
              height: 241,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/account.png")),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Text('Create your account',
        style: TextStyle(
          fontFamily: 'Helvetica Neue',
          fontSize: 30,
          color: const Color (0xf5296af4),
        ),)
      ],
    );
  }

  Widget _form(){
    return Column(
      children: <Widget>[
        _textField("Full Name"),
        SizedBox(height: 20,),
        _textField("Email"),
        SizedBox(height: 20,),
        _textField("Password"),
        SizedBox(height: 20,),
        _textField("Confirm Password"),
      ],
    
    );
  }

  Widget _textField( String hintText){
    return TextFormField(
      keyboardType: hintText == "Email" ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontFamily: 'Helvetica Neue',fontSize: 16,),
        suffixIcon: hintText == "Password" ? IconButton(
          onPressed: _togglePasswordVisibility,
          icon: _isHidden ?  Icon(Icons.visibility_off,) : Icon(Icons.visibility),
          ): null,
      ),
      obscureText: hintText == "Password" ? _isHidden : hintText == "Confirm Password" ? true : false,
    );

  }
}