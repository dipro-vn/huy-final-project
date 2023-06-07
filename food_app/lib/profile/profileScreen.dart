import 'package:flutter/material.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_image.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/Profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25, left: 20, right: 20),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.white,
                        ),
                        child: Image.asset(
                          AppImages.back,
                          width: 5,
                          height: 9.5,
                        ),
                      ),
                    ),
                    const Text(
                      'Profile',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 38,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60),
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(100),
                    image:
                        DecorationImage(image: AssetImage(AppImages.avatar))),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: const Text(
                    'Name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(color: AppColors.greydask),
                  )),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full name',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greydask),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 32),
                      width: 360,
                      height: 65,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Text('Email',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greydask)),
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 30),
                      width: 360,
                      height: 65,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Text('Phone number',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greydask)),
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 30),
                      width: 360,
                      height: 65,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
