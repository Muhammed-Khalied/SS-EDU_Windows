import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/screens/attendance_screen.dart';
import 'package:ss_edu/screens/home_screen_navigate.dart';
import 'package:ss_edu/screens/reports_screen.dart';
import 'package:ss_edu/screens/settings_screen.dart';
import 'package:ss_edu/screens/student_screen.dart';
import 'package:ss_edu/screens/teacher_screen.dart';
import 'package:ss_edu/theme/colors.dart';
import 'package:ss_edu/theme/spacing.dart';
import 'package:ss_edu/theme/styles.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late List<Widget> listPages;

  @override
  void initState() {
    super.initState();

    listPages = [
      Home_Screen_Navigation(onItemSelected: _onItemSelected),
      TeacherScreen(),
      Attendance_Screen(),
      StudentScreen(),
      ReportsScreen(),
      SettingsScreen(),
    ];
  }

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: ColorsManager.black.withOpacity(1),
        width: 0.0.w,
        child: Column(
          children: [
            WindowTitleBarBox(
              child: SizedBox(
                child: Container(
                  height: 20.h,
                  color: ColorsManager.mainOrange,
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SS",
                            style: TextStyles.fontHeader.copyWith(
                              fontSize: 20.sp,
                            ),
                          ),
                          horizentalSpace(10),
                          Text(
                            "EDU",
                            style: TextStyles.fontHeader.copyWith(
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: MoveWindow()),
                      MinimizeWindowButton(animate: true),
                      MaximizeWindowButton(animate: true),
                      CloseWindowButton(animate: true),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: listPages[_selectedIndex],
                  ),
                  VerticalDivider(
                    thickness: 1.sp,
                    width: 1.w,
                    color: ColorsManager.black.withOpacity(0.3),
                  ),
                  // NavigationRail
                  NavigationRail(
                    indicatorColor: ColorsManager.white,
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        _onItemSelected(value);
                      });
                    },
                    backgroundColor: Colors.transparent,
                    labelType: NavigationRailLabelType.all,
                    selectedIconTheme: const IconThemeData(
                      color: ColorsManager.mainOrange,
                    ),
                    selectedLabelTextStyle: const TextStyle(
                      color: ColorsManager.mainOrange,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedIconTheme:
                        const IconThemeData(color: ColorsManager.black),
                    unselectedLabelTextStyle:
                        const TextStyle(color: ColorsManager.black),
                    destinations: [
                      NavigationRailDestination(
                        indicatorColor: ColorsManager.mainOrange,
                        icon: ImageIcon(
                            const AssetImage(
                                "assets/images/octicon_home-orange.png"),
                            size: 30.sp),
                        label: const Text("الرئيسية"),
                      ),
                      NavigationRailDestination(
                        indicatorColor: ColorsManager.white,
                        icon: ImageIcon(
                            const AssetImage(
                                "assets/images/mdi_teacher_orange.png"),
                            size: 30.sp),
                        label: const Text("المدرسين"),
                      ),
                      NavigationRailDestination(
                        icon: ImageIcon(
                            const AssetImage(
                                "assets/images/bxs_category_orange.png"),
                            size: 30.sp),
                        label: const Text("الحصص"),
                      ),
                      NavigationRailDestination(
                        icon: ImageIcon(
                            const AssetImage("assets/images/Vector_white.png"),
                            size: 30.sp),
                        label: const Text("الطلاب"),
                      ),
                      NavigationRailDestination(
                        icon: ImageIcon(
                            const AssetImage(
                                "assets/images/oui_app-reporting_orange.png"),
                            size: 30.sp),
                        label: const Text("التقارير"),
                      ),
                      NavigationRailDestination(
                        icon: ImageIcon(
                            const AssetImage(
                                "assets/images/uil_setting_orange.png"),
                            size: 30.sp),
                        label: const Text("الأعدادات"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
