import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'about.dart';

class complaints extends StatefulWidget {
  const complaints({super.key});

  @override
  State<complaints> createState() => _complaintsState();
}

class _complaintsState extends State<complaints> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Complaints")),
        body: !isLoading
            ?
            // RefreshIndicator(
            //     key: refreshKey,
            //     color: Colors.white,
            //     backgroundColor: Colors.red[400],
            //     onRefresh: () async {
            //       // return initializeFTP();
            //     },
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("waste")
                    // .limit(12)

                    // .orderBy("time", descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  //filter snapshots
                  snapshot = snapshot;

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                        child: Text("No data",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w600)));
                  }
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data?.docs.length,
                      // padding: EdgeInsets.only(bottom: screenHeight / 8),

                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                              jsonDecode(snapshot.data?.docs[index]["data"])[0]
                                  [0]),
                          subtitle: Text(
                            (jsonDecode(snapshot.data?.docs[index]["data"])[0]
                                        [1] *
                                    100)
                                .toStringAsFixed(4)
                                .toString(),
                          ),
                        );
                      });
                })
            : const Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    // backgroundColor: kMaterialBlack,
                    color: Colors.black,
                  ),
                ),
              )
        // return ClipRRect(
        //   borderRadius: BorderRadius.circular(5),
        //   child: Stack(
        //     children: [
        //       SizedBox(
        //         height: 150,
        //         width: 150,
        //         child: Image.network(
        //           snapshot.data?.docs[index]["uploaderImage"] ??
        //               "",
        //           fit: BoxFit.cover,
        //           width: double.infinity,
        //           height: double.infinity,
        //         ),
        //       ),
        //     ],
        //   ),
        // );
        // return InkWell(
        //   borderRadius: BorderRadius.circular(8),
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (_) => FileDownload(
        //                   fileDetails: snapshot.data!.docs[index],
        //                 )));
        //   },
        // child: Padding(
        // padding: const EdgeInsets.only(
        //     left: 8.0, right: 8.0, top: 0, bottom: 20),
        // child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Expanded(
        //         child: Center(
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 8.0),
        //             child: Hero(
        //               tag: snapshot.data!.docs[index]
        //                   ["docReference"],
        //               child: AspectRatio(
        //                 aspectRatio: 1,
        //                 // child: Container(
        //                 //   decoration: BoxDecoration(
        //                 //       color: Colors.white,
        //                 //       boxShadow: const [
        //                 //         BoxShadow(
        //                 //             color: Colors.black26,
        //                 //             offset: Offset(0, 2),
        //                 //             blurRadius: 6),
        //                 //       ],
        //                 //       borderRadius:
        //                 //           BorderRadius.circular(12)),
        //                 // ),
        //                 child: Stack(children: <Widget>[
        //                   //shadow
        //                   Transform.translate(
        //                     offset: const Offset(0, 2),
        //                     child: ImageFiltered(
        //                       imageFilter: ImageFilter.blur(
        //                           sigmaY: 4, sigmaX: 4),
        //                       child: Container(
        //                         decoration: BoxDecoration(
        //                           border: Border.all(
        //                             color: Colors.transparent,
        //                             width: 0,
        //                           ),
        //                         ),
        //                         child: ColorFiltered(
        //                           colorFilter:
        //                               ColorFilter.mode(
        //                                   Colors.black
        //                                       .withOpacity(
        //                                           0.18),
        //                                   BlendMode.srcATop),
        //                           child: SvgPicture.asset(
        //                             "assets/files/file.svg",
        //                             fit: BoxFit.contain,
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),

        //                   // svg
        //                   SvgPicture.asset(
        //                     "assets/files/file.svg",
        //                     fit: BoxFit.contain,
        //                   ),
        //                 ]),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //   ),
        // ),
        // ),/
        // ),
        // Padding(
        //   padding: EdgeInsets.only(
        //       left: screenWidth / 45 + 8),
        //   child: Column(
        //     crossAxisAlignment:
        //         CrossAxisAlignment.start,
        //     children: [
        //       Padding(
        //         padding:
        //             const EdgeInsets.only(bottom: 10.0),
        //         child: Text(
        //           snapshot.data?.docs[index]
        //               ["filename"],
        //           style: const TextStyle(
        //               fontWeight: FontWeight.w600,
        //               fontSize: 19),
        //           overflow: TextOverflow.ellipsis,
        //         ),
        //       ),
        //       Row(
        //         children: [
        //           Container(
        //             width: 22,
        //             height: 22,
        //             decoration: BoxDecoration(
        //               shape: BoxShape.circle,
        //               boxShadow: const [
        //                 BoxShadow(
        //                     color: Colors.black26,
        //                     blurRadius: 2,
        //                     offset: Offset(0, 2))
        //               ],
        //               image: DecorationImage(
        //                 image: NetworkImage(
        //                   snapshot.data?.docs[index]
        //                       ["uploaderImage"],
        //                 ),
        //               ),
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.only(
        //                 left: 10.0),
        //             child: Text(
        //               snapshot.data?.docs[index]
        //                   ["uploader"],
        //               overflow: TextOverflow.ellipsis,
        //               style: const TextStyle(
        //                   fontWeight: FontWeight.w500,
        //                   fontSize: 13),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        //       ]),
        // ),

        );
  }
}
