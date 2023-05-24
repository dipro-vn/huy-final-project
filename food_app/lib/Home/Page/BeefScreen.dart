import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/app_fonts.dart';
import '../categoris.dart';
import '../home_item.dart';

class Beef extends StatefulWidget {
  static const routeName = "/Beef";

  @override
  State<Beef> createState() => _Beef();
}

class _Beef extends State<Beef> {
  List<Categories> _foodAmerican = [];
  List<Categories> _foodCanada = [];
  List<Categories> _foodJapan = [];
  List<Categories> _foodItalia = [];
  List<Categories> _beef = [];

  Future<http.Response> getBeef() async {
    return await http.get(
        Uri.parse('http://www.themealdb.com/api/json/v1/1/filter.php?c=Beef'));
  }

  Future<void> fetchBeef() async {
    var result = await getBeef();
    var userMap = jsonDecode(result.body);
    final List data = userMap["meals"];
    var beef = data
        .map(
          (e) => Categories.fromJson(e),
        )
        .toList();
    setState(() {
      _beef = beef;
    });
  }

  Future<http.Response> getAmerican() async {
    return await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?a=American'));
  }

  Future<void> fetchAmerican() async {
    var result = await getAmerican();
    var userMap = jsonDecode(result.body);
    final List data = userMap["meals"];
    var american = data
        .map(
          (e) => Categories.fromJson(e),
        )
        .toList();
    setState(() {
      _foodAmerican = american;
    });
  }

  Future<http.Response> getCanada() async {
    return await http.get(Uri.parse(
        'http://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian'));
  }

  Future<void> fetchCanada() async {
    var result = await getCanada();
    var userMap = jsonDecode(result.body);
    final List data = userMap["meals"];
    var canada = data
        .map(
          (e) => Categories.fromJson(e),
        )
        .toList();
    setState(() {
      _foodCanada = canada;
    });
  }

  Future<http.Response> getJapan() async {
    return await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?a=Japanese'));
  }

  Future<void> fetchJapan() async {
    var result = await getJapan();
    var userMap = jsonDecode(result.body);
    final List data = userMap["meals"];
    var japan = data
        .map(
          (e) => Categories.fromJson(e),
        )
        .toList();
    setState(() {
      _foodJapan = japan;
    });
  }

  Future<http.Response> getItalia() async {
    return await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?a=Italian'));
  }

  Future<void> fetchItalia() async {
    var result = await getItalia();
    var userMap = jsonDecode(result.body);
    final List data = userMap["meals"];
    var italia = data
        .map(
          (e) => Categories.fromJson(e),
        )
        .toList();
    setState(() {
      _foodItalia = italia;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAmerican();
    fetchCanada();
    fetchJapan();
    fetchItalia();
    fetchBeef();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25, top: 30, bottom: 19),
            child: const Text(
              'Beef food',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: AppFonts.nunitoSans),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 229,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _beef.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Food_Item(
                          image_food: _beef[index].strMealThumb!,
                          name_food: _beef[index].strMeal!,
                          id_food: _beef[index].idMeal!),
                    );
                  },
                ),
              )
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 30, bottom: 19),
            child: const Text(
              'American Food',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: AppFonts.nunitoSans),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 229,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _foodAmerican.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Food_Item(
                          image_food: _foodAmerican[index].strMealThumb!,
                          name_food: _foodAmerican[index].strMeal!,
                          id_food: _foodAmerican[index].idMeal!),
                    );
                  },
                ),
              )
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 30, bottom: 19),
            child: const Text(
              'Canada Food',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: AppFonts.nunitoSans),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 229,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _foodCanada.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Food_Item(
                          image_food: _foodCanada[index].strMealThumb!,
                          name_food: _foodCanada[index].strMeal!,
                          id_food: _foodCanada[index].idMeal!),
                    );
                  },
                ),
              )
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 30, bottom: 19),
            child: const Text(
              'Japan Food',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: AppFonts.nunitoSans),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 229,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _foodJapan.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Food_Item(
                          image_food: _foodJapan[index].strMealThumb!,
                          name_food: _foodJapan[index].strMeal!,
                          id_food: _foodJapan[index].idMeal!),
                    );
                  },
                ),
              )
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 30, bottom: 19),
            child: const Text(
              'Italia Food',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: AppFonts.nunitoSans),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 229,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _foodItalia.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Food_Item(
                          image_food: _foodItalia[index].strMealThumb!,
                          name_food: _foodItalia[index].strMeal!,
                          id_food: _foodItalia[index].idMeal!),
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
    );
  }
}
