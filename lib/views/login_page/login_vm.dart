import 'package:chat_tutorial/dialog_widget/app_dialog.dart';
import 'package:chat_tutorial/views/chat_page/chat_page.dart';
import 'package:chat_tutorial/views/models/load_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginVm extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  LoadStatus loadStatus = LoadStatus.initial;

  void loginAction({
    required String email,
    required String pass,
  }) async {
    if(email.trim().isNotEmpty&&pass.trim().isNotEmpty){
      loadStatus = LoadStatus.loading;
      update();
      try {
        userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: pass,
        );
        loadStatus = LoadStatus.success;
        if (userCredential?.user != null) {
          Get.offAll(() => ChatPage(title: userCredential?.user?.email ?? ''));
        }
        update();
      } catch (e) {
        print(e);
        loadStatus = LoadStatus.failure;
        AppDialog.messages(message: e.toString());
        update();
      }
    }else{
      AppDialog.messages(message: 'Enter email and pass!');
    }
  }
}
