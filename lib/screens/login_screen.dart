import 'package:flutter/material.dart';
import 'package:hash_chat/constants.dart';
import 'package:hash_chat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  bool showSpinng =false;
  late String email;
  late String password;
  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinng,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                      tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email= value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Username'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password=value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(colour: Colors.lightBlueAccent,
                  onPressed: (){
                setState(() {
                  showSpinng=true;
                });
                try{
                      late final user=_auth.signInWithEmailAndPassword(email: email, password: password);
                      if(user!=null){
                        print(user);
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinng=false;
                      });
                    }
                    catch(e){
                      print(e);
                    }
                  },
                  title: "Login"),
            ],
          ),
        ),
      ),
    );
  }
}
