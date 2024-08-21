import 'package:flutter/material.dart';
import 'package:igest/src/theme/color.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true, // Active le remplissage de l'arrière-plan
          fillColor: ColorPalette().widgetBg, // Couleur de fond
          hintText: 'Quel produit cherchez-vous?', // Texte d'indication
          prefixIcon: Icon(Icons.search), // Icône avant le texte
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Bordure arrondie
            borderSide: BorderSide.none, // Supprime la bordure
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                30.0), // Bordure arrondie lors de la focalisation
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
