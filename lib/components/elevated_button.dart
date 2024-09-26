import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/theme/colors.dart';
import 'package:ss_edu/theme/spacing.dart';

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

Widget elevetedEditingButton(
    String text, IconData? icon, Color? backgroundColorButton,
    {required void Function()? onclicked}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColorButton),
      onPressed: onclicked,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(color: ColorsManager.white, fontSize: 15.sp),
          ),
          horizentalSpace(5),
          Icon(
            icon,
            color: ColorsManager.white,
          )
        ],
      ));
}

  // Widget to create a button with an image and label
  
  Widget buildIconButton(
      String imagePath, String label, VoidCallback onPressed) {
    return button(
      lable: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageIcon(AssetImage(imagePath), size: 45.sp),
          Text(label, style: TextStyle(fontSize: 20.sp)),
        ],
      ),
      function: onPressed,
    );
  }
