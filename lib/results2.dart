import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'about.dart';

class results2 extends StatefulWidget {
  const results2({super.key});

  @override
  State<results2> createState() => _results2State();
}

class _results2State extends State<results2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
        backgroundColor: Color(0xff26648E),
        actions: <Widget>[
          PopupMenuButton<String>(
            color: Color(0xff26648E),
            onSelected: (value) {
              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const about()),
                      );
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'option1',
                child: Text('About Us',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset("assets/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Catch the conataminants!",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text("Note:",
                  style: TextStyle(
                    color: Color(0xffFFE3B3),
                    fontSize: 35,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container( 
                height: 400,
                width: 360,
                decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueGrey.withOpacity(0.2),
                          ),
                          child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Text("pH: acidity or alkalinity of a solution",style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 15),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 90),
                              child: Text("Trash:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("You can check the water trash results in the",style: TextStyle(color: Colors.white,fontSize: 15),),
                                  Text("Citizen tab.",style: TextStyle(color: Colors.white,fontSize: 15),),
                                ],
                              ),
                            ),
                            
                          ],
                          
                         ), 
                          
                        ),
                      ),
                    ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}