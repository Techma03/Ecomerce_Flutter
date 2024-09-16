import 'package:flutter/material.dart';
import 'package:igest/src/theme/color.dart';

class Scrowll extends StatefulWidget {
  const Scrowll({super.key});

  @override
  State<Scrowll> createState() => _ScrowllState();
}

class _ScrowllState extends State<Scrowll> {
  final List<dynamic> photoProfils = [
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
    {
      'nom': 'vans',
      'detail': 'jordan1 Dior',
      'prix': 'CDF66,000',
      'profil': 'asset/shoe7.jpg'
    },
    {
      'nom': 'jardan',
      'detail': 'jordan1 Dior',
      'prix': 'CDF36,000',
      'profil': 'asset/shoe8.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Ajuste la hauteur pour bien afficher les images
      width: double.infinity, // Ajuste la largeur pour être responsive
      color: ColorPalette().widgetBw,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: photoProfils.map((e) {
            return Container(
              margin: const EdgeInsets.only(left: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    // SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(2),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: ColorPalette().widgetBp,
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                        radius: 25, // Ajuste la taille de l'avatar
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
    );
  }
}
