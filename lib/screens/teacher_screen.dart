import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ss_edu/components/functions.dart';
import 'package:ss_edu/theme/colors.dart';
import 'package:ss_edu/theme/spacing.dart';
import 'package:ss_edu/theme/styles.dart';

class TeacherScreen extends StatefulWidget {
  static const String routeName = "/TeacherScreen";

  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  bool _isAddingTeacher = false; // State variable to control visibility

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Header Row
                            Functions.logo(),
                            Divider(
                                color: ColorsManager.black.withOpacity(0.3)),
                            Functions.searchBar(),
                            verticalSpace(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildFirstColumn(),
                                _buildSecondColumn(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // New Teacher Form Container (overlaid on top)

              if (_isAddingTeacher) _buildNewTeacherForm(),
            ],
          ),
        ),
      ],
    );
  }

  // Function to build the first column
  Widget _buildFirstColumn() {
    return _buildColumnContainer(
      width: 500.w,
      child: Column(
        children: [
          _buildAddTeacherButton(),
          verticalSpace(10),
          _buildTeacherDetailsContainer(),
        ],
      ),
    );
  }

  // Function to build the second column
  Widget _buildSecondColumn() {
    return _buildColumnContainer(
      width: 490.w,
      child: Column(
        children: [
          _buildSubjectHeader(),
          verticalSpace(10),
          // Add any additional widgets here for the second column
        ],
      ),
    );
  }

  // Helper function to create a column container with common styles
  Widget _buildColumnContainer({required double width, required Widget child}) {
    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(ColorsManager.mainOrange),
        ),
      ),
      child: Container(
        width: width,
        height: 550.h,
        decoration: BoxDecoration(
          color: ColorsManager.black.withOpacity(0.1),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 8.w),
            child: child,
          ),
        ),
      ),
    );
  }

  // Function to build the add teacher button
  Widget _buildAddTeacherButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.mainOrange,
        fixedSize: Size(510.w, 80.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          side: BorderSide(color: ColorsManager.white, width: 3.sp),
        ),
      ),
      onPressed: () {
        setState(() {
          _isAddingTeacher = true; // Toggle visibility
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "إضافة مدرس جديد",
            style: TextStyle(
              textBaseline: TextBaseline.ideographic,
              color: ColorsManager.white,
              fontSize: 30.sp,
            ),
          ),
          Icon(
            Icons.add,
            color: ColorsManager.white,
            size: 50.sp,
          ),
        ],
      ),
    );
  }

// Function to build the new teacher form container
  Widget _buildNewTeacherForm() {
    return Positioned(
      // Position the form using Positioned widget
      left: 100.w,
      right: 100.w,
      top: 160.h, // Adjust the top position as needed
      child: Container(
        // height: 400.h,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        margin: EdgeInsets.symmetric(vertical: 25.h), // Add margin for spacing
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.mainOrange, width: 2.sp),
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(40.r),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.mainOrange.withOpacity(1),
              blurRadius: 4.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0, backgroundColor: ColorsManager.white),
                  onPressed: () {
                    setState(() {
                      _isAddingTeacher = false; // Close the form
                    });
                  },
                  child: Icon(
                    Icons.close,
                    size: 25.sp,
                    color: ColorsManager.mainOrange,
                  ),
                ),
                const Spacer(),
                Text("إضافة  المدرس",
                    style:
                        TextStyles.headerTextStyle.copyWith(fontSize: 18.sp)),
                const Spacer()
              ],
            ),
            verticalSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Functions.teacherTextFormField(label: "الماده"),
                Functions.teacherTextFormField(label: "الاسم"),
              ],
            ),
            verticalSpace(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Functions.teacherTextFormField(label: "رقم الواتس"),
                Functions.teacherTextFormField(label: "رقم الموبايل"),
              ],
            ),
            verticalSpace(50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 50.w),
                side: const BorderSide(
                    color: ColorsManager.mainOrange, width: 2.0),
                backgroundColor:
                    ColorsManager.white, // Default background color
              ).copyWith(
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    return (states.contains(WidgetState.pressed) ||
                            states.contains(WidgetState.hovered))
                        ? ColorsManager
                            .mainOrange // Change to orange when pressed or hovered
                        : ColorsManager.white; // Default background color
                  },
                ),
                foregroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    return (states.contains(WidgetState.pressed) ||
                            states.contains(WidgetState.hovered))
                        ? ColorsManager
                            .white // Change text color to white when pressed or hovered
                        : ColorsManager.mainOrange; // Default text color
                  },
                ),
              ),
              onPressed: () {},
              child: Text(
                "إضافة",
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build the teacher details container
  Widget _buildTeacherDetailsContainer() {
    return Container(
      width: 480.w,
      height: 550.h,
      decoration: const BoxDecoration(color: ColorsManager.white),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildAvatar(),
            verticalSpace(10),
            _buildTeacherDetails(),
            verticalSpace(10),
            _buildGroupDropdown(),
            verticalSpace(35),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  // Function to build the avatar
  Widget _buildAvatar() {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: 70.r,
        backgroundColor: ColorsManager.white,
        child: ImageIcon(
          const AssetImage("assets/images/avatar_icon.png"),
          size: 150.sp,
          color: ColorsManager.mainOrange,
        ),
      ),
    );
  }

  // Function to build the teacher details
  Widget _buildTeacherDetails() {
    return Column(
      children: [
        Functions.textDetails("الاسم", "احمد محمد السعيد"),
        verticalSpace(10),
        Functions.textDetails("رقم الموبايل", "01025952387"),
        verticalSpace(10),
        Functions.textDetails("رقم الواتس", "01275537771"),
        verticalSpace(10),
        Functions.textDetails("المادة", "عربي"),
      ],
    );
  }

  // Function to build the group dropdown
  Widget _buildGroupDropdown() {
    return Container(
      width: 170.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 2.sp,
          color: ColorsManager.black.withOpacity(0.2.sp),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_drop_down_circle_outlined,
              color: ColorsManager.mainOrange,
              size: 25.sp,
            ),
          ),
          Text(
            "المجموعات",
            style: TextStyle(
              color: ColorsManager.mainOrange,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Function to build the action buttons
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Functions.elevetedEditingButton(
          "إزالة المدرس",
          Icons.disabled_by_default_outlined,
          ColorsManager.red,
          onclicked: () {},
        ),
        Functions.elevetedEditingButton(
          "تعديل",
          Icons.edit,
          ColorsManager.blueDark,
          onclicked: () {},
        ),
      ],
    );
  }

  // Function to build the subject header for the second column
  Widget _buildSubjectHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      width: 500.w,
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(
          color: ColorsManager.mainOrange,
          width: 1.5.sp,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "المادة",
            style: TextStyle(
              color: ColorsManager.mainOrange,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.add_circle_outline,
            color: ColorsManager.mainOrange,
            size: 35.sp,
          ),
        ],
      ),
    );
  }
}
