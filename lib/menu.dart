import 'package:aqua_c/complaints.dart';
import 'package:aqua_c/drone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'about.dart';

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff26648E),
          title: Text('Dashboard'),
          actions: <Widget>[
            PopupMenuButton<String>(
              color: Color(0xff26648E),
              onSelected: (value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const about()),
                );
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Text(
                    'About Us',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff26648E),
                Colors.black,
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Image.asset("assets/logo.png"),
              ),
              GlowText(
                "Catch the contaminants!",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 200,left: 75),
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // Button color
                            child: InkWell(
                              splashColor: Colors.red, // Splash color
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const complaints()),
                                );
                              },
                              child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Icon(Icons.assignment_ind_rounded, size: 70,)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 75),
                        child: Text(
                          "Complaints",
                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 200,left: 40),
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // Button color

                            child: InkWell(
                              splashColor: Colors.red, // Splash color

                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const drone()),
                                );
                              },

                              child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: SizedBox(
                                    child: Image.asset("assets/drone.gif",))),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10, left: 40),
                        child: Text(
                          "Drone",
                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
