import 'package:flutter/material.dart';
import 'package:igest/src/pages/achat.dart';
import 'package:igest/src/pages/detail.dart';
import 'package:igest/src/theme/color.dart';
import 'package:igest/src/widgets/drawer.dart';
import 'package:igest/src/widgets/scrowll.dart';
import 'package:igest/src/widgets/search.dart';
import 'package:igest/src/widgets/toolslist.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //     padding: const EdgeInsets.all(6),
            //     decoration: BoxDecoration(
            //       color: ColorPalette().widgetBg,
            //       borderRadius: BorderRadius.circular(16), // Arrondir les coins
            //     ),
            //     child: const Icon(Icons.menu)),
            const Text("My BigShop"),
            Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: ColorPalette().widgetBg,
                  borderRadius: BorderRadius.circular(16), // Arrondir les coins
                ),
                child: const Icon(Icons.store))
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        //automaticallyImplyLeading: false, // Désactiver le bouton retour
      ),
      drawer: const Drawer(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        child: Pannel(),
      ),
      backgroundColor: Colors.white,
      body:
          // const SingleChildScrollView(
          //   child:
          Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SearchProduct(),
          Padding(
            padding: const EdgeInsets.only(left: 17.0, right: 17.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: ColorPalette().widgetBb,
                    ), // Icône de localisation
                    const SizedBox(
                        width: 8.0), // Espacement entre l'icône et le texte
                    const Text(
                        "Goma City, Katoyi Ndosho"), // Texte à côté de l'icône
                  ],
                ),
                const Icon(Icons.arrow_back_ios_rounded),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Scrowll(),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 110,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorPalette().widgetbk),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    flex: 7,
                    child: Image.asset(
                      'asset/shoe4.jpg',
                      fit: BoxFit.cover,
                    )
                    // Container(
                    //   height: 110,
                    //   width: 130,
                    //   color: ColorPalette().widgetBt,
                    //),
                    ),
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 110,
                    width: 130,
                    color: ColorPalette().widgetbk,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            "Promotion Vente",
                            style: TextStyle(
                              color: ColorPalette().widgetBg,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Jusqu'à 90%",
                            style: TextStyle(
                              color: ColorPalette().widgetBp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Detail()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPalette().widgetBb),
                            child: Text(
                              "Achèter",
                              style: TextStyle(
                                  color: ColorPalette().widgetBg,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: ColorPalette().widgetBw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nouveau Produit",
                          style: TextStyle(
                            color: ColorPalette().widgetbk,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Acaht()));
                          },
                          child: Text(
                            "Voir +",
                            style: TextStyle(
                              color: ColorPalette().widgetBo,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Expanded(child: Composentlist()),
                ],
              ),
            ),
          )
        ],
      ),
    );
    //);
  }
}
