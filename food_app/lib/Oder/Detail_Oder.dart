import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/Oder/List_Oder.dart';
import 'package:food_app/cart/List_cart.dart';
import 'package:food_app/category/Category_Item.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/favorite/Favorite_Item.dart';
import 'package:food_app/favorite/List_favorite.dart';

class DetailOder extends StatefulWidget {
  const DetailOder({
    super.key,
  });
  static const routeName = "/Oders";

  @override
  State<DetailOder> createState() => _DetailOder();
}

class _DetailOder extends State<DetailOder> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    double quantity() {
      double quantity = 0;
      args.forEach((item) {
        quantity += item.quantity!;
      });
      return quantity;
    }

    double oderTotalPrice() {
      double total = 0;
      args.forEach((item) {
        total += item.price!;
      });
      return total;
    }

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
                'Detail Oder',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Container(
                alignment: Alignment.center,
                height: 38,
                width: 38,
                margin: const EdgeInsets.only(top: 10, right: 15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.avatar), fit: BoxFit.fill),
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: args.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: AppColors.grey))),
                margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(args[index].image ?? ''))),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        height: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              args[index].name ?? '',
                              style: TextStyle(fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'x' '${args[index].quantity ?? 0}',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                    Text(
                      '${args[index].price}',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              );
            }),
        Container(
            padding: EdgeInsets.only(right: 5, left: 5, bottom: 5),
            margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: AppColors.grey))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Item Total',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  '${quantity()}',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )),
        Container(
            padding: EdgeInsets.only(right: 5, left: 5, bottom: 5),
            margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: AppColors.grey))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  '${oderTotalPrice()}',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )),
      ])),
    ));
  }
}
