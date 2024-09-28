import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/screens/attendance_screen.dart';
import 'package:ss_edu/screens/home_screen_navigate.dart';
import 'package:ss_edu/screens/reports_screen.dart';
import 'package:ss_edu/screens/settings_screen.dart';
import 'package:ss_edu/screens/student_screen.dart';
import 'package:ss_edu/screens/teacher_screen.dart';
import 'package:ss_edu/home_screen.dart';
import 'package:ss_edu/theme/colors.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    appWindow.minSize = const Size(1100, 750);
    appWindow.size = const Size(1100, 750);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1100, 750),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: ColorsManager.white,
              appBarTheme:
                  const AppBarTheme(backgroundColor: ColorsManager.white)),
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.routeName,
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            Home_Screen_Navigation.routeName: (context) =>
                Home_Screen_Navigation(
                  onItemSelected: (p0) {},
                ),
            TeacherScreen.routeName: (context) => TeacherScreen(),
            Attendance_Screen.routeName: (context) => Attendance_Screen(),
            StudentScreen.routeName: (context) => StudentScreen(),
            ReportsScreen.routeName: (context) => ReportsScreen(),
            SettingsScreen.routeName: (context) => SettingsScreen(),
          },
        );
      },
    );
  }
}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
