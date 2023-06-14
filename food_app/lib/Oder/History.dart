import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/Oder/List_Oder.dart';
import 'package:food_app/cart/List_cart.dart';
import 'package:food_app/category/Category_Item.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/favorite/Favorite_Item.dart';
import 'package:food_app/favorite/List_favorite.dart';

class HistoryPage extends StatefulWidget {
  final List<Oder> history;
  const HistoryPage({
    super.key,
    required this.history,
  });

  @override
  State<HistoryPage> createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  List<Oder> _history = [];

  @override
  void initState() {
    super.initState();
    _history.addAll(history);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(children: [
        _history.length == 0
            ? Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Text(
                  'No History',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _history.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: AppColors.grey))),
                    margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      _history[index].image ?? ''))),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _history[index].name ?? '',
                                  style: TextStyle(fontSize: 18),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'x' '${_history[index].quantity ?? 0}',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
      ])),
    ));
  }
}
