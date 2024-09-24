import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/components/elevated_button.dart';
import 'package:ss_edu/theme/colors.dart';
import 'package:ss_edu/theme/spacing.dart';
import 'package:ss_edu/theme/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          elevation: 0.0,
          actions: [
            const Spacer(
              flex: 40,
            ),
            Text("SS",
                style: TextStyles.fontHeader
                    .copyWith(color: ColorsManager.mainOrange)),
            horizentalSpace(10),
            Text(
              "EDU",
              style: TextStyles.fontHeader,
            ),
            const Spacer()
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(
                color: ColorsManager.black.withOpacity(0.3),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! <<<<<<<<<<<<<<<<First Column>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/studing.png",
                        fit: BoxFit.cover,
                        width: 300.w,
                        height: 400.h,
                      ),
                      verticalSpace(5),
                      Image.asset(
                        "assets/images/logo_company.png",
                        fit: BoxFit.cover,
                        width: 250.w,
                        height: 190.h,
                      )
                    ],
                  ),
                  horizentalSpace(180),
                  //! <<<<<<<<<<<<<<<<Second Column>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 500.w,
                              height: 120.h,
                              child: TextFormField(
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w100),
                                    hintTextDirection: TextDirection.rtl,
                                    hintText: "ابحث ..............",
                                    suffixIcon: Icon(
                                      Icons.search,
                                      size: 18.sp,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(
                                        color: ColorsManager.mainOrange,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.r),
                                    )),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          button(
                              lable: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                      const AssetImage(
                                          "assets/images/bxs_category_orange.png"),
                                      size: 45.sp),
                                  Text(
                                    "الحضور",
                                    style: TextStyle(fontSize: 20.sp),
                                  )
                                ],
                              ),
                              function: () {}),
                          horizentalSpace(10),
                          button(
                              lable: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                      const AssetImage(
                                          "assets/images/mdi_teacher_orange.png"),
                                      size: 45.sp),
                                  Text(
                                    "المدرسين",
                                    style: TextStyle(fontSize: 20.sp),
                                  )
                                ],
                              ),
                              function: () {}),
                          horizentalSpace(10),
                          button(
                              lable: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                      const AssetImage(
                                          "assets/images/octicon_home-orange.png"),
                                      size: 45.sp),
                                  Text(
                                    "الرئيسية",
                                    style: TextStyle(fontSize: 20.sp),
                                  )
                                ],
                              ),
                              function: () {}),
                        ],
                      ),
                      verticalSpace(10),
                      Row(
                        children: [
                          button(
                              lable: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                      const AssetImage(
                                          "assets/images/uil_setting_orange.png"),
                                      size: 45.sp),
                                  Text(
                                    "الأعدادات",
                                    style: TextStyle(fontSize: 20.sp),
                                  )
                                ],
                              ),
                              function: () {}),
                          horizentalSpace(10),
                          button(
                              lable: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                      const AssetImage(
                                          "assets/images/oui_app-reporting_orange.png"),
                                      size: 45.sp),
                                  Text(
                                    "التقارير",
                                    style: TextStyle(fontSize: 20.sp),
                                  )
                                ],
                              ),
                              function: () {}),
                          horizentalSpace(10),
                          button(
                              lable: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                      const AssetImage(
                                          "assets/images/Vector_white.png"),
                                      size: 45.sp),
                                  Text(
                                    "الطلاب",
                                    style: TextStyle(fontSize: 20.sp),
                                  )
                                ],
                              ),
                              function: () {}),
                        ],
                      ),
                    ],
                  ),
                  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  horizentalSpace(10),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: ColorsManager.black.withOpacity(0.2),
                    ),
                    child: SizedBox(
                      height: heightScreen,
                      width: 1.sp,
                    ),
                  ),
                  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  horizentalSpace(35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 60.w,
                          height: 80.h,
                          child: buttonSideBar(
                              lable: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                      const AssetImage(
                                          "assets/images/octicon_home-orange.png"),
                                      size: 30.sp),
                                  Text(
                                    "الرئيسية",
                                    style: TextStyle(fontSize: 5.sp),
                                  )
                                ],
                              ),
                              function: () {})),
                      verticalSpace(20),
                      //????????????????????????????????????????????????????
                      SizedBox(
                          width: 60.w,
                          height: 80.h,
                          child: buttonSideBar(
                              lable: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                      const AssetImage(
                                          "assets/images/mdi_teacher_orange.png"),
                                      size: 30.sp),
                                  Text(
                                    "المدرسين",
                                    style: TextStyle(fontSize: 5.sp),
                                  )
                                ],
                              ),
                              function: () {})),
                      verticalSpace(20),
                      //????????????????????????????????????????????????????
                      SizedBox(
                          width: 60.w,
                          height: 80.h,
                          child: buttonSideBar(
                              lable: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                      const AssetImage(
                                          "assets/images/bxs_category_orange.png"),
                                      size: 30.sp),
                                  Text(
                                    "الحضور",
                                    style: TextStyle(fontSize: 5.sp),
                                  )
                                ],
                              ),
                              function: () {})),
                      verticalSpace(20),
                      //????????????????????????????????????????????????????
                      SizedBox(
                          width: 60.w,
                          height: 80.h,
                          child: buttonSideBar(
                              lable: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                      const AssetImage(
                                          "assets/images/Vector_white.png"),
                                      size: 30.sp),
                                  Text(
                                    "الطلاب",
                                    style: TextStyle(fontSize: 5.sp),
                                  )
                                ],
                              ),
                              function: () {})),
                      verticalSpace(20),
                      //????????????????????????????????????????????????????
                      SizedBox(
                          width: 60.w,
                          height: 80.h,
                          child: buttonSideBar(
                              lable: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                      const AssetImage(
                                          "assets/images/oui_app-reporting_orange.png"),
                                      size: 30.sp),
                                  Text(
                                    "التقارير",
                                    style: TextStyle(fontSize: 5.sp),
                                  )
                                ],
                              ),
                              function: () {})),
                      verticalSpace(20),
                      //????????????????????????????????????????????????????
                      SizedBox(
                          width: 60.w,
                          height: 80.h,
                          child: buttonSideBar(
                              lable: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                      const AssetImage(
                                          "assets/images/uil_setting_orange.png"),
                                      size: 30.sp),
                                  Text(
                                    "الأعدادات",
                                    style: TextStyle(fontSize: 5.sp),
                                  )
                                ],
                              ),
                              function: () {})),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
