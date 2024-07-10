import 'dart:developer';
import 'dart:ui';
import 'package:aqua_c/write_comp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'about.dart';
import 'package:toggle_switch/toggle_switch.dart';

class results extends StatefulWidget {
  const results({super.key});

  @override
  State<results> createState() => _resultsState();
}

enum SingingCharacter { lafayette, jefferson }

class _resultsState extends State<results> {
  bool buttonEnabled = false;
  SingingCharacter? _character = SingingCharacter.lafayette;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              padding: const EdgeInsets.only(top: 50),
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
              padding: const EdgeInsets.only(top: 35),
              child: Text("Results:",
                  style: TextStyle(
                    color: Color(0xffFFE3B3),
                    fontSize: 35,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container( 
                height: 350,
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
                              child: Text("These contaminants can be removed!",style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 15),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Text("Methods:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("1.Manual picking of the trash.",style: TextStyle(color: Colors.white,fontSize: 15),),
                                  Text("2.Skimming devices or Nets.",style: TextStyle(color: Colors.white,fontSize: 15),),
                                  Text("3.Barrier systems or Boom.",style: TextStyle(color: Colors.white,fontSize: 15),),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30,top: 50),
                                  child: Text("Note:",style: TextStyle(color: Color.fromARGB(255, 188, 17, 5),fontWeight: FontWeight.bold,fontSize: 15),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 50),
                                  child: Text("Kindly visit you respective VAO",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                ),
                                
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text("for further treatment process.",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                            ),
                          ],
                          
                         ), 
                          
                        ),
                      ),
                    ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 35),
                  child: Text("Raise a Complaint?", 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),),
                ),
        Padding(
          padding: const EdgeInsets.only(top:10,left: 70),
          child: ToggleSwitch(
  minWidth: 70.0,
  initialLabelIndex: 1,
  cornerRadius: 17.0,
  activeFgColor: Color(0xff26648E),
  inactiveBgColor: Colors.grey,
  inactiveFgColor: Colors.white,
  totalSwitches: 2,
  labels: ['Yes', 'No'],
  icons: [Icons.check,Icons.close],
  activeBgColors: [[Color(0xffFFE3B3)],[Color(0xffFFE3B3)]],
  onToggle: (index) {
    print('switched to: $index');
    // setState(() {
    // buttonEnabled = index == 1? true: false;
      
    // });

  },
),
        ),
        //         ListTile(
        //   title: const Text('Yes'),
        //   leading: Radio<SingingCharacter>(
        //     value: SingingCharacter.lafayette,
        //     groupValue: _character,
        //     onChanged: (SingingCharacter? value) {
        //       setState(() {
        //         _character = value;
        //       });
        //     },
        //   ),
        // ),
                
              //   Padding(
              //     padding: const EdgeInsets.only(top: 10,left: 45),
              //     child: SizedBox(
              //     height: 40,
              //     width: 100,
              //     child: ElevatedButton(
              //         onPressed: () {},
              //         child: Text(
              //           "Yes!",
              //           style: TextStyle(
              //             color: Color(0xff26648E),
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         style: ButtonStyle(
              //           backgroundColor:
              //               MaterialStateProperty.all<Color>(Color(0xffFFE3B3)),
              //         )),
              // ),
              //   ),
              ],
            ),
              Padding(
                  padding: const EdgeInsets.only(top: 40,),
                  child: SizedBox(
                  height: 45,
                  width: 130,
                  child: ElevatedButton(
                      onPressed: () {
                        // if(buttonEnabled){
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const write_comp()),
                      );
                        // }else{
                        //   null;
                        // }
                      },
                      child: Text(
                        "Complaint!",
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
                ),
          ],
        ),
      ),
    ),);
  }
}