import 'package:chat_tutorial/views/login_page/login_vm.dart';
import 'package:chat_tutorial/views/models/load_status.dart';
import 'package:chat_tutorial/views/register_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginVm vm = Get.put<LoginVm>(LoginVm());
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.2),
            Text(
              'Login',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                child: GetBuilder<LoginVm>(
                  builder: (logic) {
                    return logic.loadStatus == LoadStatus.loading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(color: Colors.white),
                          )
                        : Text('Login');
                  },
                ),
              ),
              onPressed: () {
                vm.loginAction(
                  email: nameController.text,
                  pass: passwordController.text,
                );
              },
            ),
            Row(
              children: <Widget>[
                Text('Does not have account?'),
                TextButton(
                  child: Text('Sign up', style: TextStyle(fontSize: 16)),
                  onPressed: () {
                    Get.to(() => RegisterPage());
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
