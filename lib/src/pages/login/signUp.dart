import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:igest/src/pages/home_screen.dart';
import 'package:igest/src/pages/users.dart';
import 'package:igest/src/theme/color.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nom = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController pass1 = TextEditingController();

  TextEditingController pass2 = TextEditingController();

  Future<void> addUser() async {
    final urli = Uri.parse("http://127.0.0.1/bigshop/apiUser.php");

    final response = await http.post(urli,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'nom': nom.text, 'e-mail': email.text, 'password': pass1.text}));
    if (response.statusCode == 200) {
      final data = jsonEncode(response.body);
      print("passez avec succes");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User inserted')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => userPage(),
        ),
      );
    } else {
      print("Erreur lors de l'insertion");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Erreur lors de l\'insertion de l\'utilisateur')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Inscription'),
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
            TextField(
              controller: nom,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nom complet',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
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
              controller: pass1,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mot de passe',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: pass2,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirmez le mot de passe',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Action d'inscription
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const userPage()));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color.fromARGB(255, 188, 208, 243),
                textStyle: const TextStyle(fontSize: 18, color: Colors.black),
                // iconColor: Colors.blueAccent,
              ),
              child: const Text('S\'inscrire'),
            ),
          ],
        ),
      ),
    );
  }
}
