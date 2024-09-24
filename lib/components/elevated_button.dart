import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/theme/colors.dart';

Widget button({required Widget lable, required void Function()? function}) {
  return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shadowColor: ColorsManager.mainOrange,
        elevation: 7,
        side: const BorderSide(color: ColorsManager.mainOrange),
        alignment: Alignment.center,
        fixedSize: Size(150.w, 220.h),
        backgroundColor: ColorsManager.white,
        shape: const RoundedRectangleBorder(),
      ).copyWith(
        backgroundColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          return (states.contains(WidgetState.hovered))
              ? ColorsManager.mainOrange
              : ColorsManager.white;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            return (states.contains(WidgetState.hovered))
                ? ColorsManager.white
                : ColorsManager.mainOrange;
          },
        ),
      ),
      onPressed: function,
      label: lable);
}

Widget buttonSideBar(
    {required Widget lable, required void Function()? function}) {
  return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        fixedSize: Size(120.w, 200.h),
        // shape: const RoundedRectangleBorder(),
      ).copyWith(
        backgroundColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          return (states.contains(WidgetState.hovered))
              ? ColorsManager.mainOrange
              : ColorsManager.white;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return Colors.white;
            }
            return ColorsManager.black;
          },
        ),
      ),
      onPressed: function,
      label: lable);
}
