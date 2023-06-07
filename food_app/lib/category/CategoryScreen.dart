import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_app/Home/area.dart';
import 'package:food_app/Home/cotegories_item.dart';
import 'package:food_app/Home/home_item.dart';
import 'package:food_app/Home/meals.dart';
import 'package:food_app/category/Category_Item.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/core/app_text.dart';
import 'package:http/http.dart' as http;

import '../core/app_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  static const routeName = "/Category";

  @override
  State<CategoryScreen> createState() => _CategoryScreen();
}

class _CategoryScreen extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.category),
                          fit: BoxFit.cover)),
                  height: 250,
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 38,
                            width: 38,
                            margin: const EdgeInsets.only(
                              top: 10,
                            ),
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
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        '${args[1]}'.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 45, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'FOOD',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w700,
                            color: AppColors.orange),
                      ),
                      Text(
                        '${args[0].length}' 'type of food',
                        style:
                            TextStyle(fontSize: 19, color: AppColors.greydask),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 25, right: 30, bottom: 25, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            const Text(
                              'Short by: ',
                              style: TextStyle(fontSize: 14),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Popular',
                                  style: TextStyle(color: AppColors.orange),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                                image: AssetImage(AppImages.filter),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.greyshadow,
                                offset: Offset(0, 15),
                                blurRadius: 30,
                              )
                            ]),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: args[0].length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 250,
                          child: Category_Item(
                            image_food: args[0][index].strMealThumb,
                            name_food: args[0][index].strMeal,
                            id_food: args[0][index].idMeal,
                            favorite: false,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
