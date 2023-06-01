import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/Home/cotegories_item.dart';
import 'package:food_app/Home/home_item.dart';
import 'package:food_app/Home/meals.dart';
import 'package:food_app/core/app_fonts.dart';
import 'package:http/http.dart' as http;

class FoodHome extends StatefulWidget {
  @override
  State<FoodHome> createState() => _FoodHomeState();
}

class _FoodHomeState extends State<FoodHome> {
  final ScrollController _controller = ScrollController();
  List<Categories> _categories = [];
  List<Meals> _data = [];
  bool isLoading = true;

  Future<http.Response> getCategories() async {
    return await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
  }

  Future<void> fetchCategories() async {
    var result = await getCategories();
    var userMap = jsonDecode(result.body);
    final List data = userMap["categories"];
    var ctg = data
        .map(
          (e) => Categories.fromJson(e),
        )
        .toList();
    setState(() {
      _categories = ctg;
    });
    if (ctg.isNotEmpty) {
      fetchData(_categories[0].strCategory ?? '');
      _categories = _categories.map((e) {
        if (e == _categories[0]) {
          return Categories(
            idCategory: e.idCategory!,
            strCategoryThumb: e.strCategoryThumb!,
            strCategory: e.strCategory!,
            kick: true,
          );
        }
        return Categories(
          idCategory: e.idCategory!,
          strCategoryThumb: e.strCategoryThumb!,
          strCategory: e.strCategory!,
          kick: false,
        );
      }).toList();
    }
  }

  Future<http.Response> getData(String strMeal) async {
    return await http.get(Uri.parse(
        'http://www.themealdb.com/api/json/v1/1/filter.php?c=$strMeal'));
  }

  Future<void> fetchData(String name) async {
    var result = await getData(name);
    var userMap = jsonDecode(result.body);
    final List data = userMap["meals"];
    var beef = data
        .map(
          (e) => Meals.fromJson(e),
        )
        .toList();
    setState(() {
      _data = beef;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 110,
          child: ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    fetchData(_categories[index].strCategory!);
                    _categories = _categories.map((e) {
                      if (e == _categories[index]) {
                        return Categories(
                          idCategory: e.idCategory!,
                          strCategoryThumb: e.strCategoryThumb!,
                          strCategory: e.strCategory!,
                          kick: true,
                        );
                      }
                      return Categories(
                        idCategory: e.idCategory!,
                        strCategoryThumb: e.strCategoryThumb!,
                        strCategory: e.strCategory!,
                        kick: false,
                      );
                    }).toList();
                  });
                },
                child: Categories_Item(
                  image: _categories[index].strCategoryThumb!,
                  name: _categories[index].strCategory!,
                  id: _categories[index].idCategory!,
                  select: _categories[index].kick ?? false,
                ),
              );
            },
          ),
        ),
        isLoading == true
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 25, top: 25, bottom: 10),
                    child: const Text(
                      'Food',
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
                              itemCount: _data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                      left: 15, top: 5, bottom: 5),
                                  child: Food_Item(
                                      image_food: _data[index].strMealThumb!,
                                      name_food: _data[index].strMeal!,
                                      id_food: _data[index].idMeal!),
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
              ),
      ],
    );
  }
}
