import 'package:flutter/cupertino.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter/material.dart';
import 'package:igest/src/pages/login/logUser.dart';
import 'package:igest/src/pages/login/signUp.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingSlider(
        pageBackgroundColor: const Color.fromARGB(255, 188, 208, 243),
        headerBackgroundColor: const Color.fromARGB(255, 188, 208, 243),
        finishButtonText: 'register',
        // onFinish: context,
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: Colors.black,
        ),
        skipTextButton: const Text('Skip'),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      // backgroundColor: Colors.blue,
                      decorationColor: Colors.amberAccent),
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: const Text('Signup?',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ))),
          ],
        ),
        background: [
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 40),
            height: 800,
            width: 400,
            color: const Color.fromARGB(255, 188, 208, 243),
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 40),
            height: 800,
            width: 400,
            color: const Color.fromARGB(255, 188, 208, 243),
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 40),
            height: 800,
            width: 400,
            color: const Color.fromARGB(255, 188, 208, 243),
          ),
        ],
        totalPage: 3,
        speed: 2.8,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                  child: Image.asset(
                    'asset/profil2.jpg',
                    // colorBlendMode: BlendMode.color,
                  ),
                ),
                const Text(
                  'Decouoverz les dernieres tendance du marcher !',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                  'Vendez vos produit et gagner plus',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                  'Commencer dès maintenant',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
