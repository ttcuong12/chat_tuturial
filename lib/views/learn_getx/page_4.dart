import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 4'),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            child: Text('Page 1', style: TextStyle(fontSize: 16)),
            onPressed: () {
              Get.until((route) => Get.routing.current.contains('Page1'));
            },
          ),
        ),
      ),
    );
  }
}
