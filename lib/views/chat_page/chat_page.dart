import 'package:chat_tutorial/dialog_widget/app_dialog.dart';
import 'package:chat_tutorial/views/chat_page/chat_vm.dart';
import 'package:chat_tutorial/views/models/message_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatVm vm = Get.put<ChatVm>(ChatVm());
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      FirebaseFirestore.instance
          .collection("/chats/PB3RZnCId7gG36ako30u/messages")
          .snapshots()
          .listen((snapshot) {
        vm.initData(snapshot.docs
            .map((e) => MessageEntity(
                text: e['text'] ?? '', time: e['time'] ?? 0, userName: e['user_name'] ?? 0))
            .toList());
      });
    });
  }

  CollectionReference mess =
      FirebaseFirestore.instance.collection('/chats/PB3RZnCId7gG36ako30u/messages');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ChatVm>(
              builder: (logic) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView.builder(
                    padding: EdgeInsets.all(15),
                    itemCount: logic.listMess.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return logic.listMess[index].userName == widget.title
                          ? buildItemRight(logic, index)
                          : buildItemLeft(logic, index);
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.blue,
            width: Get.width,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    maxLines: 4,
                    minLines: 1,
                    decoration: InputDecoration(
                      isDense: false,
                      fillColor: Colors.white,
                      alignLabelWithHint: false,
                      filled: true,
                      hintText: 'Enter mess',
                      enabledBorder: buildSetInputBorder(
                        color: Colors.blue,
                        borderRadius: 4,
                      ),
                      border: buildSetInputBorder(
                        color: Colors.blue,
                        borderRadius: 4,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (controller.text.trim().isEmpty) {
                      AppDialog.messages(message: 'Enter your message!');
                    } else {
                      mess.add({
                        'text': controller.text.trim(),
                        'user_name': widget.title,
                        'time': Timestamp.now().millisecondsSinceEpoch,
                      });
                      controller.text = '';
                    }
                  },
                  icon: Icon(
                    Icons.send,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildSetInputBorder({Color? color, double? borderRadius}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: color ?? Colors.blue,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius ?? 0),
      ),
    );
  }

  Widget buildItemLeft(ChatVm logic, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 15, right: Get.width * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(logic.listMess[index].userName?.split('@')[0] ?? ''),
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(logic.listMess[index].text ?? ''),
          ),
        ],
      ),
    );
  }

  Widget buildItemRight(ChatVm logic, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 15, left: Get.width * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(logic.listMess[index].userName?.split('@')[0] ?? ''),
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(logic.listMess[index].text ?? ''),
          ),
        ],
      ),
    );
  }
}
