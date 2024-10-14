import 'package:flutter/material.dart';
import 'package:igest/src/pages/login/signUp.dart';
import 'package:igest/src/theme/color.dart';

class LoginPage extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Connexion',
              style: TextStyle(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 224, 233, 249),
      ),
      backgroundColor: ColorPalette().widgetBg,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bienvenue !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Adresse e-mail',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mot de passe',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Action de connexion
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color.fromARGB(255, 188, 208, 243),
                textStyle: const TextStyle(fontSize: 18, color: Colors.black),
                // iconColor: Colors.blueAccent,
              ),
              child: const Text('Se connecter'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Action d'inscription ou mot de passe oublié
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
              style: TextButton.styleFrom(
                iconColor: Colors.blueAccent,
              ),
              child: const Text('Créer un compte ?'),
            ),
          ],
        ),
      ),
    );
  }
}
