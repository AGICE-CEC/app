import 'package:flutter/material.dart';
import 'preg_resp.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Preguntas Frecuentes'),
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Español'),
                  Tab(text: 'English'),
                ],
              ),
            ),
            body: TabBarView(children: [
/*******************************ESPAÑOL****************************************/
              ListView(
                children: [
                  /*ListTile(
            title: Text('¿Hay limite de edad para participar?'),
            subtitle: Text(
                'Pueden asistir tanto niños como adultos, los niños deben ser acompañados de un padre o tutor'),
          ),
          ListTile(
            title: Text('¿Puedo asistir aunque no sea de Centroamérica?'),
            subtitle: Text(
                'Claro que sí, es increible que nos podamos juntar a hacer networking'),
          ),
          ListTile(
            title: Text('¿Qué Incluye mi inscripción?'),
            subtitle: Text(
                'Conferencias, paneles, sesiones técnicas y coffee breaks'),
          ),
          ListTile(
            title: Text(
                '¿Cual es la tasa de cambio del dolar a la moneda nacional de Guatemala, el quetzal?'),
            subtitle: Text(
                '1 dólar equivale a 7.5 quetzales guatemaltecos, en raras ocasiones aumenta hasta casi 8 quetzales'),
          ),
          ListTile(
            title:
                Text('¿Es necesario que tenga el dominio del idioma inglés?'),
            subtitle: Text(
                'No, de cualquier manera  se colocan audífonos  con traductores en tiempo real, o bien podrías usar traductor. Pero recuerda es mejor si tienes facilidad en el idioma, amplía tus oportunidades.'),
          ),
          ListTile(
            title:
                Text('¿Si soy menor de edad me pueden acompañar mis padres?'),
            subtitle: Text(
                'Claro que si, es más pensando en ti se prepararon paquetes especales adjunto'),
          ),
          ListTile(
            title:
                Text('¿Puedo asistir sin ser miembro de ninguna organización?'),
            subtitle: Text(
                'Claro, lo importante es que te integres al mundo tecnológico y científico. Recuerda qe lo que nos une es el amor a las ciencias espaciales'),
          ),
          ListTile(
            title: Text('¿Como surgió la idea del CEC?'),
            subtitle: Text(
                'Fue en el congreso del IAC, donde varios centroamericanos centrados en las STEM dialogaron sobre replicar congresos de este tipo en América y apoyar talentos que se interesen por este espacio.'),
          ),*/
/*---------------------------------------------------------Container 1 empieza*/
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const ExpansionTile(
                      title: Text(quest1),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(ans1),
                        ),
                      ],
                    ),
                  ),
/*--------------------------------------------------------Container 1 termina*/
/*---------------------------------------------------------Container 2 empieza*/
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const ExpansionTile(
                      title: Text(quest2),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(ans2),
                        ),
                      ],
                    ),
                  ),
/*--------------------------------------------------------Container 2 termina*/
/*---------------------------------------------------------Container 3 empieza*/
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const ExpansionTile(
                      title: Text(quest3),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(ans3),
                        ),
                      ],
                    ),
                  ),
/*--------------------------------------------------------Container 3 termina*/
/*---------------------------------------------------------Container 4 empieza*/
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const ExpansionTile(
                      title: Text(quest4),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(ans4),
                        ),
                      ],
                    ),
                  ),
/*--------------------------------------------------------Container 4 termina*/
/*---------------------------------------------------------Container 5 empieza*/
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const ExpansionTile(
                      title: Text(quest5),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(ans5),
                        ),
                      ],
                    ),
                  ),
/*--------------------------------------------------------Container 5 termina*/
/*---------------------------------------------------------Container 6 empieza*/
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const ExpansionTile(
                      title: Text(quest6),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(ans6),
                        ),
                      ],
                    ),
                  ),
/*--------------------------------------------------------Container 6 termina*/
/*---------------------------------------------------------Container 7 empieza*/
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const ExpansionTile(
                      title: Text(quest7),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(ans7),
                        ),
                      ],
                    ),
                  ),
/*--------------------------------------------------------Container 7 termina*/
/*---------------------------------------------------------Container 8 empieza*/
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const ExpansionTile(
                      title: Text(quest8),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(ans8),
                        ),
                      ],
                    ),
                  ),
/*--------------------------------------------------------Container 8 termina*/
                ],
              ),
/*******************************INGLES****************************************/
              ListView(children: [
/*--------------------------------------------------------Container 1 Empieza*/
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const ExpansionTile(
                    title: Text(quest1_en),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(ans1_en),
                      ),
                    ],
                  ),
                ),
/*--------------------------------------------------------Container 1 Termina*/
/*--------------------------------------------------------Container 2 Empieza*/
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const ExpansionTile(
                    title: Text(quest2_en),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(ans2_en),
                      ),
                    ],
                  ),
                ),
/*--------------------------------------------------------Container 2 Termina*/
/*--------------------------------------------------------Container 3 Empieza*/
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const ExpansionTile(
                    title: Text(quest3_en),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(ans3_en),
                      ),
                    ],
                  ),
                ),
/*--------------------------------------------------------Container 3 Termina*/
/*--------------------------------------------------------Container 4 Empieza*/
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const ExpansionTile(
                    title: Text(quest4_en),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(ans4_en),
                      ),
                    ],
                  ),
                ),
/*--------------------------------------------------------Container 4 Termina*/
/*--------------------------------------------------------Container 5 Empieza*/
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const ExpansionTile(
                    title: Text(quest5_en),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(ans5_en),
                      ),
                    ],
                  ),
                ),
/*--------------------------------------------------------Container 5 Termina*/
/*--------------------------------------------------------Container 6 Empieza*/
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const ExpansionTile(
                    title: Text(quest6_en),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(ans6_en),
                      ),
                    ],
                  ),
                ),
/*--------------------------------------------------------Container 6 Termina*/
/*--------------------------------------------------------Container 7 Empieza*/
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const ExpansionTile(
                    title: Text(quest7_en),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(ans7_en),
                      ),
                    ],
                  ),
                ),
/*--------------------------------------------------------Container 7 Termina*/
/*--------------------------------------------------------Container 8 Empieza*/
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const ExpansionTile(
                    title: Text(quest8_en),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(ans8_en),
                      ),
                    ],
                  ),
                ),
/*--------------------------------------------------------Container 8 Termina*/
              ])
            ])));
  }
}
