import 'dart:io';

import 'package:chat_test/constants/constants.dart';
import 'package:chat_test/core/local_source/local_source.dart';
import 'package:chat_test/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload {
  static Future<void> uploadImage({
    required XFile? img,
    required String conversationId,
    required String genId,
  }) async {
    var storage = FirebaseStorage.instance;
    String imageName = img?.name ?? "";
    String path = 'uploads/conversations/$conversationId';

    TaskSnapshot taskSnapshot =
        await storage.ref('$path/$imageName').putFile(File(img?.path ?? ""));

    await FirebaseFirestore.instance
        .collection(FireBaseCollection.conversationBaseCollection)
        .doc("conversation_$conversationId")
        .collection(conversationId)
        .doc(genId)
        .set({
      "massage": "https://firebasestorage",
      "massage_sender": sl<LocalSource>().getUserEmail(),
      "massage_id": genId,
      "massage_data": DateTime.now().toString()
    });

    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection(FireBaseCollection.conversationBaseCollection)
          .doc("conversation_$conversationId")
        .collection(conversationId)
        .doc(genId)
        .update({
      "massage": downloadUrl,
      "massage_sender": sl<LocalSource>().getUserEmail(),
      "massage_id": genId,
      "massage_data": DateTime.now().toString(),
      });
  }
}
