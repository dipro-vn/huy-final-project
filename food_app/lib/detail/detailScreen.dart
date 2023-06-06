import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_app/Home/home_item.dart';
import 'package:food_app/cart/List_cart.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/core/app_text.dart';
import 'package:food_app/favorite/list_favorite.dart';

import '../core/app_fonts.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});
  static const routeName = "/Detail";

  @override
  State<DetailScreen> createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  bool _perpep = false;
  bool _spinach = false;
  bool _masroom = false;
  var price = 9.5;
  var quantity = 1;
  num perpep = 2.3;
  num spinach = 4.7;
  num masroom = 2.5;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Food_Item;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 27, left: 20, top: 27),
            width: 400,
            height: 210,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(args.image_food),
                        fit: BoxFit.cover)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 38,
                        width: 38,
                        margin: const EdgeInsets.only(top: 10, left: 10),
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        args.favorite = !args.favorite;
                        if (args.favorite == true) {
                          favorite.add(Favorite(
                              image: args.image_food,
                              name: args.name_food,
                              favorite: args.favorite));
                        } else
                          favorite.removeWhere(
                              (item) => item.name == args.name_food);
                      });
                    },
                    child: Container(
                        height: 28,
                        width: 28,
                        margin: const EdgeInsets.only(top: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: args.favorite == true
                              ? AppColors.orange
                              : const Color.fromARGB(255, 210, 200, 200),
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.white,
                          size: 20,
                        )),
                  ),
                ],
              ),
            ]),
          ),
          Container(
              margin: EdgeInsets.only(top: 22),
              padding: EdgeInsets.only(left: 22),
              alignment: Alignment.centerLeft,
              child: Text(
                args.name_food,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              )),
          Container(
            padding: EdgeInsets.only(left: 22),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 17,
                ),
                SizedBox(width: 8),
                const Text(
                  '4.5',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5),
                const Text(
                  '(30+)',
                  style: TextStyle(fontSize: 14, color: Color(0xff9796A1)),
                ),
                SizedBox(width: 9),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'See Review',
                      style: TextStyle(fontSize: 13, color: AppColors.orange),
                    )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    '${(price)}'
                    'VND',
                    style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.w500,
                        color: AppColors.orange),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.remove_circle_outline,
                          size: 30,
                          color: AppColors.orange,
                        ),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity = quantity - 1;
                              price = price - 9.5;
                            } else {
                              quantity = quantity;
                            }
                          });
                        },
                      ),
                      const SizedBox(width: 9),
                      Text(
                        '$quantity',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 9),
                      IconButton(
                        icon: Icon(
                          Icons.add_circle_outlined,
                          size: 30,
                          color: AppColors.orange,
                        ),
                        onPressed: () {
                          setState(() {
                            quantity = quantity + 1;
                            price = price + 9.5;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 22),
            alignment: Alignment.centerLeft,
            child: Text(
              AppTexts.choice,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              AppImages.pepper,
                              width: 50,
                              height: 48,
                            ),
                            Text(
                              'Pepper Julienned',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              '+2.30',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _perpep = !_perpep;
                                  _perpep
                                      ? price = price + perpep
                                      : price = price - perpep;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 21.5,
                                height: 21.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 2,
                                        color: _perpep
                                            ? AppColors.orange
                                            : AppColors.grey)),
                                child: Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: _perpep
                                      ? AppColors.orange
                                      : AppColors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              AppImages.spinach,
                              width: 50,
                              height: 48,
                            ),
                            Text(
                              AppTexts.spinach,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              '+4.70',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _spinach = !_spinach;
                                  _spinach
                                      ? price = price + spinach
                                      : price = price - spinach;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 21.5,
                                height: 21.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 2,
                                        color: _spinach
                                            ? AppColors.orange
                                            : AppColors.grey)),
                                child: Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: _spinach
                                      ? AppColors.orange
                                      : AppColors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              AppImages.masroom,
                              width: 50,
                              height: 48,
                            ),
                            Text(
                              AppTexts.masroom,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            '+2.5',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _masroom = !_masroom;
                                _masroom
                                    ? price = price + masroom
                                    : price = price - masroom;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 21.5,
                              height: 21.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 2,
                                      color: _masroom
                                          ? AppColors.orange
                                          : AppColors.grey)),
                              child: Icon(
                                Icons.circle,
                                size: 15,
                                color: _masroom
                                    ? AppColors.orange
                                    : AppColors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () {
              cart.add(Cart(
                  image: args.image_food,
                  name: args.name_food,
                  price: price,
                  quantity: quantity));
              Navigator.pushNamed(context, '/Cart');
            },
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(28.5)),
              margin: const EdgeInsets.only(bottom: 32, left: 104, right: 104),
              height: 53,
              width: 167,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.white),
                    child: Image.asset(
                      AppImages.basket,
                      width: 16,
                      height: 17,
                    ),
                  ),
                  Text(
                    AppTexts.addtocard,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoSans),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
