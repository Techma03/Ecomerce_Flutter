import 'package:flutter/material.dart';
import 'package:igest/src/pages/achat.dart';
import 'package:igest/src/pages/home_screen.dart';
import 'package:igest/src/theme/color.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final List shoes = [
    {
      'nom': 'adidas',
      'detail': 'jordan1 Dior',
      'prix': 'CDF9,000',
      'profil': 'asset/shoe4.jpg'
    },
    {
      'nom': 'nike',
      'detail': 'Adidas',
      'prix': 'CDF70,000',
      'profil': 'asset/shoes.jpg'
    },
    {
      'nom': 'snikers',
      'detail': 'jordan1 Dior',
      'prix': 'CDF25,000',
      'profil': 'asset/shoe9.jpg'
    },
    {
      'nom': 'airforce',
      'detail': 'jordan1 Dior',
      'prix': 'CDF22,000',
      'profil': 'asset/shoe10.jpg'
    },
    {
      'nom': 'puma',
      'detail': 'jordan1 Dior',
      'prix': 'CDF53,000',
      'profil': 'asset/shoes.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette().widgetBw,
      ),
      backgroundColor: ColorPalette().widgetBw,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Stack(
            children: [
              Image.asset(
                'asset/shoes.jpg',
                fit: BoxFit.fitWidth,
              ),
              const Text(
                " Jordan ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
                textScaler: TextScaler.linear(2),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 80, // Ajuste la hauteur pour bien afficher les images
            width: double.infinity, // Ajuste la largeur pour être responsive
            color: ColorPalette().widgetBw,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: shoes.map((e) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: [
                          // SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(2),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: ColorPalette().widgetBo,
                                shape: BoxShape.circle),
                            child: CircleAvatar(
                              radius: 15, // Ajuste la taille de l'avatar
                              backgroundImage: AssetImage(e['profil']),
                            ),
                          ),
                          // const SizedBox(height: 5), // Ajoute un espacement
                          // Text(e['nom']),
                          // Text(e['prix']),
                        ],
                      ),
                    ),
                  );
                }).toList(), // Convertit le résultat du map en liste
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 6, left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Jordan1Low",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {},
                        mouseCursor: MouseCursor.uncontrolled,
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          color: ColorPalette().widgetBo,
                          size: 18,
                        )),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    "CDF14,000",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "5Paires Vendus",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12),
                        )),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Vendus",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12),
                        )),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "4.7(vue)",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(color: ColorPalette().widgetBb)
                            // fixedSize: Size.square(30)
                            ),
                        child: Icon(
                          Icons.chat_bubble_outline,
                          color: ColorPalette().widgetBb,
                          size: 15,
                        )),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(color: ColorPalette().widgetBb)
                          // fixedSize: Size.square(30)
                          ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: ColorPalette().widgetBb,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Ajouter au Panier",
                            style: TextStyle(
                                fontSize: 13, color: ColorPalette().widgetBp),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(color: ColorPalette().widgetBb),
                            backgroundColor:
                                const Color.fromARGB(255, 246, 199, 130)
                            // fixedSize: Size.square(30)
                            ),
                        child: Text(
                          "Buy",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: ColorPalette().widgetbk),
                        )),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
