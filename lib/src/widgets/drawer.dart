import 'package:flutter/material.dart';
import 'package:igest/src/pages/achat.dart';
import 'package:igest/src/pages/ajoutprod.dart';
import 'package:igest/src/pages/detail.dart';
import 'package:igest/src/pages/login/logUser.dart';
import 'package:igest/src/pages/login/signUp.dart';
import 'package:igest/src/pages/prod.dart';
import 'package:igest/src/pages/slide/slide.dart';
import 'package:igest/src/pages/users.dart';
import 'package:igest/src/theme/color.dart';
import 'package:igest/src/widgets/toolslist.dart';
import 'package:http/http.dart' as http;

class Pannel extends StatefulWidget {
  const Pannel({super.key});

  @override
  State<Pannel> createState() => _PannelState();
}

class _PannelState extends State<Pannel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20, right: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              borderOnForeground: false,
              elevation: 0,
              child: Image.asset(
                'asset/profil2.jpg',
                width: 105,
                height: 105,
                fit: BoxFit.fill,
              ),
            )
            //     Container(
            //   height: 130,
            //   width: 130,
            //   decoration: BoxDecoration(
            //       color: ColorPalette().widgetBt,
            //       borderRadius: BorderRadius.circular(18)),
            //   child: Image.asset('asset/profil2.jpg'),
            // ),
            ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(
                Icons.shopify,
                size: 30,
              ),
              title: Text(
                "Mes commandes",
                style: TextStyle(color: ColorPalette().widgetbk, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Prodval(
                              nomProduit: '',
                              prixProduit: '',
                              stockProduit: '',
                              index: 0,
                            )));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart_checkout_sharp,
                size: 30,
              ),
              title: Text(
                "Mes prosuits",
                style: TextStyle(color: ColorPalette().widgetbk, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Acaht(
                              stockProduit: '',
                              categorieProduit: '',
                            )));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.add_to_photos_sharp,
                size: 30,
              ),
              title: Text(
                "Ajouter un Produit",
                style: TextStyle(color: ColorPalette().widgetbk, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AjoutProd()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline,
                size: 30,
              ),
              title: Text(
                "A propos",
                style: TextStyle(color: ColorPalette().widgetbk, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => userPage()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person_3,
                size: 30,
              ),
              title: Text(
                "LogIn",
                style: TextStyle(color: ColorPalette().widgetbk, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()
                        // Acaht(stockProduit: '', categorieProduit: '',)
                        ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.people,
                size: 30,
              ),
              title: Text(
                "SignUp",
                style: TextStyle(color: ColorPalette().widgetbk, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()
                        // Acaht(stockProduit: '', categorieProduit: '',)
                        ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.swap_horiz_rounded,
                size: 30,
              ),
              title: Text(
                "Slider",
                style: TextStyle(color: ColorPalette().widgetbk, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnBoarding()
                        // Acaht(stockProduit: '', categorieProduit: '',)
                        ));
              },
            )
          ],
        )
      ],
    );
  }
}
