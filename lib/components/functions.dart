import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/theme/colors.dart';
import 'package:ss_edu/theme/spacing.dart';
import 'package:ss_edu/theme/styles.dart';

class Functions {
  static Widget teacherTextFormField({required String? label}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        width: 350.w,
        height: 50.h,
        child: TextFormField(
          cursorColor: ColorsManager.black,
          keyboardType: TextInputType.text,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 20.0.sp,
              color: ColorsManager.mainOrange,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorsManager.mainOrange, width: 2.0),
              borderRadius: BorderRadius.circular(50.0.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorsManager.mainOrange, width: 2.0),
              borderRadius: BorderRadius.circular(50.0.r),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0.r),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            alignLabelWithHint: true,
          ),
          style: TextStyle(fontSize: 16.0.sp),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }

  static Widget searchBar() {
    return SizedBox(
      height: 40.h,
      child: TextFormField(
        cursorColor: ColorsManager.mainOrange,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 10.w,
          ),
          hintStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w100),
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
    );
  }

  static Widget logo() {
    return SizedBox(  
      height: 28.h,
      width: 28.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          horizentalSpace(870),
          Text(
            "SS",
            style: TextStyles.fontHeader.copyWith(
              color: ColorsManager.mainOrange,
              fontSize: 25.sp,
            ),
          ),
          horizentalSpace(10),
          Text(
            "EDU",
            style: TextStyles.fontHeader.copyWith(
              fontSize: 25.sp,
            ),
          ),
        ],
      ),
    );
  }

  static Widget textDetails(String lable, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          value,
          style: TextStyle(
              color: ColorsManager.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        ),
        Text(
          ": $lable ",
          style: TextStyle(
              color: ColorsManager.mainOrange,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  static Widget button(
      {required Widget lable, required void Function()? function}) {
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
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
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

  static Widget buttonSideBar(
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

  static Widget elevetedEditingButton(
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
  static Widget buildIconButton(
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

  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
