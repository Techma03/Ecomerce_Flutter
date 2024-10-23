import 'package:flutter/material.dart';
import 'package:igest/src/theme/color.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Prodval extends StatefulWidget {
  final String nomProduit;
  final String prixProduit;
  final String stockProduit;
  final int index; // Ajout de l'index

  const Prodval({
    super.key,
    required this.nomProduit,
    required this.prixProduit,
    required this.stockProduit,
    required this.index, // Recevoir l'index
  });

  @override
  State<Prodval> createState() => _ProdvalState();
}

class _ProdvalState extends State<Prodval> {
  List prodelem = [];

  @override
  void initState() {
    super.initState();
    fetchProd(); // Récupérer les produits existants
    mettreAJourProduit(
        widget.index); // Mettre à jour le produit à l'index donné
  }

  Future<void> fetchProd() async {
    final url = Uri.parse("http://127.0.0.1/bigshop/api0.php?orders");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        prodelem = jsonDecode(response.body);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Erreur lors de la récupération des produits')),
      );
    }
  }

  void mettreAJourProduit(int index) {
    if (index >= 0 && index < prodelem.length) {
      // Mettre à jour le produit existant à l'index donné
      setState(() {
        prodelem[index] = {
          'name': widget.nomProduit,
          'price': widget.prixProduit,
          'stock': widget.stockProduit,
        };
      });
    } else {
      // Si l'index n'existe pas, ajouter le produit à la liste
      setState(() {
        prodelem.add({
          'name': widget.nomProduit,
          'price': widget.prixProduit,
          'stock': widget.stockProduit,
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Produits"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 7,
            child: Container(
              color: ColorPalette().widgetBw,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 3,
                    childAspectRatio: 1),
                itemCount: prodelem.length,
                itemBuilder: (context, index) {
                  final produit = prodelem[index];
                  return Card(
                    color: ColorPalette().widgetBg,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    child: InkWell(
                      onTap: () {
                        // Action à effectuer lorsque l'utilisateur clique sur le produit
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('nom: ${produit['name']}'),
                          Text('Quantite: ${produit['quantite']}'),
                          Text(
                          'Total: ${(produit['price']) * (produit['quantite'] ?? 0)} CDF'
                        )

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: ColorPalette().widgetBw,
              child: Center(
                child: Text("Total des produits : ${prodelem.length}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
