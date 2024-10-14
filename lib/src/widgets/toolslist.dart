import 'package:flutter/material.dart';
import 'package:igest/src/pages/achat.dart';
import 'package:igest/src/pages/detail.dart';
import 'package:igest/src/theme/color.dart';
import 'package:http/http.dart' as http;

class Composentlist extends StatefulWidget {
  const Composentlist({super.key});

  @override
  State<Composentlist> createState() => _ComposentlistState();
}

var prod = objets[1];

final List objets = [
  {
    'nom': 'Produit 1',
    'image': 'asset/News/2.jpg',
    'icon': 'Icons.favorite_border_rounded',
    'prix': 'CDF 125.000',
    'route': Detail(), // Make sure this points to a valid widget
  },
  {
    'nom': 'Produit 2',
    'image': 'asset/News/0.jpg',
    'icon': 'Icons.favorite_border_rounded',
    'prix': 'CDF 125.000',
    'route': Detail(),
  },
  {
    'nom': 'Produit 3',
    'image': 'asset/News/2.jpg',
    'icon': 'Icons.favorite_border_rounded',
    'prix': 'CDF 125.000',
    'route': Detail(),
  },
  {
    'nom': 'Produit 4',
    'image': 'asset/shoes.jpg',
    'icon': 'Icons.favorite_border_rounded',
    'prix': 'CDF 125.000',
    'route': Detail(),
  }
];

class _ComposentlistState extends State<Composentlist> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1), // Adjust this for better proportions
      itemCount: objets.length,
      itemBuilder: (context, index) {
        return Card(
          color: ColorPalette().widgetBg,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => objets[index]['route']),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  objets[index]['image'],
                  width: double.infinity,
                  height: 100, // Adjust height as needed
                  fit: BoxFit.cover, // Ensures the image covers the area
                ),
                const SizedBox(height: 8), // Space between image and text
                Text(
                  objets[index]['nom'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  objets[index]['prix'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorPalette().widgetBo,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class Detail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Detail Page')),
//       body: Center(child: Text('Detail of the product')),
//     );
//   }
// }