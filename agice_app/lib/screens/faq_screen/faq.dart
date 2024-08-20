//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//                  FaQ para App del CEC Guatemala                           //
//                              @MixqMo                                      //
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  Future<List<dynamic>>? faqs;

  @override
  void initState() {
    super.initState();
    faqs = fetchFaqs();
  }

  Future<List<dynamic>> fetchFaqs() async {
    try {
      const String url = "https://server-production-2c4b.up.railway.app/faqs";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print("Datos recibidos: ${response.body}");
        return jsonDecode(response.body);
      } else {
        print("Error al cargar FAQs: ${response.statusCode}");
        throw Exception('Failed to load FAQs');
      }
    } catch (e) {
      print("Excepción al cargar FAQs: $e");
      throw Exception('Failed to load FAQs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Preguntas Frecuentes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              )
            ],
          ),
          backgroundColor: const Color(0xFF1a1a1a),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Español'),
              Tab(text: 'English'),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF232323),
                Color(0xFF4a4a4a),
              ],
            ),
          ),
          child: FutureBuilder<List<dynamic>>(
            future: faqs,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print("Cargando datos...");
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print("Error en snapshot: ${snapshot.error}");
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                print("Datos cargados correctamente.");
                return TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        final faq = snapshot.data?[index];
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                            color: const Color(0xFF848484),
                          ),
                          child: ExpansionTile(
                            title: Text(
                              faq['question'], // Utiliza la clave 'question'
                              style: const TextStyle(color: Colors.white),
                            ),
                            iconColor: Colors.white70,
                            collapsedIconColor: Colors.white,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  faq['answer'], // Utiliza la clave 'answer'
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const Center(
                        child: Text('English FAQs not implemented yet')),
                  ],
                );
              } else {
                print("No FAQs found.");
                return const Center(child: Text('No FAQs found'));
              }
            },
          ),
        ),
      ),
    );
  }
}
