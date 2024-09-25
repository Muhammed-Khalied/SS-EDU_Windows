import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/components/elevated_button.dart';
import 'package:ss_edu/components/reusable_components.dart';
import 'package:ss_edu/data/teachers.dart';
import 'package:ss_edu/theme/colors.dart';
import 'package:ss_edu/theme/spacing.dart';

class TeacherScreen extends StatefulWidget {
  static const String routeName = "/TeacherScreen";

  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  List<TeacherDetails> teachers = [
    TeacherDetails(
        name: 'Ahmed Ali',
        subject: 'Math',
        phoneNumber: 0123456789,
        id: 1234568421),
    TeacherDetails(
        name: 'Ahmed Ali',
        subject: 'Math',
        phoneNumber: 0123456789,
        id: 1234568421),
    TeacherDetails(
        name: 'Ahmed Ali',
        subject: 'Math',
        phoneNumber: 0123456789,
        id: 1234568421),
    TeacherDetails(
        name: 'Ahmed Ali',
        subject: 'Math',
        phoneNumber: 0123456789,
        id: 1234568421),
    TeacherDetails(
        name: 'Ahmed Ali',
        subject: 'Math',
        phoneNumber: 0123456789,
        id: 1234568421),
    TeacherDetails(
        name: 'Ahmed Ali',
        subject: 'Math',
        phoneNumber: 0123456789,
        id: 1234568421),
    TeacherDetails(
        name: 'Ahmed Ali',
        subject: 'Math',
        phoneNumber: 0123456789,
        id: 1234568421),
    TeacherDetails(
        name: 'Ahmed Ali',
        subject: 'Math',
        phoneNumber: 0123456789,
        id: 1234568421),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Header Row
                          logo(),
                          Divider(color: ColorsManager.black.withOpacity(0.3)),
                          searchBar(),
                          verticalSpace(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //todo:<<<<<<<<<<<<<<<<<<<<<<<<<<first Column>>>>>>>>>>>>>>>>>>>>>
                              Theme(
                                data: Theme.of(context).copyWith(
                                    scrollbarTheme: ScrollbarThemeData(
                                  thumbColor: WidgetStateProperty.all(
                                      ColorsManager.mainOrange),
                                )),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 500.w,
                                        height: 550.h,
                                        decoration: BoxDecoration(
                                            color: ColorsManager.black
                                                .withOpacity(0.1)),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 8.w),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        ColorsManager
                                                            .mainOrange,
                                                    alignment: Alignment.center,
                                                    fixedSize:
                                                        Size(510.w, 80.h),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    12.r)),
                                                        side: BorderSide(
                                                            color: ColorsManager
                                                                .white,
                                                            width: 3.sp)),
                                                  ),
                                                  onPressed: () {},
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        "إضافة مدرس جديد",
                                                        style: TextStyle(
                                                            textBaseline:
                                                                TextBaseline
                                                                    .ideographic,
                                                            color: ColorsManager
                                                                .white,
                                                            fontSize: 30.sp),
                                                      ),
                                                      Icon(
                                                        Icons.add,
                                                        color:
                                                            ColorsManager.white,
                                                        size: 50.sp,
                                                        fill: 0.8,
                                                      )
                                                    ],
                                                  )),
                                              verticalSpace(10),
                                              Container(
                                                width: 480.w,
                                                height: 550.h,
                                                decoration: const BoxDecoration(
                                                    color: ColorsManager.white),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(8.r),
                                                        alignment:
                                                            Alignment.center,
                                                        child: InkWell(
                                                          onTap: () {},
                                                          child: CircleAvatar(
                                                            radius: 70.r,
                                                            backgroundColor:
                                                                ColorsManager
                                                                    .white,
                                                            child: ImageIcon(
                                                              const AssetImage(
                                                                  "assets/images/avatar_icon.png"),
                                                              size: 150.sp,
                                                              color: ColorsManager
                                                                  .mainOrange,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      verticalSpace(10),
                                                      Column(
                                                        children: [
                                                          textDetails("الاسم",
                                                              "احمد محمد السعيد"),
                                                          verticalSpace(10),
                                                          textDetails(
                                                              "رقم الموبايل",
                                                              "01025952387"),
                                                          verticalSpace(10),
                                                          textDetails(
                                                              "رقم الواتس",
                                                              "01275537771"),
                                                          verticalSpace(10),
                                                          textDetails(
                                                              "المادة", "عربي"),
                                                        ],
                                                      ),
                                                      verticalSpace(10),
                                                      Container(
                                                        width: 170.w,
                                                        height: 40.h,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.r),
                                                            border: Border.all(
                                                                width: 2.sp,
                                                                color: ColorsManager
                                                                    .black
                                                                    .withOpacity(
                                                                        0.2.sp))),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            IconButton(
                                                                onPressed:
                                                                    () {},
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_drop_down_circle_outlined,
                                                                  color: ColorsManager
                                                                      .mainOrange,
                                                                  size: 25.sp,
                                                                )),
                                                            Text(
                                                              "المجموعات",
                                                              style: TextStyle(
                                                                  color: ColorsManager
                                                                      .mainOrange,
                                                                  fontSize:
                                                                      20.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      verticalSpace(35),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          elevetedEditingButton(
                                                              "إزالة المدرس",
                                                              Icons
                                                                  .disabled_by_default_outlined,
                                                              ColorsManager.red,
                                                              onclicked: () {}),
                                                          elevetedEditingButton(
                                                              "تعديل",
                                                              Icons.edit,
                                                              ColorsManager
                                                                  .blueDark,
                                                              onclicked: () {}),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      verticalSpace(10),
                                    ],
                                  ),
                                ),
                              ),
                              //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                              //todo:  <<<<<<<<<<<<<<<<<<<<<<<<<<<second Column>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              Theme(
                                data: Theme.of(context).copyWith(
                                    scrollbarTheme: ScrollbarThemeData(
                                  thumbColor: WidgetStateProperty.all(
                                      ColorsManager.mainOrange),
                                )),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 490.w,
                                        height: 550.h,
                                        decoration: const BoxDecoration(
                                            color: ColorsManager.white),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 13.h, horizontal: 8.w),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12.w),
                                                width: 500.w,
                                                height: 35.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.r),
                                                    border: Border.all(
                                                        color: ColorsManager
                                                            .mainOrange,
                                                        width: 1.5.sp)),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "المادة",
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                    Text(
                                                      "رقم الموبايل",
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                    Text(
                                                      "اسم المدرس",
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                    Text(
                                                      "id",
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              verticalSpace(10),
                                              ListView.separated(
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final teacher =
                                                        teachers[index];
                                                    return Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12.w),
                                                      width: 500.w,
                                                      height: 35.h,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.r),
                                                          border: Border.all(
                                                              color:
                                                                  ColorsManager
                                                                      .black,
                                                              width: 1.5.sp)),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            teacher.subject,
                                                            style: TextStyle(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                          Text(
                                                            "${teacher.phoneNumber}",
                                                            style: TextStyle(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                          Text(
                                                            teacher.name,
                                                            style: TextStyle(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                          Text(
                                                            "${teacher.id}",
                                                            style: TextStyle(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          verticalSpace(10),
                                                  itemCount: teachers.length),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



/*

                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    12.w),
                                                        width: 500.w,
                                                        height: 35.h,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.r),
                                                            border: Border.all(
                                                                color:
                                                                    ColorsManager
                                                                        .black,
                                                                width: 1.5.sp)),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "اليوم",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900),
                                                            ),
                                                            Text(
                                                              "المادة",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900),
                                                            ),
                                                            Text(
                                                              "رقم الموبايل",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900),
                                                            ),
                                                            Text(
                                                              "اسم المدرس",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                               
                                                */
                
    
                                              /*
                                              ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: 80,


                                                itemBuilder: (context, index) {



                                                  return Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12.w),
                                                    width: 500.w,
                                                    height: 35.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.r),
                                                        border: Border.all(
                                                            color: ColorsManager
                                                                .black,
                                                            width: 1.5.sp)),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "اليوم",
                                                          style: TextStyle(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        ),
                                                        Text(
                                                          "المادة",
                                                          style: TextStyle(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        ),
                                                        Text(
                                                          "رقم الموبايل",
                                                          style: TextStyle(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        ),
                                                        Text(
                                                          "اسم المدرس",
                                                          style: TextStyle(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )
                                           */






