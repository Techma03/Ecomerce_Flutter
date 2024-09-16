import 'package:flutter/material.dart';
import 'package:igest/src/pages/achat.dart';
import 'package:igest/src/pages/home_screen.dart';
import 'package:igest/src/theme/color.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 380,
                width: 325,
                decoration: BoxDecoration(
                    color: ColorPalette().widgetBp,
                    borderRadius: BorderRadius.circular(23)),
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 5, right: 5),
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))
                                // fixedSize: Size(10, 20),
                                ),
                            child: const Icon(
                              Icons.arrow_back_rounded,
                              size: 17,
                            )),
                        const Text(
                          " Jordan ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              // fixedSize: Size(20, 20),
                            ),
                            child: Icon(
                              Icons.more_vert,
                              size: 17,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 300,
                      width: 320,
                      child: Image.asset(
                        'asset/shoes.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  ]),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: ColorPalette().widgetBt,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(
                    'asset/shoe9.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: ColorPalette().widgetBt,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(
                    'asset/shoe9.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: ColorPalette().widgetBt,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(
                    'asset/shoe9.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: ColorPalette().widgetBt,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(
                    'asset/shoe9.jpg',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 6, left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jordan1Low",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          color: ColorPalette().widgetBp,
                          size: 18,
                        )),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    "CDF14,000",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )),
              Padding(
                padding: EdgeInsets.all(5),
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
              // Padding(
              //   padding: EdgeInsets.all(3),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       // Text(
              //       //   "Taille",
              //       //   style:
              //       //       TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              //       // ),
              //       TextButton(
              //           onPressed: () {},
              //           child: Text(
              //             "Voir",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w600,
              //                 fontSize: 16,
              //                 color: ColorPalette().widgetBt),
              //           ))
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(color: ColorPalette().widgetBt)
                            // fixedSize: Size.square(30)
                            ),
                        child: Icon(
                          Icons.chat_bubble_outline,
                          color: ColorPalette().widgetBt,
                          size: 15,
                        )),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(color: ColorPalette().widgetBt)
                          // fixedSize: Size.square(30)
                          ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: ColorPalette().widgetBt,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Ajouter au Panier",
                            style: TextStyle(
                                fontSize: 13, color: ColorPalette().widgetBt),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Acaht()));
                        },
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(color: ColorPalette().widgetBt),
                            backgroundColor: Color.fromARGB(248, 15, 114, 4)
                            // fixedSize: Size.square(30)
                            ),
                        child: Text(
                          "Buy",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: ColorPalette().widgetBg),
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
