import 'package:flutter/material.dart';
import 'package:igest/src/pages/detail.dart';
import 'package:igest/src/theme/color.dart';
import 'package:igest/src/widgets/produit.dart';
import 'package:igest/src/widgets/scrowll.dart';
import 'package:igest/src/widgets/search.dart';

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
            Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: ColorPalette().widgetBg,
                  borderRadius: BorderRadius.circular(16), // Arrondir les coins
                ),
                child: Icon(Icons.menu)),
            Text("My BigShop"),
            Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: ColorPalette().widgetBg,
                  borderRadius: BorderRadius.circular(16), // Arrondir les coins
                ),
                child: Icon(Icons.store))
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false, // Désactiver le bouton retour
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
            padding: EdgeInsets.only(left: 17.0, right: 17.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: ColorPalette().widgetBt,
                    ), // Icône de localisation
                    SizedBox(
                        width: 8.0), // Espacement entre l'icône et le texte
                    Text("Goma City, Katoyi Ndosho"), // Texte à côté de l'icône
                  ],
                ),
                Icon(Icons.arrow_back_ios_rounded),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Scrowll(),
          SizedBox(
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
                      padding: EdgeInsets.only(top: 15),
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
                          SizedBox(
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
                                backgroundColor: ColorPalette().widgetBt),
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
              child: const Produit(),
            ),
          )
        ],
      ),
    );
    //);
  }
}
