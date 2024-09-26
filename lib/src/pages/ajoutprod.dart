import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:igest/src/theme/color.dart';
import 'package:igest/src/pages/achat.dart ';
import 'package:http/http.dart' as http;

class AjoutProd extends StatefulWidget {
  const AjoutProd({super.key});

  @override
  State<AjoutProd> createState() => _AjoutProdState();
}

class _AjoutProdState extends State<AjoutProd> {
  final TextEditingController produit = TextEditingController();
  final TextEditingController categorie = TextEditingController();
  final TextEditingController prix = TextEditingController();
  final TextEditingController stock = TextEditingController();
  String? message;
  @override
  void initState() {
    super.initState();
    fetchObjet();
  }

  Future<void> fetchObjet() async {
    final url = Uri.parse("http://127.0.0.1/bigshop/api.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //passe
      setState(() {});
    } else {
      //ne pass pas
      print("erreur");
    }
  }

  Future<void> addObjet() async {
    final url = Uri.parse("http://127.0.0.1/bigshop/api.php");
    final response = await http.post(
      url,
      headers: {'content-Type': 'application/json'},
      body: jsonEncode({
        'name': produit.text,
        'price': prix.text,
        'description': categorie.text,
        'stock': stock.text,
      }),
    );

if (stock == null || stock != 0) {
      setState(() {
        message = "";
      });
      return; // Stoppe l'exécution de la fonction si la validation échoue
    }

    if (prix == null || prix != 0) {
      setState(() {
        message = "Le prix doit être supérieur à 0.";
      });
      return; // Stoppe l'exécution de la fonction si la validation échoue
    }

    if (response.statusCode == 200) {
      //passe
      print("pass");
      // fetchObjet();
      final data = jsonDecode(response.body);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('inserer avec succes')));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Acaht()),
      );
    } else {
      //ne pass pas
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Erreur lors de l\'insertion de l\'utilisateur')),
      );
    }
  }

  void checkPrice() {
    final price = double.tryParse(prix.text) ?? 0;

    if (price == 0) {
      setState(() {
        message = "Le prix ne peut pas être zéro.";
      });
    } else {
      setState(() {
        message = null; // Réinitialise le message d'erreur
      });
      // Continuez avec le traitement du prix valide
      print("Prix valide: $price");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette().widgetBw,
      ),
      backgroundColor: ColorPalette().widgetBw,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
                height: 550,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: ColorPalette().widgetBp,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Text(
                          "Nouveau Produit",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextField(
                        controller: produit,
                        decoration: InputDecoration(hintText: 'Produit'),
                      ),
                      TextField(
                        controller: categorie,
                        decoration: InputDecoration(hintText: 'Categorie'),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: prix,
                              forceErrorText: message,
                              decoration: InputDecoration(hintText: 'Prix'),
                            ),
                          ),
                          SizedBox(
                              width: 20), // Espace entre les deux TextFields
                          Expanded(
                            child: TextField(
                              controller: stock,
                              decoration: InputDecoration(hintText: 'Stock'),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                checkPrice();
                                addObjet();
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: Text(
                                "Ajouter ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 12, 76, 128)),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: const Text(
                                "Supprimer ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 252, 4, 4)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 130,
                            width: 310,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorPalette().widgetbk, width: 0.3),
                              color: ColorPalette().widgetBp,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Recement Ajouter",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 130,
                            width: 310,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorPalette().widgetbk, width: 0.3),
                              color: ColorPalette().widgetBp,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Recement Supprimer",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
