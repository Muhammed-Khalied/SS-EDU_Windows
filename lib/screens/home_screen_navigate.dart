import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/components/elevated_button.dart';
import 'package:ss_edu/components/reusable_components.dart';
import 'package:ss_edu/theme/colors.dart';
import 'package:ss_edu/theme/spacing.dart';

class Home_Screen_Navigation extends StatelessWidget {
  static const String routeName = "/Home_Screen_Navigation";
  const Home_Screen_Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              const VerticalDivider(thickness: 1, width: 1),
              // Main Content Area
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Header Row
                        logo(),
                        Divider(color: ColorsManager.black.withOpacity(0.3)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Column for Images
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/studing.png",
                                  fit: BoxFit
                                      .contain, // Maintain image aspect ratio
                                  width: ScreenUtil().setWidth(
                                      300), // Adjust width based on screen size
                                  height: ScreenUtil().setHeight(
                                      400), // Adjust height based on screen size
                                ),
                                verticalSpace(1), // Space between images
                                Image.asset(
                                  "assets/images/logo_company.png",
                                  fit: BoxFit
                                      .contain, // Maintain image aspect ratio
                                  width: ScreenUtil().setWidth(
                                      250), // Adjust width based on screen size
                                  height: ScreenUtil().setHeight(
                                      190), // Adjust height based on screen size
                                ),
                              ],
                            ),
                            // Column for Buttons
                            Column(
                              children: [
                                horizentalSpace(20),
                                // Buttons Section 1
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

                                // Buttons Section 2
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
