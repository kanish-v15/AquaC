import 'package:flutter/material.dart';



class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Color(0xff26648E),
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
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'AquaC',
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color(0xffFFE3B3)),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Catch the contaminants!',
                      style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Text(
                        'This app was created by team "AquaC" which consists of the members:\n1. Vijayasaran V\n2. Naveen Kumar\n3. Kanish\n4. Surya',
                        style: TextStyle(fontSize: 20,color: Colors.white),
                        
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text("Our app and device assist in two ways: \nFirstly , as a predictor that evaluates the given input image and analyze its level of quality.\nIt suggests various treatment process for removing the contaminants and to continue the further processes.", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text("We hope this app will be effient enough and creates an positive impact in our society.\n", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text("Regards,\nteam AquaC", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
    
  }
