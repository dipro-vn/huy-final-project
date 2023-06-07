import 'package:flutter/material.dart';
import 'package:food_app/core/app_colors.dart';
import 'package:food_app/core/app_image.dart';

class AddressScreen extends StatefulWidget {
  static const routeName = '/Address';

  @override
  State<AddressScreen> createState() => _AddressScreen();
}

class _AddressScreen extends State<AddressScreen> {
  TextEditingController fullname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fullname.text = 'Arlene McCoy';
    phone.text = '018-49862746';
    state.text = 'State';
    city.text = 'City';
  }

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
                      'Add new adress',
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
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 25),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Full name',
                          style: TextStyle(
                              fontSize: 16, color: AppColors.greydask),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 32),
                      width: 360,
                      height: 65,
                      child: TextField(
                        controller: fullname,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 25),
                        alignment: Alignment.centerLeft,
                        child: Text('Phone number',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.greydask))),
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 30),
                      width: 360,
                      height: 65,
                      child: TextField(
                        controller: phone,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 25),
                        alignment: Alignment.centerLeft,
                        child: Text('State',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.greydask))),
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 30),
                      width: 360,
                      height: 65,
                      child: TextField(
                        controller: state,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 25),
                        alignment: Alignment.centerLeft,
                        child: Text('City',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.greydask))),
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 30),
                      width: 360,
                      height: 65,
                      child: TextField(
                        controller: city,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 25),
                        alignment: Alignment.centerLeft,
                        child: Text('Street (Include house number)',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.greydask))),
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 50),
                      width: 360,
                      height: 65,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Street',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(240, 60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: AppColors.orange),
                          onPressed: () {
                            Navigator.popAndPushNamed(
                              context,
                              '/Home',
                            );
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          )),
                    ),
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
