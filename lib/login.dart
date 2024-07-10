import 'package:aqua_c/drone.dart';
import 'package:aqua_c/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'about.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  get controller => null;
  

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Official"),
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
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Image.asset(
                    "assets/logo.png", height: 40,
                  ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Color(0xffFFE3B3),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Color(0xffFFE3B3))),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Username",
                            labelStyle: TextStyle(
                                color: myFocusNode.hasFocus
                                    ? Color(0xffFFE3B3)
                                    : Color(0xffFFE3B3)),
                          ),
                          controller: controller,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Color(0xffFFE3B3))),
                        child: TextField(
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color: myFocusNode.hasFocus
                                    ? Color(0xffFFE3B3)
                                    : Color(0xffFFE3B3)),
                          ),
                          controller: controller,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                              onPressed: (){
                                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => menu()),);
                              },
                              child: Text(
                                "login",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
