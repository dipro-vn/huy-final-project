import 'package:flutter/material.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_fonts.dart';
import 'package:food_app/core/app_image.dart';

class DrawerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: AssetImage(AppImages.avatar),
                                fit: BoxFit.cover)),
                      ),
                      const Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.nunitoSans),
                      ),
                      const Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFonts.nunitoSans),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    AppImages.oder,
                    width: 23,
                    height: 23,
                  ),
                  title: const Text(
                    'My Oders',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoSans),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    AppImages.profile,
                    width: 23,
                    height: 23,
                  ),
                  title: const Text(
                    'My profile',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoSans),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    AppImages.location,
                    width: 23,
                    height: 23,
                  ),
                  title: const Text(
                    'Delivery Adress',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoSans),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    AppImages.pay,
                    width: 23,
                    height: 23,
                  ),
                  title: const Text(
                    'Payment Methods',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoSans),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    AppImages.contact,
                    width: 23,
                    height: 23,
                  ),
                  title: const Text(
                    'Contact Us',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoSans),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    AppImages.setting,
                    width: 23,
                    height: 23,
                  ),
                  title: const Text(
                    'Settings',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoSans),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    AppImages.help,
                    width: 23,
                    height: 23,
                  ),
                  title: const Text(
                    'Help & FAQs',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoSans),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(50)),
            margin: const EdgeInsets.only(bottom: 32, left: 22),
            height: 43,
            width: 117,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  AppImages.power,
                  width: 26,
                  height: 26,
                ),
                const Text(
                  "Log Out",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.nunitoSans),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
