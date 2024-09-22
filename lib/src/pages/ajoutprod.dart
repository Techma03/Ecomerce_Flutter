import 'package:flutter/material.dart';
import 'package:igest/src/theme/color.dart';

class AjoutProd extends StatefulWidget {
  const AjoutProd({super.key});

  @override
  State<AjoutProd> createState() => _AjoutProdState();
}

class _AjoutProdState extends State<AjoutProd> {
  final TextEditingController produit = TextEditingController();
  final TextEditingController categorie = TextEditingController();
  final TextEditingController description = TextEditingController();
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
                      TextField(
                        controller: description,
                        decoration: InputDecoration(hintText: 'Description'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
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
                            height: 150,
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
                            height: 150,
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
