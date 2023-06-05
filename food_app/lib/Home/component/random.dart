import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/Home/cotegories_item.dart';
import 'package:food_app/Home/home_item.dart';
import 'package:food_app/Home/meals.dart';
import 'package:food_app/core/app_fonts.dart';
import 'package:http/http.dart' as http;

class FoodRandom extends StatefulWidget {
  @override
  State<FoodRandom> createState() => _FoodRandom();
}

class _FoodRandom extends State<FoodRandom> {
  List<Meals> _daataa = [];
  bool isLoading = true;

  Future<http.Response> getData() async {
    return await http
        .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));
  }

  Future<void> fetchDataaa() async {
    var result = await getData();
    var userMap = jsonDecode(result.body);
    final List data = userMap["meals"];
    var abc = data
        .map(
          (e) => Meals.fromJson(e),
        )
        .toList();
    setState(() {
      _daataa = abc;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataaa();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? CircularProgressIndicator()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 25, top: 25, bottom: 10),
                child: const Text(
                  'Random Food',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: AppFonts.nunitoSans),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: 230,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _daataa.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  left: 15, top: 5, bottom: 5),
                              child: Food_Item(
                                  image_food: _daataa[index].strMealThumb!,
                                  name_food: _daataa[index].strMeal!,
                                  id_food: _daataa[index].idMeal!),
                            );
                          },
                        ),
                      )
                    ]),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          );
  }
}
