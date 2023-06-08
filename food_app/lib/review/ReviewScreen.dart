import 'package:flutter/material.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/review/list_review.dart';

class ReviewScreen extends StatefulWidget {
  final List<Review> reviews;
  static const routeName = '/Review';

  const ReviewScreen({super.key, required this.reviews});
  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  TextEditingController review = TextEditingController();
  List<Review> _reviews = [];

  @override
  void initState() {
    super.initState();
    _reviews.addAll(reviews);
  }

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
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.popUntil(
                            context, ModalRoute.withName('/Home'));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 38,
                          width: 38,
                          margin: const EdgeInsets.only(top: 10, left: 15),
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
                    const Text(
                      'Review',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 38,
                      width: 38,
                      margin: const EdgeInsets.only(top: 10, right: 15),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: TextField(
                  controller: review,
                  decoration: InputDecoration(
                      hintText: 'Write your review',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (review.text.length != 0) {
                            _reviews.add(
                                Review(review.text, "Name", AppImages.avatar));
                            reviews.clear();
                            reviews.addAll(_reviews);
                            review.clear();
                          }
                        });
                      },
                      child: Text('Send'),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _reviews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(
                          right: 20, left: 20, bottom: 30, top: 10),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              _reviews[index].avtar ?? ''))),
                                ),
                                Text(
                                  _reviews[index].name ?? '',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          Container(
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(right: 15, left: 15),
                              child: Text(
                                _reviews[index].review ?? '',
                                style: TextStyle(color: Color(0xff7F7D92)),
                              )),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    )));
  }
}
