import 'package:flutter/material.dart';
import 'package:food_app/image_text/app_image.dart';
import 'package:food_app/image_text/app_text.dart';

import 'main.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const routeName = '/Welcome';

  @override
  State<StatefulWidget> createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.welcome), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            right: 40, left: 20, top: height / 4),
                        width: width,
                        child: FittedBox(
                          child: Text(
                            AppTexts.welcome,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: width / 3),
                        width: width,
                        child: FittedBox(
                          child: Text(
                            AppTexts.foodhub,
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, color: Colors.red),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 40),
                        width: width,
                        child: FittedBox(
                          child: Text(
                            AppTexts.your,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 3 - height / 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              AppTexts.signInWith,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.white),
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
                    Container(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(width - 50, height / 18),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor:
                                  const Color.fromARGB(100, 1, 1, 1)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/Signup');
                          },
                          child: FittedBox(
                            child: Text(
                              AppTexts.emailOrPhone,
                              style: const TextStyle(fontSize: 15),
                            ),
                          )),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(right: width / 5, left: width / 5),
                      width: width,
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppTexts.haveAccount,
                              style: const TextStyle(color: Colors.white),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/Login');
                                },
                                child: Text(AppTexts.login))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
