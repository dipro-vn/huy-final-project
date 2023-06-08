import 'package:flutter/material.dart';
import 'package:food_app/Home/HomeScreen.dart';
import 'package:food_app/address/addressScreen.dart';
import 'package:food_app/cart/CartScreen.dart';
import 'package:food_app/cart/List_cart.dart';
import 'package:food_app/category/CategoryScreen.dart';
import 'package:food_app/detail/detailScreen.dart';
import 'package:food_app/favorite/favoriteScreen.dart';
import 'package:food_app/favorite/list_favorite.dart';
import 'package:food_app/login.dart';
import 'package:food_app/profile/profileScreen.dart';
import 'package:food_app/rating/ratingScreen.dart';
import 'package:food_app/signup.dart';
import 'splash.dart';
import 'welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (ctx) => SplashScreen(),
        WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
        SignUpScreen.routeName: (ctx) => const SignUpScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        DetailScreen.routeName: (ctx) => const DetailScreen(),
        CategoryScreen.routeName: (ctx) => const CategoryScreen(),
        CartScreen.routeName: (ctx) => CartScreen(cart: cart),
        FavoriteScreen.routeName: (ctx) => FavoriteScreen(favorite: favorite),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        AddressScreen.routeName: (ctx) => AddressScreen(),
        RatingScreen.routeName: (ctx) => RatingScreen()
      },
    );
  }
}
