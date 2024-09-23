import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igest/src/pages/objet.dart';
import 'package:igest/src/theme/color.dart';
import 'package:http/http.dart' as http;

class Acaht extends StatefulWidget {
  const Acaht({super.key});

  @override
  State<Acaht> createState() => _AcahtState();
}


final List element = [
  {
    'nom': 'Jordan',
    'image': 'asset/shoe4.jpg',
    'prix': 'CDF 38.000',
  },
  {
    'nom': 'Jordan',
    'image': 'asset/shoe4.jpg',
    'prix': 'CDF 52.000',
  },
  {
    'nom': 'Vans',
    'image': 'asset/shoe9.jpg',
    'prix': 'CDF 78.000',
  },
  {
    'nom': 'Vans',
    'image': 'asset/shoe9.jpg',
    'prix': 'CDF 72.000',
  },
  {
    'nom': 'Nike',
    'image': 'asset/shoes.jpg',
    'prix': 'CDF 10.000',
  },
  {
    'nom': 'Nike',
    'image': 'asset/shoes.jpg',
    'prix': 'CDF 25.000',
  },
  {
    'nom': 'aAzur',
    'image': 'asset/shoe10.jpg',
    'prix': 'CDF 10.000',
  },
  {
    'nom': 'aAzur',
    'image': 'asset/shoe10.jpg',
    'prix': 'CDF 15.000',
  },
  {
    'nom': 'Vans',
    'image': 'asset/shoe9.jpg',
    'prix': 'CDF 78.000',
  },
  {
    'nom': 'Vans',
    'image': 'asset/shoe9.jpg',
    'prix': 'CDF 72.000',
  },
  {
    'nom': 'Pusy',
    'image': 'asset/shoe7.jpg',
    'prix': 'CDF 18.000',
  },
  {
    'nom': 'Pusy',
    'image': 'asset/shoe7.jpg',
    'prix': 'CDF 12.000',
  },
];

class _AcahtState extends State<Acaht> {
@override

void initState (){
  super.initState();
  fetchObjet();
}

  Future <void> fetchObjet() async {
    final url = Uri.parse("uri");
    final response = await http.get(url);

    if (response.statusCode == 200){
      //passe
    setState(() {
      
    });
    }else{
      //ne pass pas
      print("erreur");
    }
  }
   Future <void> addObjet() async {
    final url = Uri.parse("uri");
    final response = await http.post(
      url,
      headers: {'content-Type':'application/json'},
      // body: covert.json.encode
      );

    if (response.statusCode == 200){
      //passe
   print("pass");
   fetchObjet();
    }else{
      //ne pass pas
      print("erreur");
    } 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
       
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 7,
              child: Container(
                color: ColorPalette().widgetBw,
                height: 21,
                width: 20,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1),
                  itemCount: element.length,
                  itemBuilder: (context, index) {
                    return Card(
                        color: ColorPalette().widgetBg,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text(
                                          "",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorPalette().widgetBo,
                                          ),
                                        ),
                                        content: Text(
                                          "Voulez-vous vraiment achter ?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorPalette().widgetbk,
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context, 'Oui');
                                              },
                                              child: const Text("Oui")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context, 'non');
                                              },
                                              child: const Text("Non"))
                                        ],
                                      ));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  element[index]['image'],
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  // width: 100,
                                  // height: 100,
                                ),
                                Text(
                                  element[index]['nom'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: ColorPalette().widgetbk,
                                  ),
                                ),
                                Text(
                                  element[index]['prix'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: ColorPalette().widgetBb,
                                  ),
                                )
                              ],
                            )));
                  },
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: ColorPalette().widgetBw,
                height: 21,
                width: 20,
                child: const Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text("Have a coupon code?"),
                    //     SizedBox(
                    //       height: 10,
                    //     ),
                    //     Center(
                    //       child: Container(
                    //         height: 40,
                    //         width: 320,
                    //         decoration: BoxDecoration(
                    //           color: ColorPalette().widgetBp,
                    //           borderRadius: BorderRadius.circular(20),
                    //         ),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Padding(
                    //               padding: EdgeInsets.only(left: 10),
                    //               child: Text(
                    //                 "Panier",
                    //                 style: TextStyle(fontWeight: FontWeight.w700),
                    //               ),
                    //             ),
                    //             TextButton(
                    //                 onPressed: () {},
                    //                 child: Row(
                    //                   children: [
                    //                     Text(
                    //                       "Disponible",
                    //                       style: TextStyle(
                    //                           fontWeight: FontWeight.w400),
                    //                     ),
                    //                     Icon(
                    //                       Icons.check_circle_sharp,
                    //                       color: ColorPalette().widgetBt,
                    //                     )
                    //                   ],
                    //                 ))
                    //           ],
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    ),
              )),
        ],
      ),
    );
  }
}
