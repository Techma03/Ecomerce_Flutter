import 'package:flutter/material.dart';
import 'package:igest/src/theme/color.dart';

class Composentlist extends StatefulWidget {
  const Composentlist({super.key});

  @override
  State<Composentlist> createState() => _ComposentlistState();
}

final List objets = [
  {
    'nom': 'Produit 1',
    'image': 'asset/shoe4.jpg',
    'icon': 'Icons.favorite_border_rounded',
    'route': 'Detail()',
  },
  {
    'nom': 'Produit 2',
    'image': 'asset/shoe9.jpg',
    'icon': 'Icons.favorite_border_rounded',
    'route': 'Detail()',
  },
  {
    'nom': 'Produit 2',
    'image': 'asset/shoe10.jpg',
    'icon': 'Icons.favorite_border_rounded',
    'route': 'Detail()',
  },
  {
    'nom': 'Produit 2',
    'image': 'asset/shoes.jpg',
    'icon': 'Icons.favorite_border_rounded',
    'route': 'Detail()',
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
          childAspectRatio: 2),
      itemCount: objets.length,
      itemBuilder: (context, index) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => objets[index]['route']));
            },
            child: Center(
              child: ListTile(
                leading: Image.asset(
                  objets[index]['image'],
                  width: 40,
                  height: 40,
                ),
                title: Text(objets[index]['nom']),
              ),
            ),
          ),
        );
      },
    );
    // Container(
    //   height: 100,
    //   width: 100,
    //   color: ColorPalette().widgetBg,
    //   child: Column(
    //     children: [
    //       Container(
    //         height: 100,
    //         width: 100,
    //         decoration: BoxDecoration(
    //             color: ColorPalette().widgetBp,
    //             borderRadius: BorderRadius.circular(14)),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Stack(
    //               children: [
    //                 Image.asset(
    //                   'asset/shoe7.jpg',
    //                   fit: BoxFit.fill,
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(
    //                     top: 5,
    //                   ),
    //                   child: Container(
    //                     height: 30,
    //                     width: 30,
    //                     decoration: BoxDecoration(
    //                         color: ColorPalette().widgetBg,
    //                         borderRadius: BorderRadius.circular(20)),
    //                     child: IconButton(
    //                       onPressed: () {},
    //                       icon: Icon(
    //                         Icons.favorite_border_rounded,
    //                         color: ColorPalette().widgetBt,
    //                         size: 15,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
