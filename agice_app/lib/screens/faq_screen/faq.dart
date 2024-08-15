//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//                  FaQ para App del CEC Guatemala                           //
//                              @MixqMo                                      //
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
                child: TabBarView(children: [
/*******************************ESPAÑOL****************************************/
                  ListView(
                    children: [
/*---------------------------------------------------------Container 1 empieza*/
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                          color: const Color(0xFF848484),
                        ),
                        child: const ExpansionTile(
                          title: Text(
                            quest1,
                            style: TextStyle(color: Colors.white),
                          ),
                          iconColor: Colors.white70,
                          collapsedIconColor: Colors.white,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                ans1,
                                style: TextStyle(color: Colors.white),
                              ),
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
                          color: const Color(0xFF848484),
                        ),
                        child: const ExpansionTile(
                          title: Text(
                            quest2,
                            style: TextStyle(color: Colors.white),
                          ),
                          iconColor: Colors.white70,
                          collapsedIconColor: Colors.white,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                ans2,
                                style: TextStyle(color: Colors.white),
                              ),
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
                          color: const Color(0xFF848484),
                        ),
                        child: const ExpansionTile(
                          title: Text(
                            quest3,
                            style: TextStyle(color: Colors.white),
                          ),
                          iconColor: Colors.white70,
                          collapsedIconColor: Colors.white,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                ans3,
                                style: TextStyle(color: Colors.white),
                              ),
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
                          color: const Color(0xFF848484),
                        ),
                        child: const ExpansionTile(
                          title: Text(
                            quest4,
                            style: TextStyle(color: Colors.white),
                          ),
                          iconColor: Colors.white70,
                          collapsedIconColor: Colors.white,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                ans4,
                                style: TextStyle(color: Colors.white),
                              ),
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
                          color: const Color(0xFF848484),
                        ),
                        child: const ExpansionTile(
                          title: Text(
                            quest5,
                            style: TextStyle(color: Colors.white),
                          ),
                          iconColor: Colors.white70,
                          collapsedIconColor: Colors.white,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                ans5,
                                style: TextStyle(color: Colors.white),
                              ),
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
                          color: const Color(0xFF848484),
                        ),
                        child: const ExpansionTile(
                          title: Text(
                            quest6,
                            style: TextStyle(color: Colors.white),
                          ),
                          iconColor: Colors.white70,
                          collapsedIconColor: Colors.white,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                ans6,
                                style: TextStyle(color: Colors.white),
                              ),
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
                          color: const Color(0xFF848484),
                        ),
                        child: const ExpansionTile(
                          title: Text(
                            quest7,
                            style: TextStyle(color: Colors.white),
                          ),
                          iconColor: Colors.white70,
                          collapsedIconColor: Colors.white,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                ans7,
                                style: TextStyle(color: Colors.white),
                              ),
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
                          color: const Color(0xFF848484),
                        ),
                        child: const ExpansionTile(
                          title: Text(
                            quest8,
                            style: TextStyle(color: Colors.white),
                          ),
                          iconColor: Colors.white70,
                          collapsedIconColor: Colors.white,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                ans8,
                                style: TextStyle(color: Colors.white),
                              ),
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
                        color: const Color(0xFF848484),
                      ),
                      child: const ExpansionTile(
                        title: Text(
                          quest1_en,
                          style: TextStyle(color: Colors.white),
                        ),
                        iconColor: Colors.white70,
                        collapsedIconColor: Colors.white,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              ans1_en,
                              style: TextStyle(color: Colors.white),
                            ),
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
                        color: const Color(0xFF848484),
                      ),
                      child: const ExpansionTile(
                        title: Text(
                          quest2_en,
                          style: TextStyle(color: Colors.white),
                        ),
                        iconColor: Colors.white70,
                        collapsedIconColor: Colors.white,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              ans2_en,
                              style: TextStyle(color: Colors.white),
                            ),
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
                        color: const Color(0xFF848484),
                      ),
                      child: const ExpansionTile(
                        title: Text(
                          quest3_en,
                          style: TextStyle(color: Colors.white),
                        ),
                        iconColor: Colors.white70,
                        collapsedIconColor: Colors.white,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              ans3_en,
                              style: TextStyle(color: Colors.white),
                            ),
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
                        color: const Color(0xFF848484),
                      ),
                      child: const ExpansionTile(
                        title: Text(
                          quest4_en,
                          style: TextStyle(color: Colors.white),
                        ),
                        iconColor: Colors.white70,
                        collapsedIconColor: Colors.white,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              ans4_en,
                              style: TextStyle(color: Colors.white),
                            ),
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
                        color: const Color(0xFF848484),
                      ),
                      child: const ExpansionTile(
                        title: Text(
                          quest5_en,
                          style: TextStyle(color: Colors.white),
                        ),
                        iconColor: Colors.white70,
                        collapsedIconColor: Colors.white,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              ans5_en,
                              style: TextStyle(color: Colors.white),
                            ),
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
                        color: const Color(0xFF848484),
                      ),
                      child: const ExpansionTile(
                        title: Text(
                          quest6_en,
                          style: TextStyle(color: Colors.white),
                        ),
                        iconColor: Colors.white70,
                        collapsedIconColor: Colors.white,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              ans6_en,
                              style: TextStyle(color: Colors.white),
                            ),
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
                        color: const Color(0xFF848484),
                      ),
                      child: const ExpansionTile(
                        title: Text(
                          quest7_en,
                          style: TextStyle(color: Colors.white),
                        ),
                        iconColor: Colors.white70,
                        collapsedIconColor: Colors.white,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              ans7_en,
                              style: TextStyle(color: Colors.white),
                            ),
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
                        color: const Color(0xFF848484),
                      ),
                      child: const ExpansionTile(
                        title: Text(
                          quest8_en,
                          style: TextStyle(color: Colors.white),
                        ),
                        iconColor: Colors.white70,
                        collapsedIconColor: Colors.white,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              ans8_en,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
/*--------------------------------------------------------Container 8 Termina*/
                  ])
                ]))));
  }
}
