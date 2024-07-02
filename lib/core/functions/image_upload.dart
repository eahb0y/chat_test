import 'dart:io';

import 'package:chat_test/constants/constants.dart';
import 'package:chat_test/core/functions/base_finctions.dart';
import 'package:chat_test/core/local_source/local_source.dart';
import 'package:chat_test/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

class ImageUpload {
  static Future<void> uploadImage(
      List<String> images, String conversationId) async {
    var storage = FirebaseStorage.instance;
    for (var img in images) {
      String imageName =
          img.substring(img.lastIndexOf("/") + 1, img.lastIndexOf("."));

      String path = img.substring(img.indexOf("/") + 1, img.lastIndexOf("/"));

      final Directory systemTempDir = Directory.systemTemp;
      final byteData = await rootBundle.load(img);
      final file = File('${systemTempDir.path}/$imageName.jpg');

      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      TaskSnapshot taskSnapshot =
          await storage.ref('$path/$imageName').putFile(file);
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection(FireBaseCollection.conversationBaseCollection)
          .doc("conversation_$conversationId")
          .collection(conversationId)
          .add({
        "massage": downloadUrl,
        "massage_sender": sl<LocalSource>().getUserEmail(),
        "massage_id": Functions.generateUniqueId(),
        "massage_data": DateTime.now(),
      });
    }
  }
}
