import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app/Home/area.dart';
import 'package:food_app/Home/component/drawer.dart';
import 'package:food_app/Home/component/food.dart';
import 'package:food_app/Home/component/random.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_fonts.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/core/app_text.dart';
import 'package:http/http.dart' as http;
import 'cotegories_item.dart';
import 'meals.dart';
import 'home_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/Home";

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Area> _area = [];
  List<Meals> _data = [];
  List<Meals> _dataa = [];

  List<Categories> _categories = [];
  bool isLoading = false;

  Future<http.Response> getArea() async {
    return await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?a=list'));
  }

  Future<void> fetchArea() async {
    var result = await getArea();
    var userMap = jsonDecode(result.body);
    final List data = userMap["meals"];
    var ctg = data
        .map(
          (e) => Area.fromJson(e),
        )
        .toList();
    setState(() {
      _area = ctg;
    });
  }

  Future<http.Response> getDataa(String area) async {
    return await http.get(
        Uri.parse('http://www.themealdb.com/api/json/v1/1/filter.php?a=$area'));
  }

  Future<void> fetchDataa(String areaname) async {
    var result = await getDataa(areaname);
    var userMap = jsonDecode(result.body);
    final List dataa = userMap["meals"];
    var beef = dataa
        .map(
          (e) => Meals.fromJson(e),
        )
        .toList();
    setState(() {
      _dataa = beef;
    });
    Navigator.pushNamed(context, '/Category', arguments: [_dataa, areaname]);
  }

  @override
  void initState() {
    super.initState();
    fetchArea();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black26),
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: Column(
          children: const [
            Text(
              'Deliver to',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontFamily: AppFonts.nunitoSans),
            ),
            Text(
              '5000  Pretty View Lane',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontFamily: AppFonts.nunitoSans),
            )
          ],
        ),
      ),
      drawer: DrawerHome(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/Cart');
          },
          child: Icon(Icons.shopping_cart)),
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 19, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 25, right: 10),
                      width: 255,
                      height: 50,
                      child: TextField(
                        cursorColor: Color(0xFFFCFCFD),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            label: Row(
                              children: [
                                const Icon(Icons.search),
                                Text(
                                  AppTexts.find,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: AppFonts.nunitoSans),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 50,
                      height: 50,
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
              Container(
                margin: EdgeInsets.only(left: 5, bottom: 15, top: 5),
                height: 30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _area.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              fetchDataa(_area[index].strArea!);
                            });
                          },
                          child: Area_Item(name: _area[index].strArea!));
                    }),
              ),
              FoodHome(),
              const SizedBox(
                height: 5,
              ),
              FoodRandom(),
            ],
          ),
        ),
      ),
    );
  }
}
