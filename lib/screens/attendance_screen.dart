import 'package:flutter/material.dart';
import 'package:ss_edu/theme/colors.dart';

class Attendance_Screen extends StatelessWidget {
  static const String routeName = "/Attendance_Screen";
  const Attendance_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorsManager.red,
      child: Center(
        child: Text("Attendance_Screen"),
      ),
    );
  }
}
