import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Formulaire extends StatefulWidget {
  final String nomProduit;
  final String categorieProduit;
  final String prixProduit;
  final String stockProduit;
  final String idProduit;
  final int index;

  const Formulaire({
    super.key,
    required this.nomProduit,
    required this.categorieProduit,
    required this.prixProduit,
    required this.stockProduit,
    required this.idProduit,
    required this.index,
  });

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  // Initialiser des valeurs par défaut
  var name;
  var price;
  var qteAcht;
  var idProduit;

  // Liste des quantités disponibles
  final List<int> quantites = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int? selectedQuantity;

  @override
  void initState() {
    super.initState();
    fetchprod();
  }

  Future<void> fetchprod() async {
    final url = Uri.parse("http://127.0.0.1/bigshop/api0.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Gérer la réponse API ici
      if (mounted) {
        setState(() {
          // Mettre à jour la variable Product si nécessaire
        });
      }
    } else {
      print("Erreur lors de la récupération des produits");
    }
  }

  Future<void> addProd() async {
    if (selectedQuantity == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Veuillez sélectionner une quantité')),
        );
      }
      return;
    }

    final url = Uri.parse("http://127.0.0.1/bigshop/api0.php?addOrder");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'quantite': selectedQuantity.toString(),
        'id_produit': widget.index.toString(),
      }),
    );

    if (response.statusCode == 200) {
      if (mounted) {
        print("Produit ajouté avec succès");
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Achat réussi')));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors de l\'achat du produit')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double prixProduit = double.parse(widget.prixProduit);
    double total = (selectedQuantity ?? 0) * prixProduit;

    return AlertDialog(
      content: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(height: 18),
            TextField(
              textAlign: TextAlign.start,
              decoration:
                  InputDecoration(hintText: 'Produit:  ${widget.nomProduit}'),
              readOnly: true,
            ),
            SizedBox(height: 8),
            TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: "Catégorie:  ${widget.categorieProduit}",
              ),
              readOnly: true,
            ),
            SizedBox(height: 8),
            TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: "Prix:  ${widget.prixProduit} CDF",
              ),
              readOnly: true,
            ),
            SizedBox(height: 8),
            // Dropdown pour sélectionner la quantité
            DropdownButton<int>(
              value: selectedQuantity,
              hint: Text("Sélectionnez la quantité"),
              isExpanded: false,
              itemHeight: 48,
              menuMaxHeight: 200,
              items: quantites.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  selectedQuantity = newValue;
                });
              },
            ),
            SizedBox(height: 30),
            Text("Total à payer: ${total.toStringAsFixed(2)} CDF"),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            addProd(); // Ajout de la validation du produit
          },
          child: const Text("Valider la demande"),
        )
      ],
    );
  }
}
