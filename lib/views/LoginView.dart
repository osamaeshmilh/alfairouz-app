import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/LoginController.dart';
import '../utils/consts.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تسجيل الدخول"),
      ),
      body: GetBuilder<LoginController>(
        init: LoginController(),
        initState: (_) {},
        builder: (_) {
          return Form(
            key: _.loginFormKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 150,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: Get.height * .065,
                    child: TextFormField(
                      style: const TextStyle(
                        color: Const.primaryColor,
                      ),
                      cursorColor: Const.primaryColor,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'اسم المستخدم',
                        prefixIcon: Icon(
                          Icons.phone_android_sharp,
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'يجب عليك إدخال ريدك الإلكتروني'.tr;
                        }
                        return null;
                      },
                      controller: _.loginEmail,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: Get.height * .065,
                    child: TextFormField(
                      obscureText: true,
                      style: const TextStyle(color: Const.primaryColor),
                      cursorColor: Const.primaryColor,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'كلمة المرور',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'يجب عليك إدخال كلمة المرور'.tr;
                        } else {
                          return null;
                        }
                      },
                      controller: _.loginPassword,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                  child: InkWell(
                    child: Text(
                      'هل نسيت كلمة المرور؟',
                      style: TextStyle(
                        fontSize: Get.width * 0.04,
                        color: Const.primaryColor,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _.login();
                        },
                        child: const Text("تسجيل الدخول"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
