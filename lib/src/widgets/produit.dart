import 'package:flutter/material.dart';
import 'package:igest/src/theme/color.dart';
import 'package:igest/src/widgets/toolslist.dart';

class Produit extends StatefulWidget {
  const Produit({super.key});

  @override
  State<Produit> createState() => _ProduitState();
}

class _ProduitState extends State<Produit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
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
              Text(
                "Voir +",
                style: TextStyle(
                  color: ColorPalette().widgetBt,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child:Composentlist()
           
        )
      ],
    );
  }
}
