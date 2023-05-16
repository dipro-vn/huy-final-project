import 'package:flutter/material.dart';

import 'main.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const routeName = '/Welcome';

  @override
  State<StatefulWidget> createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  TextEditingController changename = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('image/welcome.jpg'), fit: BoxFit.cover)),
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
                        child: const FittedBox(
                          child: Text(
                            'WELCOME TO ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: width / 3),
                        width: width,
                        child: const FittedBox(
                          child: Text(
                            'FOODHUB',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, color: Colors.red),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 40),
                        width: width,
                        child: const FittedBox(
                          child: Text(
                            "Your favorite foods delivered fast at your door",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: height / 3 - height / 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      width: width,
                      child: const FittedBox(
                        child: Text(
                          '---------------------  Sign in with  ---------------------',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
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
                                      'icon/fb_icon.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'FACEBOOK',
                                      style: TextStyle(
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
                                      'icon/gg.jpg',
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      ' GOOGLE ',
                                      style: TextStyle(
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
                          child: const FittedBox(
                            child: Text(
                              'Start with email or phone',
                              style: TextStyle(fontSize: 20),
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
                            const Text(
                              'Already have an account?',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/Login');
                                },
                                child: const Text('Log in'))
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
