import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app/core/app_colors.dart';
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
  List<Data> _user = [];

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

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
                            backgroundColor: AppColors.orange),
                        onPressed: () {
                          for (var i in _user) {
                            if (i.email == email.text &&
                                i.password == password.text) {
                              Navigator.popAndPushNamed(
                                context,
                                '/Home',
                              );
                            }
                          }
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

  Future<http.Response> getUser() async {
    return await http
        .get(Uri.parse('https://6464566f127ad0b8f89c9636.mockapi.io/Users'));
  }

  Future<void> fetchUser() async {
    var result = await getUser();
    var userMap = jsonDecode(result.body);
    final List data = userMap;
    var ls = data
        .map(
          (e) => Data.fromJson(e),
        )
        .toList();
    setState(() {
      _user = ls;
    });
  }
}

class Data {
  String? name;
  String? email;
  String? password;
  String? avata;
  String? id;

  Data({this.name, this.email, this.password, this.avata, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    avata = json['avata'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['avata'] = this.avata;
    data['id'] = this.id;
    return data;
  }
}
