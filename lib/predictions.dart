import 'dart:ui';
import 'package:aqua_c/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'about.dart';

class predictions extends StatefulWidget {
  final List data;
  const predictions({super.key,required this.data});

  @override
  State<predictions> createState() => _predictionsState();
}

class _predictionsState extends State<predictions> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
      appBar: AppBar(
        title: Text("Predictions"),
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
              child: Text("Our Predictions:",
                  style: TextStyle(
                    color: Color(0xffFFE3B3),
                    fontSize: 35,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                height: 300,
                width: 300,
                color: Colors.transparent,
                child: ListView.builder(
                  itemCount: widget.data.length,
                 itemBuilder: (context, index) {return 
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            widget.data[0][0],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 125),
                          child: Text(
                            "${widget.data[0][1].toStringAsFixed(4)}%",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    );}),
                    
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 90),
                    //   child: Text(
                    //     "Moderately polluted!",
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // )
                  
                
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: 45,
                width: 150,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const results()),
                      );
                    },
                    child: Text(
                      "Results",
                      style: TextStyle(
                        color: Color(0xff26648E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xffFFE3B3)),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
