import 'dart:convert';
import 'package:flutter/material.dart';
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
  List<Meals> _data = [];
  List<Categories> _categories = [];
  bool isLoading = false;

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
      isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black26),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF),
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
                  color: Color.fromARGB(221, 255, 0, 0),
                  fontSize: 15,
                  fontFamily: AppFonts.nunitoSans),
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: AssetImage(AppImages.avatar),
                                  fit: BoxFit.cover)),
                        ),
                        const Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFonts.nunitoSans),
                        ),
                        const Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFonts.nunitoSans),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      AppImages.oder,
                      width: 23,
                      height: 23,
                    ),
                    title: const Text(
                      'My Oders',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.nunitoSans),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Image.asset(
                      AppImages.profile,
                      width: 23,
                      height: 23,
                    ),
                    title: const Text(
                      'My profile',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.nunitoSans),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Image.asset(
                      AppImages.location,
                      width: 23,
                      height: 23,
                    ),
                    title: const Text(
                      'Delivery Adress',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.nunitoSans),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Image.asset(
                      AppImages.pay,
                      width: 23,
                      height: 23,
                    ),
                    title: const Text(
                      'Payment Methods',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.nunitoSans),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Image.asset(
                      AppImages.contact,
                      width: 23,
                      height: 23,
                    ),
                    title: const Text(
                      'Contact Us',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.nunitoSans),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Image.asset(
                      AppImages.setting,
                      width: 23,
                      height: 23,
                    ),
                    title: const Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.nunitoSans),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Image.asset(
                      AppImages.help,
                      width: 23,
                      height: 23,
                    ),
                    title: const Text(
                      'Help & FAQs',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.nunitoSans),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Color(0xFFFE724C),
                  borderRadius: BorderRadius.circular(50)),
              margin: const EdgeInsets.only(bottom: 32, left: 22),
              height: 43,
              width: 117,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    AppImages.power,
                    width: 26,
                    height: 26,
                  ),
                  const Text(
                    "Log Out",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoSans),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 19, bottom: 30),
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
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xff40D3D1D8),
                            offset: Offset(0, 15),
                            blurRadius: 30,
                          )
                        ]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 110,
              child: ListView.builder(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 25, top: 25, bottom: 10),
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
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
