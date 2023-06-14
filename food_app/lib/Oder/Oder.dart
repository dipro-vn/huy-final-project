import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/Oder/List_Oder.dart';
import 'package:food_app/cart/List_cart.dart';
import 'package:food_app/category/Category_Item.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/favorite/Favorite_Item.dart';
import 'package:food_app/favorite/List_favorite.dart';

class OderPage extends StatefulWidget {
  const OderPage({
    super.key,
  });

  @override
  State<OderPage> createState() => _OderPage();
}

class _OderPage extends State<OderPage> {
  int truyen = 0;
  List oders = [];
  List<Oder> _oder1 = [];
  List<Oder> _oder2 = [];
  List<Oder> _oder3 = [];
  List<Oder> _oder4 = [];

  @override
  void initState() {
    super.initState();
    _oder1.addAll(oder1);
    _oder2.addAll(oder2);
    _oder3.addAll(oder3);
    _oder4.addAll(oder4);
  }

  @override
  Widget build(BuildContext context) {
    List a = [_oder1, _oder2, _oder3, _oder4];
    double quantity() {
      double quantity = 0;
      _oder1.forEach((item) {
        quantity += item.quantity!;
      });
      return quantity;
    }

    double oderTotalPrice() {
      double total = 0;
      _oder1.forEach((item) {
        total += item.price!;
      });
      return total;
    }

    return Scaffold(
        body: SafeArea(
      child: _oder1.length == 0
          ? Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.topCenter,
              child: const Text(
                'No Oder',
                style: TextStyle(fontSize: 18),
              ))
          : SingleChildScrollView(
              child: Container(
              alignment: Alignment.center,
              child: Column(children: [
                _oder4.length == 0
                    ? Container()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            oders = _oder3;
                            Navigator.pushNamed(context, '/Oders',
                                arguments: oders);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.greyshadow,
                                  offset: Offset(0, 20),
                                  blurRadius: 30,
                                )
                              ]),
                          margin: EdgeInsets.only(bottom: 15),
                          width: 320,
                          height: 180,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(18),
                                    padding: EdgeInsets.all(9),
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.greyshadow,
                                            offset: Offset(0, 20),
                                            blurRadius: 30,
                                          )
                                        ]),
                                    child: Image.asset(
                                      AppImages.hut,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 65,
                                        margin:
                                            EdgeInsets.only(top: 18, right: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${_oder4.length} items'),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: const [
                                                  Text('Processing'),
                                                  Text('Just')
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    right: 20, left: 20, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: AppColors.greyshadow,
                                          offset: Offset(0, 20),
                                          blurRadius: 30,
                                        )
                                      ]),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size(130, 45),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              backgroundColor: Colors.white),
                                          onPressed: () {},
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          )),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: AppColors.orangeshadow,
                                          offset: Offset(0, 20),
                                          blurRadius: 30,
                                        )
                                      ]),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size(130, 45),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              backgroundColor:
                                                  AppColors.orange),
                                          onPressed: () {},
                                          child: const Text(
                                            'Track Oder',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                _oder3.length == 0
                    ? Container()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            oders = _oder3;
                            Navigator.pushNamed(context, '/Oders',
                                arguments: oders);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.greyshadow,
                                  offset: Offset(0, 20),
                                  blurRadius: 30,
                                )
                              ]),
                          margin: const EdgeInsets.only(bottom: 15),
                          width: 320,
                          height: 180,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(18),
                                    padding: const EdgeInsets.all(9),
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.greyshadow,
                                            offset: Offset(0, 20),
                                            blurRadius: 30,
                                          )
                                        ]),
                                    child: Image.asset(
                                      AppImages.hut,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 65,
                                        margin:
                                            EdgeInsets.only(top: 18, right: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${_oder3.length} items'),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text('Processing'),
                                                  _oder4.isEmpty
                                                      ? const Text('Just')
                                                      : const Text('Before')
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    right: 20, left: 20, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: AppColors.greyshadow,
                                          offset: const Offset(0, 20),
                                          blurRadius: 30,
                                        )
                                      ]),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: const Size(130, 45),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              backgroundColor: Colors.white),
                                          onPressed: () {},
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          )),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: AppColors.orangeshadow,
                                          offset: Offset(0, 20),
                                          blurRadius: 30,
                                        )
                                      ]),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size(130, 45),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              backgroundColor:
                                                  AppColors.orange),
                                          onPressed: () {},
                                          child: const Text(
                                            'Track Oder',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                _oder2.length == 0
                    ? Container()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            oders = _oder2;
                            Navigator.pushNamed(context, '/Oders',
                                arguments: oders);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.greyshadow,
                                  offset: Offset(0, 20),
                                  blurRadius: 30,
                                )
                              ]),
                          margin: EdgeInsets.only(bottom: 15),
                          width: 320,
                          height: 180,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(18),
                                    padding: EdgeInsets.all(9),
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.greyshadow,
                                            offset: Offset(0, 20),
                                            blurRadius: 30,
                                          )
                                        ]),
                                    child: Image.asset(
                                      AppImages.hut,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 65,
                                        margin:
                                            EdgeInsets.only(top: 18, right: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${_oder2.length} items'),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Processing'),
                                                  _oder3.length == 0
                                                      ? Text('Just')
                                                      : Text('Before')
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    right: 20, left: 20, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: AppColors.greyshadow,
                                          offset: Offset(0, 20),
                                          blurRadius: 30,
                                        )
                                      ]),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size(130, 45),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              backgroundColor: Colors.white),
                                          onPressed: () {},
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          )),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: AppColors.orangeshadow,
                                          offset: Offset(0, 20),
                                          blurRadius: 30,
                                        )
                                      ]),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size(130, 45),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              backgroundColor:
                                                  AppColors.orange),
                                          onPressed: () {},
                                          child: const Text(
                                            'Track Oder',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                _oder1.length == 0
                    ? Container()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            oders = _oder1;
                            Navigator.pushNamed(context, '/Oders',
                                arguments: oders);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.greyshadow,
                                  offset: Offset(0, 20),
                                  blurRadius: 30,
                                )
                              ]),
                          margin: EdgeInsets.only(bottom: 15),
                          width: 320,
                          height: 180,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(18),
                                    padding: EdgeInsets.all(9),
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.greyshadow,
                                            offset: Offset(0, 20),
                                            blurRadius: 30,
                                          )
                                        ]),
                                    child: Image.asset(
                                      AppImages.hut,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 65,
                                        margin:
                                            EdgeInsets.only(top: 18, right: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${_oder1.length} items'),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Processing'),
                                                  _oder2.length == 0
                                                      ? Text('Just')
                                                      : Text('Before')
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    right: 20, left: 20, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: AppColors.greyshadow,
                                          offset: Offset(0, 20),
                                          blurRadius: 30,
                                        )
                                      ]),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size(130, 45),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              backgroundColor: Colors.white),
                                          onPressed: () {},
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          )),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: AppColors.orangeshadow,
                                          offset: Offset(0, 20),
                                          blurRadius: 30,
                                        )
                                      ]),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size(130, 45),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              backgroundColor:
                                                  AppColors.orange),
                                          onPressed: () {},
                                          child: const Text(
                                            'Track Oder',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
              ]),
            )),
    ));
  }
}
