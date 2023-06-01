import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/core/app_colors.dart';

class Area {
  String? strArea;

  Area({required this.strArea});

  factory Area.fromJson(dynamic json) {
    return Area(strArea: json['strArea']);
  }

  static List<Area> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Area.fromJson(data);
    }).toList();
  }
}

class Area_Item extends StatefulWidget {
  Area_Item({required this.name});
  String name;

  @override
  State<Area_Item> createState() => _Area_ItemState();
}

class _Area_ItemState extends State<Area_Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1)),
          // color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyshadow,
              offset: Offset(0, 20),
              blurRadius: 30,
            )
          ]),
      margin: EdgeInsets.only(right: 5, left: 5, bottom: 5),
      padding: EdgeInsets.only(right: 5, left: 5, bottom: 5),
      child: Text(widget.name),
    );
  }
}
