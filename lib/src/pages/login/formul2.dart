import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:igest/src/pages/users.dart';

class PopFormul extends StatefulWidget {
  final String nomUser;
  final String emailUser;
  const PopFormul({super.key, required this.nomUser, required this.emailUser});
  @override
  State<PopFormul> createState() => _PopFormulState();
}

class _PopFormulState extends State<PopFormul> {
  final _formKey = GlobalKey<FormState>();

  

  String? _name;

  String? _email;

  Future<void> updateUser(
      //int idUser,
      ) async {
    final url = Uri.parse("http://127.0.0.1/bigshop/apiUser.php?id");
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nom': _name,
        'email': _email,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Utilisateur modifié avec succès')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => userPage(),
        ),
      );
      //(); // Met à jour la liste après modification
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Erreur lors de la modification de l\'utilisateur')),
      );
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ajouter un utilisateur'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nom'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre nom';
                }
                return null;
              },
              onSaved: (value) {
                _name = value;
              },
            ),
            TextFormField(
              
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre email';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Veuillez entrer un email valide';
                }
                return null;
              },
              onSaved: (value) {
                _email = value;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Ferme le dialogue
          },
          child: Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              updateUser();
              _formKey.currentState!.save(); // Enregistre les données
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Nom: $_name, Email: $_email')),
              );
              // Navigator.of(context).pop(); // Ferme le dialogue
            }
          },
          child: Text('Soumettre'),
        ),
      ],
    );
  }
}
