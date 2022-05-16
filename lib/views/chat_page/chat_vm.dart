import 'package:chat_tutorial/views/models/message_entity.dart';
import 'package:get/get.dart';

class ChatVm extends GetxController {
  List<MessageEntity> listMess = [];

  void initData(List<MessageEntity> mess) {
    listMess = mess;
    listMess.sort((a, b) {
      return Comparable.compare(b.time ?? 0, a.time ?? 0);
    });
    update();
  }
}
