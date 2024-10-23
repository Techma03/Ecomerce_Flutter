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
        pageBackgroundColor: Colors.white,
        headerBackgroundColor: Colors.white,
        finishButtonText: 'register',
        // onFinish: context,
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: Color.fromARGB(255, 162, 184, 221),
        ),
        skipTextButton: Container(
            height: 35,
            width: 60,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 162, 184, 221),
                borderRadius: BorderRadius.circular(7)),
            child: const Center(
                child: Text(
              'Skip',
              style: TextStyle(color: Colors.white),
            ))),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 35,
              width: 75,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 162, 184, 221),
                  borderRadius: BorderRadius.circular(7)),
              child: TextButton(
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
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 35,
              width: 80,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 162, 184, 221),
                  borderRadius: BorderRadius.circular(7)),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: const Text('Signup?',
                      style: TextStyle(
                        color: Colors.white,
                      ))),
            ),
          ],
        ),
        background: [
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 40),
            height: 800,
            width: 400,
            color: Colors.white,
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 40),
            height: 800,
            width: 400,
            color: Colors.white,
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 40),
            height: 800,
            width: 400,
            color: Colors.white,
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
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                  child: Image.asset(
                    height: 920,
                    width: 920,
                    'asset/shoe8.jpg',
                    // colorBlendMode: BlendMode.color,
                  ),
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
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                  child: Image.asset(
                    'asset/shoe6.jpg',
                    // colorBlendMode: BlendMode.color,
                  ),
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
