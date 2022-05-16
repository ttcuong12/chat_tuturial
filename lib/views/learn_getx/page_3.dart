import 'package:chat_tutorial/views/learn_getx/page_4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            child: Text('Page 4', style: TextStyle(fontSize: 16)),
            onPressed: () {
              Get.to(() => Page4());
            },
          ),
        ),
      ),
    );
  }
}
