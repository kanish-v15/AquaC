import 'package:aqua_c/utils/firebase_db.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:aqua_c/main.dart';
import 'package:aqua_c/about.dart';
import 'package:aqua_c/predictions.dart';
import 'package:async/async.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as Path;

class home extends StatefulWidget {
  const home({super.key, required});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var res = null;

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemp = image.path;
      return await uploadVideo(imageTemp);

      // setState((() =>  this.image=imageTemp));
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Future pickImage1() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = image.path;
      // setState((() =>  this.image=imageTemp));
      return await uploadVideo(imageTemp);
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Future uploadVideo(filename) async {
    var request =
        http.MultipartRequest('POST', Uri.parse("http://192.168.0.153:5000"));
    request.files.add(await http.MultipartFile.fromPath('file', filename));
    http.StreamedResponse res = await request.send();
    http.Response result = await http.Response.fromStream(res);
    return jsonDecode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff26648E),
          title: Text('AquaC'),
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
                padding: const EdgeInsets.only(top: 100),
                child: Image.asset(
                  "assets/logo.png",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: res != null
                    ? Text(res.toString())
                    : GlowText(
                        "Catch the contaminants!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: InkWell(
                  onTap: ((() => pickImage())),
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: image != null
                        ? Image.file(
                            image!,
                            height: 30,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Icon(Icons.camera_enhance_rounded,
                                      size: 70, color: Colors.black26),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton.icon(
                    onPressed: (() async {
                      List data = await pickImage1();

                      await FirebaseStuffs().pushComplaint(stuffs: data);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => predictions(data: data)));
                    }),
                    icon: Icon(
                      Icons.upload,
                      color: Color(0xff26648E),
                    ),
                    label: Text(
                      'Upload!',
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
              // Padding(
              //   padding: const EdgeInsets.only(top: 25),
              //   child: SizedBox(
              //     height: 40,
              //     width: 180,
              //     child: ElevatedButton.icon(
              //       onPressed: () {

              //       },
              //       icon: Icon(
              //         Icons.check,
              //         color: Color(0xff26648E),
              //       ),
              //       label: Text(
              //         'Check',
              //         style: TextStyle(
              //           color: Color(0xff26648E),
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       style: ElevatedButton.styleFrom(
              //           backgroundColor: Color(0xffFFE3B3),
              //           shadowColor: Colors.black),
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
