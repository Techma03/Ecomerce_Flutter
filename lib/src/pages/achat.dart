import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igest/src/pages/detail.dart';
import 'package:igest/src/pages/formulaire.dart';
import 'package:igest/src/theme/color.dart';
import 'package:http/http.dart' as http;

class Acaht extends StatefulWidget {
  final String stockProduit;
  final String categorieProduit;

  const Acaht({
    super.key,
    required this.stockProduit,
    required this.categorieProduit,
  });

  @override
  State<Acaht> createState() => _AcahtState();
}

List element = [];
List<Map<String, String>> images = [
  {'categorieProduit': 'Chaussure', 'image': 'asset/News/0.jpg'},
  {'categorieProduit': 'Vetement', 'image': 'asset/News/2.jpg'},
  {'categorieProduit': 'Voiture', 'image': 'asset/News/1.jpg'},
];

String getImageForCategory(String category) {
  final imageMap = images.firstWhere(
      (element) => element['categorieProduit'] == category,
      orElse: () => {'image': 'assets/images/default.png'} // Image par défaut
      );
  return imageMap['image']!;
}

class _AcahtState extends State<Acaht> {
//  String imageUrl = getImageForCategory(category);

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
    final url = Uri.parse("http://127.0.0.1/bigshop/api0.php?produit");
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
        Uri.parse("http://127.0.0.1/bigshop/api0.php?id_produit=$id_produit");
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

  String? getImageUrl(String categorie) {
    Map<String, String> images = {
      'chaussure': 'asset/News/0.jpg',
      'television':
          'https://as1.ftcdn.net/v2/jpg/05/72/21/64/1000_F_572216419_uKyqMoj7Ok2eivywPWKyqK7szmD6MrVU.jpg',
      'telephone':
          'https://fr.shopping.rakuten.com/photo/16061013500_L_NOPAD.jpg',
      'voiture':
          'https://fr.shopping.rakuten.com/photo/modele-de-voiture-toyota-2005-en-alliage-moule-1-32-son-et-lumiere-modele-de-voiture-classique-de-luxe-jouet-de-collection-cadeau-1955696859_L_NOPAD.jpg',
      'vetement':
          'https://img.freepik.com/photos-gratuite/boutique-vetements-boutique-vetements-cintre-boutique-moderne_1150-8886.jpg?size=626&ext=jpg',
    };
    return images[categorie.toLowerCase()];
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
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Detail(),
                                    ),
                                  );
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
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                                visible: false,
                                child: Text(
                                  " ${element[index]['description']}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: ColorPalette().widgetbk,
                                  ),
                                )),

                            // Image.network(
                            //   element[index]['image'] ??
                            //       'https://cdn.prod.website-files.com/643149de01d4474ba64c7cdc/65428da5c4c1a2b9740cc088_20231101-ImageNonDisponible-v1.jpg', // URL par défaut si pas d'image
                            //   width: 300,
                            //   height: 100,
                            // ),
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
                                        builder: (context) => Formulaire(
                                              nomProduit: element[index]
                                                  ['name'],
                                              categorieProduit: element[index]
                                                  ['description'],
                                              prixProduit: element[index]
                                                  ['price'],
                                              stockProduit: widget.stockProduit,
                                              index: index,
                                            ));
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
