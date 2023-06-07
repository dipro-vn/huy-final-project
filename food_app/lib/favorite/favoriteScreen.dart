import 'package:flutter/material.dart';
import 'package:food_app/category/Category_Item.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_image.dart';
import 'package:food_app/favorite/Favorite_Item.dart';
import 'list_favorite.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Favorite> favorite;
  const FavoriteScreen({super.key, required this.favorite});
  static const routeName = "/Favorite";

  @override
  State<FavoriteScreen> createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  List<Favorite> _favorites = [];

  @override
  void initState() {
    super.initState();
    _favorites.addAll(favorite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
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
                    'Favorite',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
            SizedBox(
              height: 30,
            ),
            _favorites.length == 0
                ? Text(
                    'No Favorite',
                    style: TextStyle(fontSize: 20),
                  )
                : SizedBox(
                    width: 350,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _favorites.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              height: 250,
                              child: Favorite_Item(
                                  image: _favorites[index].image!,
                                  name: _favorites[index].name!,
                                  favorite: _favorites[index].favorite),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 28,
                                    width: 69,
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          '4.5',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: AppColors.star,
                                          size: 12,
                                        ),
                                        const Text(
                                          '(25+)',
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _favorites.removeAt(index);
                                      favorite = _favorites;
                                    });
                                  },
                                  child: Container(
                                      height: 28,
                                      width: 28,
                                      margin: const EdgeInsets.only(
                                          top: 10, right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: _favorites[index].favorite
                                            ? AppColors.orange
                                            : AppColors.greylight,
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        color: AppColors.white,
                                        size: 20,
                                      )),
                                ),
                              ],
                            ),
                          ]);
                        }),
                  ),
          ],
        ),
      ),
    ));
  }
}
