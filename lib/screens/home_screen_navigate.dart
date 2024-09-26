import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/components/elevated_button.dart';
import 'package:ss_edu/components/reusable_components.dart';
import 'package:ss_edu/theme/colors.dart';
import 'package:ss_edu/theme/spacing.dart';

class Home_Screen_Navigation extends StatelessWidget {
  final Function(int) onItemSelected;
  static const String routeName = "/Home_Screen_Navigation";

  const Home_Screen_Navigation({required this.onItemSelected, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Header logo
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
                                  fit: BoxFit.contain,
                                  width: 300.w,
                                  height: 400.h,
                                ),
                                verticalSpace(1),
                                Image.asset(
                                  "assets/images/logo_company.png",
                                  fit: BoxFit.contain,
                                  width: 250.w,
                                  height: 190.h,
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
                                    buildIconButton(
                                      "assets/images/bxs_category_orange.png",
                                      "الحضور",
                                      () {
                                        onItemSelected(2);
                                      },
                                    ),
                                    horizentalSpace(10),
                                    buildIconButton(
                                      "assets/images/mdi_teacher_orange.png",
                                      "المدرسين",
                                      () {
                                        onItemSelected(1);
                                      },
                                    ),
                                    horizentalSpace(10),
                                    buildIconButton(
                                      "assets/images/octicon_home-orange.png",
                                      "الرئيسية",
                                      () {
                                        onItemSelected(0);
                                      },
                                    ),
                                  ],
                                ),
                                verticalSpace(10),
                                // Buttons Section 2
                                Row(
                                  children: [
                                    buildIconButton(
                                      "assets/images/uil_setting_orange.png",
                                      "الأعدادات",
                                      () {
                                        onItemSelected(5);
                                      },
                                    ),
                                    horizentalSpace(10),
                                    buildIconButton(
                                      "assets/images/oui_app-reporting_orange.png",
                                      "التقارير",
                                      () {
                                        onItemSelected(4);
                                      },
                                    ),
                                    horizentalSpace(10),
                                    buildIconButton(
                                      "assets/images/Vector_white.png",
                                      "الطلاب",
                                      () {
                                        onItemSelected(3);
                                      },
                                    ),
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
