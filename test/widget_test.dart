import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igest/src/pages/home_screen.dart'; // Assurez-vous que le chemin est correct

void main() {
  testWidgets('Vérifie si HomePage est affichée', (WidgetTester tester) async {
    // On lance l'application dans le test
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // On vérifie si un widget Text contenant 'Bienvenue sur la page d\'accueil!' est trouvé
    expect(find.text('Hello'), findsOneWidget);
  });
}
