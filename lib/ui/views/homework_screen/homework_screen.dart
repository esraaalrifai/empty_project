import 'dart:io';

import 'package:darrebni/core/data/models/filetype_model.dart';
import 'package:darrebni/core/enums/filetype.dart';
import 'package:darrebni/ui/shared/colors.dart';

import 'package:darrebni/ui/shared/custum_widget/custm_button.dart';
import 'package:darrebni/ui/shared/custum_widget/custom_appbar.dart';
import 'package:darrebni/ui/shared/custum_widget/custom_form.dart';
import 'package:darrebni/ui/shared/custum_widget/custom_text.dart';

import 'package:darrebni/ui/shared/utils.dart';
import 'package:darrebni/ui/views/homework_screen/homework_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeWorkScreeen extends StatefulWidget {
  const HomeWorkScreeen({super.key});

  @override
  State<HomeWorkScreeen> createState() => _HomeWorkScreeenState();
}

class _HomeWorkScreeenState extends State<HomeWorkScreeen> {
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          toolbarHeight: screenHieght(10),
          elevation: 0,
          backgroundColor: AppColors.mainWhiteColor,
          leading: CustomAppBar(
              icon: Icon(
            Icons.arrow_back_ios,
          )),
          title: Text(
            'الواجبات',
            style: TextStyle(
              color: AppColors.mainBlueColor,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth(18),
            ),
          ),
          centerTitle: true,
          actions: [
            CustomAppBar(
              icon: Icon(Icons.notifications_active_outlined),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "النص "),
                CustomForm(
                  hinttext: "ادخل نص المنشور",
                  color: AppColors.mainWhiteColor,
                ),
                //screenHieght(30).ph,
                SizedBox(
                  height: screenWidth(70),
                ),
                CustomText(
                  text: 'الصور/الفيديوهات المرفقة',
                ),
                //screenHieght(50).ph,
                // SizedBox(
                //   height: screenWidth(70),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: screenHieght(6),
                      width: screenWidth(3.5),
                      child: SvgPicture.asset(
                        'assets/139 2.svg',
                      ),
                    ),
                    Container(
                      height: screenHieght(6),
                      width: screenWidth(3.5),
                      child: SvgPicture.asset(
                        'assets/139 2.svg',
                      ),
                    ),
                    Obx(
                      () => Container(
                        height: screenHieght(6.6),
                        width: screenWidth(3.5),
                        decoration: BoxDecoration(
                            color: AppColors.mainWhiteColor,
                            border: Border.all(color: AppColors.mainBlueColor),
                            borderRadius:
                                BorderRadius.circular(screenWidth(45))),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: InkWell(
                                      onTap: () =>
                                          _controller.pickFile(FileType.CAMERA),
                                      child: const Text('Camera')),

                                  //content: const Text('Dialog Content'),
                                );
                              },
                            );
                          },
                          child: _controller.isVisible.value
                              ? Image.file(
                                  _controller.file,
                                  fit: BoxFit.fill,
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      color: AppColors.mainBlueColor,
                                    ),
                                    Text(
                                      "إضافة صورة/فيديو",
                                      style: TextStyle(
                                          color: AppColors.mainBlueColor,
                                          fontSize: screenWidth(40)),
                                    )
                                  ],
                                ),
                        ),
                      ),
                    )
                  ],
                ),
                // SizedBox(
                //   height: screenWidth(50),
                // ),
                // screenHieght(10).ph,
                CustomText(text: "الصف"),
                Form(
                  child: DropdownButtonFormField<String>(
                    value: _controller.selectedValue.value,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(screenWidth(30)),
                      filled: true,
                      fillColor: AppColors.mainWhiteColor,
                      hintText: 'اختر الصف',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.mainBlueColor)),
                    ),
                    onChanged: (newValue) {
                      _controller.onChanged(newValue!);
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'الصف الأول',
                        ),
                        value: 'الصف الأول',
                      ),
                      DropdownMenuItem(
                        child: Text('الصف الثاني'),
                        value: 'الصف الثاني',
                      ),
                      DropdownMenuItem(
                        child: Text('الصف الثالث '),
                        value: 'الصف الثالث ',
                      ),
                    ],
                  ),
                ),
                // screenHieght(20).ph,
                SizedBox(
                  height: screenWidth(20),
                ),
                CustumButton(
                  text: "نشر",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
