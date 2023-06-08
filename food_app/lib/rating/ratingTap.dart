import 'package:flutter/material.dart';

class RatingTap extends StatefulWidget {
  @override
  State<RatingTap> createState() => _RatingTapState();
}

class _RatingTapState extends State<RatingTap> {
  int rate = 0;
  String display = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 25),
          child: Text(
            display,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.red),
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
                  color: 1 <= rate && rate <= 5 ? Colors.yellow : null,
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
                  color: 2 <= rate && rate <= 5 ? Colors.yellow : Colors.black,
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
                  color: 3 <= rate && rate <= 5 ? Colors.yellow : Colors.black,
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
                  color: rate == 4 || rate == 5 ? Colors.yellow : Colors.black,
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
      ],
    );
  }
}
