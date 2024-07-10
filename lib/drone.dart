import 'package:aqua_c/predictions.dart';
import 'package:aqua_c/predictions2.dart';
import 'package:aqua_c/results2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'about.dart';

class drone extends StatefulWidget {
  const drone({super.key});

  @override
  State<drone> createState() => _droneState();
}

class _droneState extends State<drone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
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
                Image.asset("assets/drone1.gif", height: 350,),
                // Text("Real-Time data", style: TextStyle(color:Color(0xffFFE3B3), fontSize: 40,fontWeight: FontWeight.w400),),
                GlowText(
              'Real-Time data',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
              
                Padding(
                  padding: const EdgeInsets.only(top: 40,left: 50),
                  
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 50),
                  child: Row(
                    children: [
                      Text("Turbidity:",style: TextStyle(color: Colors.red, fontSize: 25,fontWeight: FontWeight.w600),),
                      Text(" 55.7",style: TextStyle(color: Colors.white, fontSize: 30),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => results2()),);
                                  },
                                  child: Text(
                                    "Note",
                                    style: TextStyle(
                                      color: Color(0xff26648E),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xffFFE3B3),
                                      shadowColor: Colors.black), 
                                ),
                  ),
                ),
              ],
          ),    
    ),);
  }
}