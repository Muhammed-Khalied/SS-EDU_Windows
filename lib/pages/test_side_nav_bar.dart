import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/components/elevated_button.dart';
import 'package:ss_edu/theme/colors.dart';
import 'package:ss_edu/theme/spacing.dart';
import 'package:ss_edu/theme/styles.dart';

class HomeScreenTest extends StatelessWidget {
  static const String routeName = "/";
  const HomeScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: WindowBorder(
          color: Colors.transparent,
          child: WindowTitleBarBox(
              child: Container(
                  width: widthScreen,
                  color: ColorsManager.transparntt,
                  child: Row(
                    children: [
                      Expanded(child: MoveWindow()),
                      MinimizeWindowButton(animate: true),
                      MaximizeWindowButton(animate: true),
                      CloseWindowButton(animate: true),
                    ],
                  ))),
        ),
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Spacer(flex: 60),
                  Text("SS",
                      style: TextStyles.fontHeader
                          .copyWith(color: ColorsManager.mainOrange)),
                  horizentalSpace(10),
                  Text(
                    "EDU",
                    style: TextStyles.fontHeader,
                  ),
                  const Spacer(),
                ],
              ),
              Divider(color: ColorsManager.black.withOpacity(0.3)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/studing.png",
                        fit: BoxFit.contain,
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(400),
                      ),
                      Image.asset(
                        "assets/images/logo_company.png",
                        fit: BoxFit.contain,
                        width: ScreenUtil().setWidth(250),
                        height: ScreenUtil().setHeight(190),
                      ),
                    ],
                  ),
                  horizentalSpace(150),
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
                                  fontWeight: FontWeight.w100,
                                ),
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
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Buttons in a Row
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
                                  size: 45.sp,
                                ),
                                Text("الحضور",
                                    style: TextStyle(fontSize: 20.sp)),
                              ],
                            ),
                            function: () {},
                          ),
                          horizentalSpace(10),
                          button(
                            lable: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageIcon(
                                  const AssetImage(
                                      "assets/images/mdi_teacher_orange.png"),
                                  size: 45.sp,
                                ),
                                Text("المدرسين",
                                    style: TextStyle(fontSize: 20.sp)),
                              ],
                            ),
                            function: () {},
                          ),
                          horizentalSpace(10),
                          button(
                            lable: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageIcon(
                                  const AssetImage(
                                      "assets/images/octicon_home-orange.png"),
                                  size: 45.sp,
                                ),
                                Text("الرئيسية",
                                    style: TextStyle(fontSize: 20.sp)),
                              ],
                            ),
                            function: () {},
                          ),
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
                                  size: 45.sp,
                                ),
                                Text("الأعدادات",
                                    style: TextStyle(fontSize: 20.sp)),
                              ],
                            ),
                            function: () {},
                          ),
                          horizentalSpace(10),
                          button(
                            lable: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageIcon(
                                  const AssetImage(
                                      "assets/images/oui_app-reporting_orange.png"),
                                  size: 45.sp,
                                ),
                                Text("التقارير",
                                    style: TextStyle(fontSize: 20.sp)),
                              ],
                            ),
                            function: () {},
                          ),
                          horizentalSpace(10),
                          button(
                            lable: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageIcon(
                                  const AssetImage(
                                      "assets/images/Vector_white.png"),
                                  size: 45.sp,
                                ),
                                Text("الطلاب",
                                    style: TextStyle(fontSize: 20.sp)),
                              ],
                            ),
                            function: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
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
                  horizentalSpace(30),
                  // Sidebar Buttons
                  SizedBox(
                    width: 50.w,
                    height: heightScreen,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buttonSideBarTest(function: () {}, icon: Icon(Icons.home)),
                        verticalSpace(10),
                        buttonSideBarTest(function: () {}, icon: Icon(Icons.home)),
                        verticalSpace(10),
                        buttonSideBarTest(function: () {}, icon: Icon(Icons.home)),
                        verticalSpace(10),
                        buttonSideBarTest(function: () {}, icon: Icon(Icons.home)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
