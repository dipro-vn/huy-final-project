import 'package:flutter/material.dart';
import 'package:food_app/Home/home_item.dart';
import 'package:food_app/core/app_colors.dart';

import '../core/app_fonts.dart';

class Category_Item extends StatelessWidget {
  Category_Item({
    required this.image_food,
    required this.name_food,
    required this.id_food,
  });
  String image_food;
  String name_food;
  String id_food;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/Detail',
            arguments: Food_Item(
                image_food: image_food,
                name_food: name_food,
                id_food: id_food));
      },
      child: Container(
        width: 266,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.greyshadow,
                offset: const Offset(
                  0.0,
                  0.0,
                ),
                blurRadius: 30.0,
                blurStyle: BlurStyle.outer),
          ],
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 165,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              image_food,
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Expanded(
                    child: Row(children: [
                      Container(
                        width: 250,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 13, top: 12),
                        child: Text(
                          name_food,
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSans),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 28,
                    width: 69,
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '4.5',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFonts.nunitoSans),
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
                              fontFamily: AppFonts.nunitoSans),
                        ),
                      ],
                    )),
                Container(
                    height: 28,
                    width: 28,
                    margin: const EdgeInsets.only(top: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.greylight,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.white,
                      size: 20,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}