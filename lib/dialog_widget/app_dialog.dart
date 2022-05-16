import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  static Future<void> messages({
    required String? message,
    String? title,
    String? titleButton,
    VoidCallback? onTapOk,
    bool? iconNext = false,
  }) async {
    Get.generalDialog(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: Get.width * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  title != null
                      ? Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                          ),
                        )
                      : SizedBox(),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      message ?? '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 0.4,
                    width: Get.width,
                    color: Colors.blue,
                  ),
                  GestureDetector(
                    onTap: onTapOk ??
                        () {
                          Get.back();
                        },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(width: 25),
                          Expanded(
                            child: Text(
                              titleButton ?? 'OK',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          iconNext == true
                              ? Icon(
                                  Icons.navigate_next_outlined,
                                  size: 15,
                                )
                              : SizedBox(width: 15),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 300),
    );
  }
}
