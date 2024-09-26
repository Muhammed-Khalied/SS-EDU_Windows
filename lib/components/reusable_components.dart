import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/theme/colors.dart';
import 'package:ss_edu/theme/spacing.dart';
import 'package:ss_edu/theme/styles.dart';

Widget searchBar() {
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

Widget logo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      horizentalSpace(870),
      Text(
        "SS",
        style: TextStyles.fontHeader.copyWith(
          color: ColorsManager.mainOrange,
          fontSize: 30.sp,
        ),
      ),
      horizentalSpace(10),
      Text(
        "EDU",
        style: TextStyles.fontHeader.copyWith(
          fontSize: 30.sp,
        ),
      ),
    ],
  );
}

Widget textDetails(String lable, String value) {
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



