import 'package:flutter/material.dart';
import 'package:igest/src/theme/color.dart';

class Prodval extends StatefulWidget {
  const Prodval({super.key});

  @override
  State<Prodval> createState() => _ProdvalState();
}

class _ProdvalState extends State<Prodval> {
  List prodelem = [];
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
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1),
                itemCount: prodelem.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: ColorPalette().widgetBg,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    child: const InkWell(
                      child: Column(
                        children: [
                          Placeholder(
                            color: Colors.purpleAccent,
                            fallbackHeight: 100,
                            fallbackWidth: 100,
                          ),
                          Text(""),
                          Text(""),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: ColorPalette().widgetBw,
            ),
          ),
        ],
      ),
    );
  }
}
