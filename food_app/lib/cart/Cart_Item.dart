import 'package:flutter/material.dart';
import 'package:food_app/cart/List_cart.dart';
import 'package:food_app/core/app_colors.dart';

class Cart_Item extends StatefulWidget {
  String image;
  String name;
  num price;
  num quantity;

  Cart_Item(
      {required this.image,
      required this.name,
      required this.price,
      required this.quantity});

  @override
  State<Cart_Item> createState() => _Cart_Item();
}

class _Cart_Item extends State<Cart_Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: NetworkImage(widget.image))),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            width: 170,
            height: 65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style:
                      TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.price}' 'VND',
                  style: TextStyle(fontSize: 16, color: AppColors.orange),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [Row()],
            ),
          ),
        ],
      ),
    );
  }
}
