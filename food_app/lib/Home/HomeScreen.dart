import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app/core/app_fonts.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/core/app_text.dart';
import 'package:http/http.dart' as http;
import 'Page/BeefScreen.dart';
import 'Page/ChickenScreen.dart';
import 'Page/LambScreen.dart';
import 'Page/PastaScreen.dart';
import 'Page/PorkScreen.dart';
import 'Page/SeafoodScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/Home";

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  var page = 1;

  @override
  void initState() {
    super.initState();
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
                    'icon/power.png',
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
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(
                            image: AssetImage(AppImages.filter),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        page = 1;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15, left: 25),
                      alignment: Alignment.center,
                      height: 98,
                      width: 58,
                      decoration: BoxDecoration(
                          color: page == 1
                              ? Color(0xFFFE724C)
                              : Color(0xFF40D3D1D8),
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            AppImages.beef,
                            width: 50,
                            height: 50,
                          ),
                          const Text(
                            "Beef",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFonts.nunitoSans),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        page = 2;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      height: 98,
                      width: 58,
                      decoration: BoxDecoration(
                          color: page == 2
                              ? Color(0xFFFE724C)
                              : Color(0xFF40D3D1D8),
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(AppImages.chicken),
                          const Text(
                            "Chicken",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFonts.nunitoSans),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        page = 3;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      height: 98,
                      width: 58,
                      decoration: BoxDecoration(
                          color: page == 3
                              ? Color(0xFFFE724C)
                              : Color(0xFF40D3D1D8),
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(AppImages.lamb),
                          const Text(
                            "Lamb",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFonts.nunitoSans),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        page = 4;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      height: 98,
                      width: 58,
                      decoration: BoxDecoration(
                          color: page == 4
                              ? Color(0xFFFE724C)
                              : Color(0xFF40D3D1D8),
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(AppImages.seafood),
                          const Text(
                            "Seafood",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFonts.nunitoSans),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        page = 5;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      height: 98,
                      width: 58,
                      decoration: BoxDecoration(
                          color: page == 5
                              ? Color(0xFFFE724C)
                              : Color(0xFF40D3D1D8),
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(AppImages.pork),
                          const Text(
                            "Pork",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFonts.nunitoSans),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        page = 6;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      height: 98,
                      width: 58,
                      decoration: BoxDecoration(
                          color: page == 6
                              ? Color(0xFFFE724C)
                              : Color(0xFF40D3D1D8),
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(AppImages.pasta),
                          const Text(
                            "Pasta",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFonts.nunitoSans),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            page == 1 ? Beef() : Container(),
            page == 2 ? Chicken() : Container(),
            page == 3 ? Lamb() : Container(),
            page == 4 ? Seafood() : Container(),
            page == 5 ? Pork() : Container(),
            page == 6 ? Pasta() : Container(),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
