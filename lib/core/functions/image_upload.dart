import 'dart:io';

import 'package:chat_test/constants/constants.dart';
import 'package:chat_test/core/functions/base_finctions.dart';
import 'package:chat_test/core/local_source/local_source.dart';
import 'package:chat_test/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload {
  static Future<void> uploadImage(XFile? img, String conversationId) async {
    var storage = FirebaseStorage.instance;
    String imageName = img?.name ?? "";
    String path = 'uploads/conversations/$conversationId';

    TaskSnapshot taskSnapshot =
        await storage.ref('$path/$imageName').putFile(File(img?.path ?? ""));
    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection(FireBaseCollection.conversationBaseCollection)
          .doc("conversation_$conversationId")
          .collection(conversationId)
          .add({
        "massage": downloadUrl,
        "massage_sender": sl<LocalSource>().getUserEmail(),
        "massage_id": Functions.generateUniqueId(),
        "massage_data": DateTime.now().toString(),
      });
  }
}
