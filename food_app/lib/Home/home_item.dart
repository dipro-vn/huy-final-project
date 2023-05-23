import 'package:flutter/material.dart';

class Food_Item extends StatelessWidget {
  Food_Item({
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
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 165, 162, 154),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/Detail',
                arguments: Food_Item(
                    image_food: image_food,
                    name_food: name_food,
                    id_food: id_food));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            image_food,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 30,
                width: 180,
                child: Row(children: [
                  Flexible(
                    child: Text(
                      name_food,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
