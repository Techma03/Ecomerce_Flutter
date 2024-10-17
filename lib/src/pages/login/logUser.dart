import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:igest/src/pages/home_screen.dart';
import 'package:igest/src/pages/login/signUp.dart';
import 'package:igest/src/theme/color.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> loginUser() async {
    // Vérification des champs vides
    if (email.text.isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
      return; // Sortir de la méthode si les champs sont vides
    }

    final url = Uri.parse("http://127.0.0.1/bigshop/login.php?checkUser");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email.text,
        'password': password.text,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['message'] == 'Login successful') {
        print("Connexion réussie : ${data['idUser']}");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Connexion réussie')),
        );

        // Rediriger vers la page principale de l'utilisateur après connexion
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomePage(), // Ou une autre page après connexion
          ),
        );
      } else {
        print("Identifiants incorrects");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Identifiants incorrects. Veuillez réessayer.')),
        );
      }
    } else {
      print("Erreur de connexion au serveur");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la tentative de connexion.')),
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
                loginUser(); // Pas de Navigator.pop ici
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color.fromARGB(255, 188, 208, 243),
                textStyle: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              child: const Text('Se connecter'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Action d'inscription ou mot de passe oublié
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
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


