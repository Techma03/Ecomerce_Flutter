import 'package:flutter/material.dart';
import 'package:igest/src/pages/home_screen.dart';
import 'package:igest/src/pages/slide/slide.dart';
import 'package:igest/src/pages/slide/start.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
//  {
//     'nom': 'Jordan',
//     'image': 'asset/shoe4.jpg',
//     'prix': 'CDF 38.000',
//   },
//   {
//     'nom': 'Jordan',
//     'image': 'asset/shoe4.jpg',
//     'prix': 'CDF 52.000',
//   },
//   {
//     'nom': 'Vans',
//     'image': 'asset/shoe9.jpg',
//     'prix': 'CDF 78.000',
//   },
//   {
//     'nom': 'Vans',
//     'image': 'asset/shoe9.jpg',
//     'prix': 'CDF 72.000',
//   },
//   {
//     'nom': 'Nike',
//     'image': 'asset/shoes.jpg',
//     'prix': 'CDF 10.000',
//   },
//   {
//     'nom': 'Nike',
//     'image': 'asset/shoes.jpg',
//     'prix': 'CDF 25.000',
//   },
//   {
//     'nom': 'aAzur',
//     'image': 'asset/shoe10.jpg',
//     'prix': 'CDF 10.000',
//   },
//   {
//     'nom': 'aAzur',
//     'image': 'asset/shoe10.jpg',
//     'prix': 'CDF 15.000',
//   },
//   {
//     'nom': 'Vans',
//     'image': 'asset/shoe9.jpg',
//     'prix': 'CDF 78.000',
//   },
//   {
//     'nom': 'Vans',
//     'image': 'asset/shoe9.jpg',
//     'prix': 'CDF 72.000',
//   },
//   {
//     'nom': 'Pusy',
//     'image': 'asset/shoe7.jpg',
//     'prix': 'CDF 18.000',
//   },
//   {
//     'nom': 'Pusy',
//     'image': 'asset/shoe7.jpg',
//     'prix': 'CDF 12.000',
//   },