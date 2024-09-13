import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igest/src/theme/color.dart';

class Acaht extends StatefulWidget {
  const Acaht({super.key});

  @override
  State<Acaht> createState() => _AcahtState();
}

class _AcahtState extends State<Acaht> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Text("Achat"),
        actions: [
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  backgroundColor: Color.fromARGB(255, 255, 255, 255)
                  // disabledBackgroundColor: Color.fromARGB(210, 226, 22, 22)
                  // fixedSize: Size(20, 20),
                  ),
              child: Icon(
                Icons.more_vert,
                size: 17,
              )),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: ColorPalette().widgetBt,
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.asset(
                        'asset/shoe4.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jordean RealSnikersLost and\nfound"),
                      Text("CDF38,000",
                          style: TextStyle(fontWeight: FontWeight.w700))
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: ColorPalette().widgetBt,
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.asset(
                        'asset/shoe10.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jordean RealSnikersLost and\nfound"),
                      Text(
                        "CDF38,000",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: ColorPalette().widgetBt,
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.asset(
                        'asset/shoe9.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jordean RealSnikersLost and\nfound"),
                      Text("CDF38,000",
                          style: TextStyle(fontWeight: FontWeight.w700))
                    ],
                  )
                ],
              )
            ],
          ),
          Text("Have a coupon code?"),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                color: ColorPalette().widgetBp,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Panier",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            "Disponible",
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.check_circle_sharp,
                            color: ColorPalette().widgetBt,
                          )
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
