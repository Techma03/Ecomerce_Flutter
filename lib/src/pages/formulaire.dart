import 'package:flutter/material.dart';
import 'package:igest/src/theme/color.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 300,
        width: 20,
        color: Colors.amber,
      ),
      actions: [TextButton(onPressed: () {}, child: Text("Valier la demande"))],
    );
  }
}
