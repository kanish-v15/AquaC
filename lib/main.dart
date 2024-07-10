import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:aqua_c/about.dart';
import 'package:aqua_c/home.dart';
import 'package:aqua_c/login.dart';
import 'package:aqua_c/predictions.dart';
import 'package:aqua_c/results.dart';
import 'package:async/async.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';





Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  var  res = null;
  


//   File? image;
//   Future pickImage() async {
//   try {
//   final image=await ImagePicker().pickImage(source: ImageSource.camera);
//   if (image==null) return;
  
//   final imageTemp=File(image.path);
//   setState((() =>  this.image=imageTemp));
// } on PlatformException catch (e) {
//   print("Failed to pick image: $e");
// }
  
// }

// Future upload() async{
  

//   var stream = http.ByteStream(DelegatingStream.typed(image!.openRead()));
//     // get file length
//     var length = await image!.length();

//     // string to uri
//     var uri = Uri.parse("enter here upload URL");

//     // create multipart request
//     var request = http.MultipartRequest("POST", Uri.parse("http://192.168.168.208:8000/model"));

//     // if you need more parameters to parse, add those like this. i added "user_id". here this "user_id" is a key of the API request
//     request.fields["user_id"] = "text";

//     // multipart that takes file.. here this "image_file" is a key of the API request
//     var multipartFile = http.MultipartFile('image_file', stream, length, filename: Path.basename(image!.path));

//     // add file to multipart
//     request.files.add(multipartFile);

//     // send request to upload image
//     await request.send().then((response) async {
//       // listen for response
//       response.stream.transform(utf8.decoder).listen((value) {
//         print(value);
//       });

//     }).catchError((e) {
//       print(e);
//     });
//   return 0;


// }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.only(top: 140),
              child: Image.asset(
                    "assets/logo.png",
                  ),
            ),
            GlowText("Catch the contaminants!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 10),),
            Image.asset(
                  "assets/waterflow1.gif",height: 300,
                ),
            Padding(
              padding: const EdgeInsets.only(top:30),
              child: Text("What's your role ? :", style: TextStyle(color: Colors.white,fontSize: 13),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                height:60,
                width: 240,
                child: GlowButton(
                          onPressed: (){

                         Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const home()),
                      );
                          },
                          child: Text(
                            "Citizen !",
                            style: TextStyle(
                              color: Color(0xff26648E),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Color(0xffFFE3B3),
                          // style: ElevatedButton.styleFrom(
                          //     backgroundColor: Color(0xffFFE3B3),
                          //     shadowColor: Colors.black), 
                        ),
              ),
            ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                        height: 60,width: 240,
                        child: GlowButton(
                          onPressed: (){
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const login()),
                      );
                          },
                          
                          child: Text(
                            "Official !",
                            style: TextStyle(
                              color: Color(0xff26648E),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // style: ElevatedButton.styleFrom(
                          //     backgroundColor: Color(0xffFFE3B3),
                          //     shadowColor: Colors.black),
                          color: Color(0xffFFE3B3),
                        ),
                      ),
                    ),
          ],
        ),
      ),
      );
  }
}


