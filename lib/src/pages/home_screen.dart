import 'package:flutter/material.dart';
import 'package:igest/src/theme/color.dart';
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
                    borderRadius:
                        BorderRadius.circular(16), // Arrondir les coins
                  ),
                  child: Icon(Icons.menu)),
              Text("My BigShop"),
              Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: ColorPalette().widgetBg,
                    borderRadius:
                        BorderRadius.circular(16), // Arrondir les coins
                  ),
                  child: Icon(Icons.store))
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchProduct(),
              Padding(
                padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.place), // Icône de localisation
                        SizedBox(
                            width: 8.0), // Espacement entre l'icône et le texte
                        Text(
                            "Goma City, Katoyi Ndosho"), // Texte à côté de l'icône
                      ],
                    ),
                    Icon(Icons.transform),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
