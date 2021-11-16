import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '/components/rounded_buttons.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutQuad);

    controller.forward();


    controller.addListener(() {
      setState(() {});
      animation.value;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0
                    ),
                  ),
                ),
                TypewriterAnimatedTextKit(
                 text: ['iChat' ],
                  textStyle: TextStyle(
                    fontSize: animation.value*40,
                    fontWeight: FontWeight.w900,
                    color: Colors.black
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 38.0,
            ),
            RoundedButton(colour: Colors.lightBlueAccent,title:'Log In' , onpressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(colour: Colors.blueAccent,title:'Register' , onpressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },),

          ],
        ),
      ),
    );
  }
}

