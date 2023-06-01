import 'package:flutter/material.dart';
import 'package:food_app/core/app_colors.dart';

import '../core/app_fonts.dart';
import '../core/app_image.dart';

class Categories_Item extends StatefulWidget {
  Categories_Item({
    required this.image,
    required this.name,
    required this.id,
    required this.select,
  });
  String image;
  String name;
  String id;
  bool select;

  @override
  State<Categories_Item> createState() => _Categories_ItemState();
}

class _Categories_ItemState extends State<Categories_Item> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          padding: EdgeInsets.only(right: 2, left: 2),
          margin: const EdgeInsets.only(right: 5, left: 15, top: 5, bottom: 5),
          alignment: Alignment.center,
          height: 98,
          width: 58,
          decoration: BoxDecoration(
              color: widget.select == true ? AppColors.orange : AppColors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: widget.select == true
                      ? AppColors.orangeshadow
                      : AppColors.greyshadow,
                  offset: Offset(0, 20),
                  blurRadius: 30,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                widget.image,
                width: 50,
                height: 50,
              ),
              Text(
                widget.name,
                style: TextStyle(
                    color: widget.select == true ? Colors.white : Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.nunitoSans,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Categories {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  bool? kick;

  Categories({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.kick,
  });

  factory Categories.fromJson(dynamic json) {
    return Categories(
      idCategory: json['idCategory'],
      strCategory: json['strCategory'],
      strCategoryThumb: json['strCategoryThumb'],
    );
  }

  static List<Categories> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Categories.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Categories {idCategory: $idCategory, strCategory: $strCategory, strCategoryThumb: $strCategoryThumb}';
  }
}
