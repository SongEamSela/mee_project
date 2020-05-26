import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 30,right: 30),
        child: Column(
          children: <Widget>[
            _header(),
            _formInput(),
            _footer(),
          ],
        ),
      ),
    );
  }


  Widget _header(){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
            Container(
              width: 274,
              height: 223,
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("images/social_distancing.png")),
              ),
            ),
          ],
        ),
        Text('Welcome!',
        style: TextStyle(
          fontFamily: 'Helvetica Neue',
          fontSize: 40,
          color: const Color (0xf5296af4),
        ),
        ),
        SizedBox(height: 10,),
        Text('Log in to your existing account of Mee',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff524949),
          ),
        )
      ],
    );
  }

  Widget _formInput(){
    return Column(
      children: <Widget>[
        SizedBox(height: 25,),
        _email(),
        SizedBox(height: 10,),
        _password(),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text('Forgot Password?',
            style: TextStyle(
              fontFamily: 'Helvetica Neue',
              fontSize: 14,
              color: const Color (0xf5296af4),
            ),)
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 186,
              height: 43,
              child: FlatButton(
                color: const Color (0xf5296af4),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                child:Text('Sign In ',
                style: TextStyle(
                fontFamily: 'Helvetica Neue',
                  fontSize: 19,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                 ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );

  }

  Widget _email(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email, size: 20, color: Colors.black45,),
        hintText:'Enter email address',
        hintStyle: TextStyle(fontFamily: 'Helvetica Neue',fontSize: 14,),
      ),
    );
  }

  Widget _password(){
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, size: 20, color: Colors.black45,),
        hintText: 'Enter password',
          hintStyle: TextStyle(fontFamily: 'Helvetica Neue',fontSize: 14,),
      ),
    );
  }

  Widget _footer(){
    return Column(
      children: <Widget>[
        SizedBox(height: 20,),
        Text('Or log in with ',
        style: TextStyle(
          fontFamily: 'Helvetica Neue',
          fontSize: 14,
          color: const Color(0xff524949),
          ),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("images/facebook.png")),
              ),
            ),
            SizedBox(width: 15,),
            Container(
              height: 50,
              width: 50,
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("images/google.png")),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        RichText(
          text: TextSpan(
            text: 'Dont have an account? ',
            style: TextStyle(
              fontFamily: 'Helvetica Neue',
              fontSize: 14,
              color: const Color(0xff524949),
            ),
            children: <TextSpan>[
            TextSpan(text: 'Sign up',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 14,
                  color: const Color (0xf5296af4),
                ),
              ),
            ]
          ),
        ),
      ],
    );

  }

}
