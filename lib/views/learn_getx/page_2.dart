import 'package:chat_tutorial/views/learn_getx/page_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            child: Text('Page 3', style: TextStyle(fontSize: 16)),
            onPressed: () {
              Get.to(() => Page3());
            },
          ),
        ),
      ),
    );
  }
}
