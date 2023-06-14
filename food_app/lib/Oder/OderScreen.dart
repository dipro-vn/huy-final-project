import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/Oder/History.dart';
import 'package:food_app/Oder/List_Oder.dart';
import 'package:food_app/Oder/Oder.dart';
import 'package:food_app/cart/List_cart.dart';
import 'package:food_app/category/Category_Item.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_fonts.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/favorite/Favorite_Item.dart';
import 'package:food_app/favorite/List_favorite.dart';

class OderScreen extends StatefulWidget {
  const OderScreen({
    super.key,
  });
  static const routeName = "/Oder";

  @override
  State<OderScreen> createState() => _OderScreen();
}

class _OderScreen extends State<OderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {}
          });
          return Scaffold(
              body: SafeArea(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.popUntil(
                              context, ModalRoute.withName('/Home'));
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
                        'My Oder',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 38,
                        width: 38,
                        margin: const EdgeInsets.only(top: 10, right: 15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages.avatar),
                              fit: BoxFit.fill),
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 4, bottom: 4, left: 6, right: 6),
                  margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                  height: 55,
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: TabBar(
                      splashBorderRadius: BorderRadius.circular(100),
                      unselectedLabelStyle: const TextStyle(
                        fontFamily: AppFonts.nunitoSans,
                      ),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffFE724C)),
                      tabs: tabs),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                        children: [OderPage(), HistoryPage(history: history)]),
                  ),
                )
              ],
            ),
          ));
        }));
  }
}

const List<Tab> tabs = <Tab>[
  Tab(
    child: Text(
      'Oder',
      style: TextStyle(color: Colors.black),
    ),
  ),
  Tab(
    child: Text(
      "History",
      style: TextStyle(color: Colors.black),
    ),
  ),
];
