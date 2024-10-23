import 'package:flutter/material.dart';
import 'package:igest/src/pages/home_screen.dart';
import 'package:igest/src/pages/login/logUser.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    // Démarre la fonction de délai après l'initialisation
    _startDelay();
  }

  Future<void> _startDelay() async {
    await Future.delayed(const Duration(seconds: 8));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => LoginPage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 192, 213, 228), //.blue[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 60,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 112,
                width: 300,
                color: const Color.fromARGB(255, 192, 213, 228),
                child: const SizedBox(
                    height: 200,
                    width: 200,
                    child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(82, 147, 56, 56),
                        // foregroundColor: Colors.amberAccent,
                        radius: 100,
                        child: Text(
                          "Logo",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w100),
                        ))),
              ),
            ),
            Expanded(
              flex: 60,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(),
                    alignment: Alignment.topCenter,
                    height: 112,
                    // width: 403,
                    color: const Color.fromARGB(
                        255, 192, 213, 228), // Colors.deepOrange[300],
                    child: const Text(
                      "BigShop",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 18, 57, 89),
                      ),
                    ),
                  ),
                  CircularProgressIndicator(
                    color: Color.fromARGB(213, 9, 5, 105),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
