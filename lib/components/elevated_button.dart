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
  return SizedBox(
    width: 100.w,
    height: 80.h,
    child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          fixedSize: Size(120.w, 200.h),
          // shape: const RoundedRectangleBorder(),
        ).copyWith(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            return (states.contains(WidgetState.hovered))
                ? ColorsManager.mainOrange
                : ColorsManager.white;
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              return (states.contains(WidgetState.hovered))
                  ? Colors.white
                  : ColorsManager.black;
            },
          ),
        ),
        onPressed: function,
        label: lable),
  );
}

Widget buttonSideBarTest({
  required Widget icon, // Icon to display
  required void Function()? function, // Function to call on press
}) {
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      Color iconColor = ColorsManager.black; // Default icon color
      Color hoverColor = ColorsManager.mainOrange; // Color when hovered

      return SizedBox(
        width: 60.w,
        height: 80.h,
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              iconColor = hoverColor; // Change icon color on hover
            });
          },
          onExit: (_) {
            setState(() {
              iconColor = ColorsManager.black; // Change back to default color
            });
          },
          child: GestureDetector(
            onTap: () {
              if (function != null) {
                function(); // Call the provided function
              }
            },
            child: IconTheme(
              data: IconThemeData(
                color: iconColor, // Use the current icon color
                size: 24.sp, // Set the icon size
              ),
              child: icon, // Show the icon
            ),
          ),
        ),
      );
    },
  );
}
