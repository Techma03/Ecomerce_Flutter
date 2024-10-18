import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:igest/src/pages/users.dart';
class PopFormul extends StatefulWidget {
  final String nomUser;
  final String emailUser;
 // final int idUser;

  const PopFormul({
    super.key, 
    required this.nomUser, 
    required this.emailUser, 
   // required this.idUser
  });

  @override
  State<PopFormul> createState() => _PopFormulState();
}

class _PopFormulState extends State<PopFormul> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _email;
   Int? _index;

  @override
  void initState() {
    super.initState();
    // Initialisation avec les valeurs actuelles
    _name = widget.nomUser;
    _email = widget.emailUser;
    // _index = widget.idUser;
  }

  Future<void> updateUser() async {
    final url = Uri.parse("http://127.0.0.1/bigshop/apiUser.php?idUser=");
    
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nom': _name,
        'email': _email,
      }),
    );
    // iduser = _index;

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Utilisateur modifié avec succès')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const userPage()), // Assurez-vous que userPage soit const
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erreur lors de la modification de l\'utilisateur'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Modifier un utilisateur'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _name, // Affichage du nom actuel
              decoration: const InputDecoration(labelText: 'Nom'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un nom';
                }
                return null;
              },
              onSaved: (value) {
                _name = value;
              },
            ),
            TextFormField(
              initialValue: _email, // Affichage de l'email actuel
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un email';
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
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save(); // Enregistre les données
              updateUser(); // Appelle la fonction de mise à jour après l'enregistrement
            }
          },
          child: const Text('Soumettre'),
        ),
      ],
    );
  }
}

