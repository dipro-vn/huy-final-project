import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/core/app_text.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/Login';

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String present = "";
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: height / 4,
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(right: width / 2, left: 20),
                  child: FittedBox(
                    child: Text(
                      AppTexts.login,
                      style: const TextStyle(
                          fontSize: 100, fontWeight: FontWeight.w900),
                    ),
                  )),
              Container(
                height: 11 * height / 20,
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: password,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            AppTexts.forGotPass,
                            style: TextStyle(color: Colors.red),
                          )),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(width - 80, height / 18),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Color.fromARGB(165, 235, 60, 60)),
                        onPressed: () {
                          Navigator.popAndPushNamed(
                            context,
                            '/Home',
                          );
                        },
                        child: Text(
                          AppTexts.login,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppTexts.notAccount,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 17, 17, 17)),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/Signup');
                            },
                            child: Text(AppTexts.signup)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: height / 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              AppTexts.signInWith,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize:
                                      Size((width - 70) / 2, height / 18),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              onPressed: () {},
                              child: FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppImages.facebook,
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      AppTexts.faceBook,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ],
                                ),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize:
                                      Size((width - 70) / 2, height / 18),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              onPressed: () {},
                              child: FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppImages.google,
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      AppTexts.gooGle,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
