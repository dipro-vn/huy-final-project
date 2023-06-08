import 'package:flutter/material.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_image.dart';

class RatingScreen extends StatefulWidget {
  static const routeName = '/Rating';

  @override
  State<RatingScreen> createState() => _RatingScreen();
}

class _RatingScreen extends State<RatingScreen> {
  int rate = 0;
  String display = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            final FocusScopeNode currentScope = FocusScope.of(context);
            if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 27),
                        width: 360,
                        height: 170,
                        child: Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(AppImages.ratingimg),
                                    fit: BoxFit.cover)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: 38,
                                width: 38,
                                margin:
                                    const EdgeInsets.only(top: 10, left: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.white,
                                ),
                                child: Image.asset(
                                  AppImages.back,
                                  width: 5,
                                  height: 9.5,
                                )),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 140),
                        height: 105,
                        width: 105,
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.yellow),
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: AssetImage(AppImages.hut),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  )
                ]),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'Pizza Hut',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    '4102 Pretty View Lanenda',
                    style: TextStyle(fontSize: 13, color: AppColors.greydask),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    'Please Rate Delivery Service',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    display,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            rate = 1;
                            display = 'Very Bad';
                          });
                        },
                        child: Icon(
                          Icons.star,
                          size: 35,
                          color: rate == 1 ||
                                  rate == 2 ||
                                  rate == 3 ||
                                  rate == 4 ||
                                  rate == 5
                              ? Colors.yellow
                              : null,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            rate = 2;
                            display = 'Bad';
                          });
                        },
                        child: Icon(
                          Icons.star,
                          size: 35,
                          color:
                              rate == 2 || rate == 3 || rate == 4 || rate == 5
                                  ? Colors.yellow
                                  : Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            rate = 3;
                            display = 'Normal';
                          });
                        },
                        child: Icon(
                          Icons.star,
                          size: 35,
                          color: rate == 3 || rate == 4 || rate == 5
                              ? Colors.yellow
                              : Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            rate = 4;
                            display = 'Good';
                          });
                        },
                        child: Icon(
                          Icons.star,
                          size: 35,
                          color: rate == 4 || rate == 5
                              ? Colors.yellow
                              : Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            rate = 5;
                            display = 'Very Good';
                          });
                        },
                        child: Icon(
                          Icons.star,
                          size: 35,
                          color: rate == 5 ? Colors.yellow : Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 250),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(250, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: AppColors.orange),
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
