import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_app/Home/home_item.dart';
import 'package:food_app/cart/Cart_Item.dart';
import 'package:food_app/cart/List_cart.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/core/app_text.dart';

import '../core/app_fonts.dart';

class CartScreen extends StatefulWidget {
  final List<Cart> cart;

  const CartScreen({super.key, required this.cart});
  static const routeName = "/Cart";

  @override
  State<CartScreen> createState() => _CartScreen();
}

class _CartScreen extends State<CartScreen> {
  bool data = false;
  List<Cart> _carts = [];
  num totalPriceSum = 0;
  num tax = 5.3;
  num delivery = 1.0;

  @override
  void initState() {
    super.initState();
    _carts.addAll(cart);
  }

  double cartTotalPrice() {
    double total = 0;
    _carts.forEach((item) {
      total += item.price!;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    var _subtotal = cartTotalPrice();
    var _total = cartTotalPrice() + tax + delivery;
    return Scaffold(
        body: SafeArea(
      child: _carts.length == 0
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
                      'Cart',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 38,
                    )
                  ],
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(40),
                    child: Text('No Cart')),
              ],
            )
          : SingleChildScrollView(
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
                            Navigator.pop(context);
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
                          'Cart',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 38,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _carts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(children: [
                          Container(
                            margin: EdgeInsets.only(left: 22),
                            child: Cart_Item(
                                image: _carts[index].image ?? '',
                                name: _carts[index].name ?? '',
                                price: _carts[index].price ?? 0,
                                quantity: _carts[index].quantity ?? 0),
                          ),
                          Container(
                            height: 70,
                            margin: EdgeInsets.only(
                              left: 280,
                              top: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _carts.removeAt(index);
                                      cart = _carts;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage(AppImages.slashes))),
                                    margin: EdgeInsets.only(left: 70),
                                    width: 14,
                                    height: 14,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.remove_circle_outline,
                                          size: 30,
                                          color: AppColors.orange,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (_carts[index].quantity! > 1) {
                                              _carts[index].quantity =
                                                  _carts[index].quantity! - 1;
                                              _carts[index].price =
                                                  _carts[index].price! - 9.5;
                                            }
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 9),
                                      Text(
                                        '${_carts[index].quantity}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(width: 9),
                                      IconButton(
                                        icon: Icon(
                                          Icons.add_circle_outlined,
                                          size: 30,
                                          color: AppColors.orange,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _carts[index].quantity =
                                                _carts[index].quantity! + 1;
                                            _carts[index].price =
                                                _carts[index].price! + 9.5;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]);
                      }),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 330,
                    height: 60,
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text('Promo Code'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 22, right: 22),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xffF1F2F3)))),
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Subtotal',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Text('$_subtotal'),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xffF1F2F3)))),
                          margin: EdgeInsets.only(top: 14),
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Tax and Fees',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Text('$tax')
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xffF1F2F3)))),
                          margin: EdgeInsets.only(top: 14),
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Delivery',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Text("$delivery")
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xffF1F2F3)))),
                          margin: EdgeInsets.only(top: 14),
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Total',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '(${_carts.length}items)',
                                    style: const TextStyle(
                                        fontSize: 14, color: Color(0xffBEBEBE)),
                                  )
                                ],
                              ),
                              Text('$_total')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      cartTotalPrice();
                    },
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.orange,
                            borderRadius: BorderRadius.circular(50)),
                        margin: const EdgeInsets.only(bottom: 32, top: 32),
                        height: 60,
                        width: 250,
                        child: const Text(
                          "Checkout",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFonts.nunitoSans),
                        )),
                  )
                ],
              ),
            ),
    ));
  }
}
