import 'package:flutter/material.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/review/list_review.dart';

class ReviewRestaurent extends StatefulWidget {
  static const routeName = '/Review_restaurent';

  @override
  State<ReviewRestaurent> createState() => _ReviewRestaurent();
}

class _ReviewRestaurent extends State<ReviewRestaurent> {
  TextEditingController review = TextEditingController();

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
                        width: 350,
                        height: 150,
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
                        margin: EdgeInsets.only(top: 130),
                        height: 105,
                        width: 105,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: AssetImage(AppImages.hut),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  )
                ]),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    'Please Review Delivery Service',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 200),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 170,
                  child: TextFormField(
                    controller: review,
                    maxLines: 10,
                    maxLength: 500,
                    decoration: InputDecoration(
                      hintText: "Write review",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(250, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: AppColors.orange),
                    onPressed: () {
                      setState(() {
                        reviews
                            .add(Review(review.text, "Name", AppImages.avatar));
                        Navigator.popAndPushNamed(context, '/Review');
                      });
                    },
                    child: Text(
                      'Submit',
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
