import 'package:chat_tutorial/views/learn_getx/page_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            child: Text('Page 2', style: TextStyle(fontSize: 16)),
            onPressed: () {
              Get.to(() => Page2());
            },
          ),
        ),
      ),
    );
  }
}
