import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igest/src/pages/detail.dart';
import 'package:igest/src/pages/formulaire.dart';
import 'package:igest/src/theme/color.dart';
import 'package:http/http.dart' as http;

class Acaht extends StatefulWidget {
  const Acaht({super.key});

  @override
  State<Acaht> createState() => _AcahtState();
}

List element = [];

class _AcahtState extends State<Acaht> {
  @override
  void initState() {
    super.initState();
    fetchObjet();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   fetchObjet();
    // });
  }

  // Fonction pour récupérer tous les produits depuis l'API
  Future<void> fetchObjet() async {
    final url = Uri.parse("http://127.0.0.1/bigshop/api.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        element = jsonDecode(response.body);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Erreur lors de la récupération des produits')),
      );
    }
  }

  // Fonction pour supprimer un produit avec son ID
  Future<void> deleteObjet(int id_produit) async {
    final url =
        Uri.parse("http://127.0.0.1/bigshop/api.php?id_produit=$id_produit");
    final response = await http.delete(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Produit supprimé avec succès')),
      );
      fetchObjet(); // Mise à jour de la liste après suppression
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Erreur lors de la suppression du produit')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                    mainAxisSpacing: 10,
                    childAspectRatio: 1),
                itemCount: element.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: ColorPalette().widgetBg,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Icon(
                              Icons.shopping_bag_outlined,
                              size: 40,
                              color: Colors.blue,
                            ),
                            content: Text(
                              'Voulez-vous voir plus de details ?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorPalette().widgetbk,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Detail()));
                                  Navigator.pop(context); // Fermer le dialogue
                                },
                                child: const Text(
                                  "Oui",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Navigator.pop(context); // Fermer le dialogue
                                },
                                child: const Text("Non"),
                              ),
                            ],
                          ),
                        );
                      },
                      onDoubleTap: () {
                        // Confirmation avant la suppression
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Icon(
                              Icons.delete_forever,
                              size: 40,
                              color: Colors.red,
                            ),
                            content: Text(
                              'Voulez-vous vraiment supprimer ce produit ?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorPalette().widgetbk,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  deleteObjet(element[index][
                                      'id_produit']); // Supprimer le produit avec son
                                  fetchObjet();
                                  Navigator.pop(context); // Fermer le dialogue
                                },
                                child: const Text(
                                  "Supprimer",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Fermer le dialogue
                                },
                                child: const Text("Annuler"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Stack(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Text(
                                      "${element[index]['stock']}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Placeholder(
                              color: Colors.purpleAccent,
                              fallbackHeight: 100,
                              fallbackWidth: 100,
                            ),
                          ]),
                          Text(
                            element[index]['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: ColorPalette().widgetbk,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Prix : ${element[index]['price']}CDF",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: ColorPalette().widgetBb,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => Formulaire());
                                  },
                                  icon:
                                      const Icon(Icons.shopping_cart_outlined))
                            ],
                          ),
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
            ),
          ),
        ],
      ),
    );
  }
}
