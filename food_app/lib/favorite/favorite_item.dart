import 'package:flutter/material.dart';
import 'package:food_app/Home/home_item.dart';
import 'package:food_app/core/app_colors.dart';

class Favorite_Item extends StatefulWidget {
  String image;
  String name;
  bool favorite;

  Favorite_Item(
      {required this.image, required this.name, required this.favorite});

  @override
  State<Favorite_Item> createState() => _Favorite_Item();
}

class _Favorite_Item extends State<Favorite_Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
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
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/Detail',
              arguments: Food_Item(
                image_food: widget.image,
                name_food: widget.name,
                id_food: '',
                favorite: widget.favorite,
              ));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 165,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.image,
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
                    widget.name,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
