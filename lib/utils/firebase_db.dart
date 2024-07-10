import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

/// This class consists of all the functions that has to do with firebase
class FirebaseStuffs {
  Future<void> uploadFile(
      {required String docReference,
      required String filename,
      required String uploader,
      required String uploaderImage,
      required String fileSize,
      required int time}) async {
    await FirebaseFirestore.instance
        .collection("files")
        .doc(docReference)
        .update({
      "filename": filename,
      "size": fileSize,
      "uploader": uploader,
      "uploaderImage": uploaderImage,
      "docReference": docReference,
      "time": time,
      "history": []
    });
  }

  Future<void> pushComplaint({required List stuffs}) async {
    String doc = await FirebaseFirestore.instance.collection("waste").doc().id;
    print(doc);
    await FirebaseFirestore.instance
        .collection("waste")
        .doc(doc)
        .set({"data": jsonEncode(stuffs)});
  }

  Future<String> generateDocID() async {
    DocumentReference docRef =
        (await FirebaseFirestore.instance.collection("files").add({}));
    return docRef.id;
  }

  Future<void> updateHistory(String docReference, List history) async {
    await FirebaseFirestore.instance
        .collection("files")
        .doc(docReference)
        .update({"history": history});
  }
}
