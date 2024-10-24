import 'package:flutter/material.dart';
import 'package:igest/src/theme/color.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:igest/src/widgets/toolslist.dart';

class Prodval extends StatefulWidget {
  final String nomProduit;
  final String prixProduit;
  final int stockProduit;
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
//   var prix =produit[''];
// var qte ;
// final  total = prix

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

  var prix;

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
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 3,
                    childAspectRatio: 5),
                itemCount: prodelem.length,
                itemBuilder: (context, index) {
                  final produit = prodelem[index];
                  final price = double.tryParse(produit['price'].toString());
                  final quantite = int.tryParse(produit['quantite'].toString());
                  final total = price! * quantite!;
                  return Card(
                    color: ColorPalette().widgetBg,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: InkWell(
                      onTap: () {
                        print(
                            'Price: $price, Quantité: $quantite, Total: total');
                        // Action à effectuer lorsque l'utilisateur clique sur le produit
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('nom: ${produit['name']}'),
                                Text('Quantite: ${produit['quantite']}'),
                                Text('Total:  ${total} CDF')
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Card(
                                color: Colors.deepPurpleAccent,
                                margin: EdgeInsets.all(20),
                                child: Text('Se connecter'),
                              )
                            ],
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
