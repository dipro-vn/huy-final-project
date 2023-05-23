import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/core/app_text.dart';
import 'package:http/http.dart' as http;
import 'categoris.dart';
import 'home_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/Home";

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Categories> _foodAmerican = [];
  List<Categories> _foodCanada = [];
  List<Categories> _foodJapan = [];
  List<Categories> _foodItalia = [];

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
        'https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian'));
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
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 192, 179, 179),
        title: Column(
          children: const [
            Text(
              'Deliver to',
              style: TextStyle(color: Colors.black87, fontSize: 10),
            ),
            Text(
              '5000  Pretty View Lane',
              style: TextStyle(
                  color: Color.fromARGB(221, 255, 0, 0), fontSize: 12),
            )
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Container(
                      child: Column(
                        children: const [Text('Name'), Text('email')],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.my_library_books),
                    title: const Text('My Oders'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('My profile'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.maps_home_work_sharp),
                    title: const Text('Delivery Adress'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.payment),
                    title: const Text('Payment Methods'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.contact_mail),
                    title: const Text('Contact Us'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.help_center),
                    title: const Text('Help & FAQs'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
              margin: const EdgeInsets.only(bottom: 20, left: 30),
              height: 50,
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon((Icons.power_settings_new)),
                  Text("Log Out")
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.background),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.dstATop),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            label: Row(
                              children: [
                                const Icon(Icons.search),
                                Text(AppTexts.find),
                              ],
                            )),
                      ),
                    ),
                    const Icon(Icons.filter_list_outlined)
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Opacity(
                          opacity: 0.9,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/Beef');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: 40,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 200, 190, 190),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(AppImages.beef),
                                  const Text(
                                    "Beef",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/Beef');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 200, 190, 190),
                                borderRadius: BorderRadius.circular(50)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(AppImages.chicken),
                                const Text(
                                  "Chicken",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/Beef');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 40,
                            decoration: BoxDecoration(
                                color:
                                    const Color.fromARGB(2255, 200, 190, 190),
                                borderRadius: BorderRadius.circular(50)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(AppImages.lamb),
                                const Text(
                                  "Lamb",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/Beef');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 200, 190, 190),
                                borderRadius: BorderRadius.circular(50)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(AppImages.seafood),
                                const Text(
                                  "Seafood",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/Beef');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 200, 190, 190),
                                borderRadius: BorderRadius.circular(50)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(AppImages.pork),
                                const Text(
                                  "Pork",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/Beef');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 200, 190, 190),
                                borderRadius: BorderRadius.circular(50)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(AppImages.pasta),
                                const Text(
                                  "Pasta",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.black))),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 10),
                height: 180,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'American food',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _foodAmerican.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Food_Item(
                                image_food: _foodAmerican[index].strMealThumb!,
                                name_food: _foodAmerican[index].strMeal!,
                                id_food: _foodAmerican[index].idMeal!);
                          },
                        ),
                      )
                    ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 10),
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Canadian food',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _foodCanada.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Food_Item(
                              image_food: _foodCanada[index].strMealThumb!,
                              name_food: _foodCanada[index].strMeal!,
                              id_food: _foodCanada[index].idMeal!);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 10),
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Japanese food',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _foodJapan.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Food_Item(
                              image_food: _foodJapan[index].strMealThumb!,
                              name_food: _foodJapan[index].strMeal!,
                              id_food: _foodJapan[index].idMeal!);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 10),
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Italian food',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _foodItalia.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Food_Item(
                              image_food: _foodItalia[index].strMealThumb!,
                              name_food: _foodItalia[index].strMeal!,
                              id_food: _foodItalia[index].idMeal!);
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
