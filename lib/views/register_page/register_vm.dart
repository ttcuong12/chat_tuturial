import 'package:chat_tutorial/dialog_widget/app_dialog.dart';
import 'package:chat_tutorial/views/chat_page/chat_page.dart';
import 'package:chat_tutorial/views/models/load_status.dart';
import 'package:chat_tutorial/views/models/message_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RegisterVm extends GetxController {
  List<MessageEntity> listMess = [];
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  LoadStatus loadStatus = LoadStatus.initial;

  void registerAccount({
    required String email,
    required String username,
    required String pass,
  }) async {
    loadStatus = LoadStatus.loading;
    update();
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      FirebaseFirestore.instance.collection('users').doc(userCredential?.user?.uid).set({
        'username': username,
        'email': email,
      });
      loadStatus = LoadStatus.success;
      Get.offAll(() => ChatPage(title: userCredential?.user?.email ?? ''));
      update();
    } catch (e) {
      print(e);
      loadStatus = LoadStatus.failure;
      AppDialog.messages(message: e.toString());
      update();
    }
  }
}
