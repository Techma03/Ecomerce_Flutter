import 'package:flutter/material.dart';
import 'package:igest/src/theme/color.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class userPage extends StatefulWidget {
  const userPage({super.key});

  @override
  State<userPage> createState() => _userPageState();
}

List user = [];

class _userPageState extends State<userPage> {
  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    final url = Uri.parse("http://127.0.0.1/bigshop/apiUser.php?idUser");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        user = jsonDecode(response.body);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Erreur lors de la récupération des utilisateurs')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: user.isEmpty
          ? const Center(child: CircularProgressIndicator()) // Affichage d'un indicateur de chargement
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 1,
                mainAxisSpacing: 2,
                childAspectRatio: 6,
              ),
              itemCount: user.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color.fromARGB(255, 188, 208, 243),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 5),
                              child: Text(
                                "${index + 1}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 13, top: 7),
                                  child: Text(
                                    "${user[index]['nom']}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    "${user[index]['email']}", // Correction de la clé JSON
                                    style: const TextStyle(),
                                  ),
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
