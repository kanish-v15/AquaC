import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'about.dart';

class write_comp extends StatefulWidget {
  const write_comp({super.key});

  @override
  State<write_comp> createState() => _write_compState();
}

class _write_compState extends State<write_comp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff26648E),
          title: Text('Complaint',),
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
                padding: const EdgeInsets.only(top: 40,left: 120),
                child: Row(
                  children: [
                    Icon(Icons.location_on,size: 30,color: Colors.red,),
                    Text("Location:",style: TextStyle(
                      color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500
                    ),),
                    
                  ],
                ),
              ),
              
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SizedBox(
              height: 200,
              width: 380,
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    maxLines: 8, //or null 
                    decoration: InputDecoration.collapsed(hintText: "Enter your address..."),
                  ),
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Submit",
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
        ],

           
          ),
      ),
    ),);
  }
}