import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/components/elevated_button.dart';
import 'package:ss_edu/theme/colors.dart';
import 'package:ss_edu/theme/spacing.dart';
import 'package:ss_edu/theme/styles.dart';

class Home_Screen_Navigation extends StatelessWidget {
  static const String routeName = "/Home_Screen_Navigation";
  const Home_Screen_Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: WindowBorder(
        color: ColorsManager.black.withOpacity(0.3),
        width: 0.0.w,
        child: Column(
          children: [
            WindowTitleBarBox(
              child: SizedBox(
                child: Container(
                  color: ColorsManager.mainOrange,
                  child: Row(
                    children: [
                      Expanded(child: MoveWindow()),
                      MinimizeWindowButton(
                        animate: true,
                      ),
                      MaximizeWindowButton(
                        animate: true,
                      ),
                      CloseWindowButton(
                        animate: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        BackButton(),
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
                              fit: BoxFit
                                  .contain, // Use contain to maintain image aspect ratio without cutting off parts
                              width: ScreenUtil().setWidth(
                                  300), // Adjust width based on screen size
                              height: ScreenUtil().setHeight(
                                  400), // Adjust height based on screen size
                            ),
                            Image.asset(
                              "assets/images/logo_company.png",
                              fit: BoxFit
                                  .contain, // Use contain to maintain image aspect ratio without cutting off parts
                              width: ScreenUtil().setWidth(
                                  250), // Adjust width based on screen size
                              height: ScreenUtil().setHeight(
                                  190), // Adjust height based on screen size
                            ),
                          ],
                        ),
                        horizentalSpace(170),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    width: 500.w,
                                    height: 90.h,
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
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            borderSide: const BorderSide(
                                              color: ColorsManager.mainOrange,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.r),
                                          )),
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                button(
                                    lable: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                            const AssetImage(
                                                "assets/images/bxs_category_orange.png"),
                                            size: 45.sp),
                                        Text(
                                          "الحضور",
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                      ],
                                    ),
                                    function: () {}),
                                horizentalSpace(10),
                                button(
                                    lable: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                            const AssetImage(
                                                "assets/images/mdi_teacher_orange.png"),
                                            size: 45.sp),
                                        Text(
                                          "المدرسين",
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                      ],
                                    ),
                                    function: () {}),
                                horizentalSpace(10),
                                button(
                                    lable: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                            const AssetImage(
                                                "assets/images/octicon_home-orange.png"),
                                            size: 45.sp),
                                        Text(
                                          "الرئيسية",
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                            const AssetImage(
                                                "assets/images/uil_setting_orange.png"),
                                            size: 45.sp),
                                        Text(
                                          "الأعدادات",
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                      ],
                                    ),
                                    function: () {}),
                                horizentalSpace(10),
                                button(
                                    lable: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                            const AssetImage(
                                                "assets/images/oui_app-reporting_orange.png"),
                                            size: 45.sp),
                                        Text(
                                          "التقارير",
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                      ],
                                    ),
                                    function: () {}),
                                horizentalSpace(10),
                                button(
                                    lable: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                            const AssetImage(
                                                "assets/images/Vector_white.png"),
                                            size: 45.sp),
                                        Text(
                                          "الطلاب",
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                      ],
                                    ),
                                    function: () {}),
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
                        horizentalSpace(20),
                        // Bottom Nav Bar
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        SizedBox(
                          width: 80.w,
                          height: heightScreen,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              buttonSideBar(
                                lable: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                      const AssetImage(
                                        "assets/images/octicon_home-orange.png",
                                      ),
                                      size: 30.sp,
                                    ),
                                    Text(
                                      "الرئيسية",
                                      style: TextStyle(fontSize: 9.sp),
                                    ),
                                  ],
                                ),
                                function: () {},
                              ),
                              verticalSpace(10),
                              buttonSideBar(
                                lable: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                      const AssetImage(
                                        "assets/images/mdi_teacher_orange.png",
                                      ),
                                      size: 30.sp,
                                    ),
                                    Text(
                                      "المدرسين",
                                      style: TextStyle(fontSize: 8.sp),
                                    ),
                                  ],
                                ),
                                function: () {},
                              ),
                              verticalSpace(10),
                              buttonSideBar(
                                lable: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                      const AssetImage(
                                        "assets/images/bxs_category_orange.png",
                                      ),
                                      size: 30.sp,
                                    ),
                                    Text(
                                      "الحضور",
                                      style: TextStyle(fontSize: 9.sp),
                                    ),
                                  ],
                                ),
                                function: () {},
                              ),
                              verticalSpace(10),
                              buttonSideBar(
                                lable: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                      const AssetImage(
                                        "assets/images/Vector_white.png",
                                      ),
                                      size: 30.sp,
                                    ),
                                    Text(
                                      "الطلاب",
                                      style: TextStyle(fontSize: 9.sp),
                                    ),
                                  ],
                                ),
                                function: () {},
                              ),
                              verticalSpace(10),
                              buttonSideBar(
                                lable: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                      const AssetImage(
                                        "assets/images/oui_app-reporting_orange.png",
                                      ),
                                      size: 30.sp,
                                    ),
                                    Text(
                                      "التقارير",
                                      style: TextStyle(fontSize: 9.sp),
                                    ),
                                  ],
                                ),
                                function: () {},
                              ),
                              verticalSpace(10),
                              buttonSideBar(
                                lable: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                      const AssetImage(
                                        "assets/images/uil_setting_orange.png",
                                      ),
                                      size: 30.sp,
                                    ),
                                    Text(
                                      "الأعدادات",
                                      style: TextStyle(fontSize: 8.sp),
                                    ),
                                  ],
                                ),
                                function: () {},
                              ),
                              verticalSpace(10),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
