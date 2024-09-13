import 'package:flutter/material.dart';
import 'package:igest/src/theme/color.dart';

class Composentlist extends StatefulWidget {
  const Composentlist({super.key});

  @override
  State<Composentlist> createState() => _ComposentlistState();
}

class _ComposentlistState extends State<Composentlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      color: ColorPalette().widgetBt,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          // padding: EdgeInsets.only(top: 10),
          runAlignment: WrapAlignment.spaceAround,
          runSpacing: 50,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: ColorPalette().widgetbk,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 8),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: ColorPalette().widgetBw,
                                    borderRadius: BorderRadius.circular(20)),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_rounded,
                                      color: ColorPalette().widgetBt,
                                      size: 15,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'asset/shoe7.jpg',
                              fit: BoxFit.fill,
                            ),
                          ],
                        )
                      ],
                    )),
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: ColorPalette().widgetbk,
                  ),
                ),
                // Container(
                //   height: 140,
                //   width: 140,
                //   decoration: BoxDecoration(
                //     borderRadius: const BorderRadius.all(Radius.circular(12)),
                //     color: ColorPalette().widgetbk,
                //   ),
                // ),
                // Container(
                //   height: 140,
                //   width: 140,
                //   decoration: BoxDecoration(
                //     borderRadius: const BorderRadius.all(Radius.circular(12)),
                //     color: ColorPalette().widgetbk,
                //   ),
                // ),
                // Container(
                //   height: 140,
                //   width: 140,
                //   decoration: BoxDecoration(
                //     borderRadius: const BorderRadius.all(Radius.circular(12)),
                //     color: ColorPalette().widgetbk,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
