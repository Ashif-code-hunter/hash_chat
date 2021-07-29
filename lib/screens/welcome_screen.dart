import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>  with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.grey,end: Colors.white).animate(controller);
    // animation=CurvedAnimation(parent: controller, curve: Curves.bounceOut); //curve animation

    controller.forward();
    controller.addListener((){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(// animation for shifting between 2 pages
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height:60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                        'Flash Chat',
                        textStyle: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                        speed: Duration(milliseconds: 75)
                    ),
                  ],

                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                colour: Colors.lightBlueAccent,
                onPressed:() {
                  Navigator.pushNamed(context,LoginScreen.id);
                },
                title: "Log in"),
            RoundedButton(
                colour: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context,RegistrationScreen.id);
                },
                title: "Register"),
          ],
        ),
      ),
    );
  }
}

