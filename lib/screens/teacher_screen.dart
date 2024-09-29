/*


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/components/functions.dart';
import 'package:ss_edu/data/teachers.dart';
import 'package:ss_edu/theme/colors.dart';
import 'package:ss_edu/theme/spacing.dart';
import 'package:ss_edu/theme/styles.dart';

class TeacherScreen extends StatefulWidget {
  static const String routeName = "/TeacherScreen";

  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  bool _isAddingTeacher = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsAppController = TextEditingController();
  List<Teacher> teachers = [];
  int nextId = 1;
  Teacher? selectedTeacher;

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
              if (_isAddingTeacher) _buildNewTeacherForm(),
            ],
          ),
        ),
      ],
    );
  }

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

  Widget _buildSecondColumn() {
    return _buildColumnContainer(
      width: 490.w,
      child: Column(
        children: [
          _buildSubjectHeader(),
          verticalSpace(10),
          _buildTeacherListView()
        ],
      ),
    );
  }

  Widget _buildColumnContainer({required double width, required Widget child}) {
    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(ColorsManager.mainOrange),
        ),
      ),
      child: Container(
        width: width,
        height: 550.h,
        decoration: BoxDecoration(
          color: ColorsManager.black.withOpacity(0.1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 8.w),
          child: child,
        ),
      ),
    );
  }

  Widget _buildAddTeacherButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.mainOrange,
        fixedSize: Size(510.w, 80.h), // Responsive sizes
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          side: BorderSide(
              color: ColorsManager.white, width: 3.sp), // Scalable border
        ),
      ),
      onPressed: () {
        setState(() {
          _isAddingTeacher = true;
        });
        nameController.clear();
        subjectController.clear();
        phoneController.clear();
        whatsAppController.clear();
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

  Widget _buildNewTeacherForm() {
    return Positioned(
      left: 100.w,
      right: 100.w,
      top: 160.h,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        margin: EdgeInsets.symmetric(vertical: 25.h),
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
                      _isAddingTeacher = false;
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
                Functions.teacherTextFormField(subjectController,
                    label: "الماده"),
                Functions.teacherTextFormField(nameController, label: "الاسم"),
              ],
            ),
            verticalSpace(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Functions.teacherTextFormField(whatsAppController,
                    label: "رقم الواتس"),
                Functions.teacherTextFormField(phoneController,
                    label: "رقم الموبايل"),
              ],
            ),
            verticalSpace(50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 50.w),
                side: const BorderSide(
                    color: ColorsManager.mainOrange, width: 2.0),
                backgroundColor: ColorsManager.white,
              ).copyWith(
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    return (states.contains(WidgetState.pressed) ||
                            states.contains(WidgetState.hovered))
                        ? ColorsManager.mainOrange
                        : ColorsManager.white;
                  },
                ),
                foregroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    return (states.contains(WidgetState.pressed) ||
                            states.contains(WidgetState.hovered))
                        ? ColorsManager.white
                        : ColorsManager.mainOrange;
                  },
                ),
              ),
              onPressed: () {
                setState(() {
                  // Add new teacher details to the list
                  teachers.add(Teacher(
                    id: nextId++,
                    name: nameController.text,
                    subject: subjectController.text,
                    phoneNumber: phoneController.text,
                    whatsAppNumber: whatsAppController.text,
                  ));

                  // Clear the text fields after adding the teacher
                  nameController.clear();
                  subjectController.clear();
                  phoneController.clear();
                  whatsAppController.clear();
                  _isAddingTeacher = false;
                });
              },
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

  Widget _buildTeacherListView() {
    return Container(
      width: 0.9.sw,
      height: 0.6.sh,
      decoration: BoxDecoration(
        color: ColorsManager.transparntt,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          final teacher = teachers[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedTeacher = teacher;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: ColorsManager.mainOrange, width: 2.sp),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        teacher.subject,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.mainOrange,
                        ),
                      ),
                    ),
                    horizentalSpace(10),
                    Flexible(
                      child: Text(
                        ' ${teacher.phoneNumber}',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.mainOrange,
                        ),
                      ),
                    ),
                    horizentalSpace(10),
                    Flexible(
                      child: Text(
                        teacher.name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.mainOrange,
                        ),
                      ),
                    ),
                    horizentalSpace(10),
                    Flexible(
                      child: Text(
                        ' ${teacher.id}',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.mainOrange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTeacherDetailsContainer() {
    return Container(
      width: 480.w,
      height: 458.h,
      decoration: const BoxDecoration(color: ColorsManager.white),
      child: SingleChildScrollView(
        child: (selectedTeacher == null)
            ? Column(
                children: [
                  Image.asset(
                    "assets/images/image_null_listview_teacher.png",
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  verticalSpace(2),
                  Image.asset(
                    "assets/images/logo_company.png",
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ],
              )
            : Column(
                children: [
                  _buildAvatar(),
                  verticalSpace(5),
                  _buildTeacherDetails(),
                  verticalSpace(5),
                  _buildGroupDropdown(),
                  verticalSpace(5),
                  _buildActionButtons(),
                ],
              ),
      ),
    );
  }

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

  Widget _buildTeacherDetails() {
    return Column(
      children: [
        Functions.textDetails("ID", "${selectedTeacher!.id}"),
        verticalSpace(10),
        Functions.textDetails("الاسم", selectedTeacher!.name),
        verticalSpace(10),
        Functions.textDetails("رقم الموبايل", selectedTeacher!.phoneNumber),
        verticalSpace(10),
        Functions.textDetails("رقم الواتس", selectedTeacher!.whatsAppNumber),
        verticalSpace(10),
        Functions.textDetails("المادة", selectedTeacher!.subject),
      ],
    );
  }

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

  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionButton(
            icon: Icons.edit,
            label: "تعديل",
            color: ColorsManager.mainOrange,
            onPressed: () {},
          ),
          _buildActionButton(
            icon: Icons.delete,
            label: "حذف",
            color: ColorsManager.mainOrange,
            onPressed: () {
              int? selectedTeacherIndex = teachers.indexOf(selectedTeacher!);
              selectedTeacherIndex >= 0
                  ? setState(() {
                      teachers.removeAt(selectedTeacherIndex);
                      selectedTeacher = null;
                    })
                  : null;

              // if (selectedTeacherIndex >= 0) {
              //   setState(() {
              //     teachers.removeAt(selectedTeacherIndex);
              //     selectedTeacher = null; // Clear the selected teacher
              //   });
              // }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        size: 22.sp,
        color: ColorsManager.white,
      ),
      label: Text(
        label,
        style: TextStyle(fontSize: 18.sp, color: ColorsManager.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      onPressed: onPressed,
    );
  }

  Widget _buildSubjectHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.mainOrange),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              "المادة",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.mainOrange,
              ),
            ),
          ),
          horizentalSpace(10),
          Flexible(
            child: Text(
              "رقم الموبايل",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.mainOrange,
              ),
            ),
          ),
          horizentalSpace(10),
          Flexible(
            child: Text(
              "اسم المدرس",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.mainOrange,
              ),
            ),
          ),
          horizentalSpace(10),
          Flexible(
            child: Text(
              "ID",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.mainOrange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

*/

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss_edu/components/functions.dart';
import 'package:ss_edu/data/teachers.dart';
import 'package:ss_edu/theme/colors.dart';
import 'package:ss_edu/theme/spacing.dart';
import 'package:ss_edu/theme/styles.dart';

class TeacherScreen extends StatefulWidget {
  static const String routeName = "/TeacherScreen";

  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  bool _isAddingTeacher = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsAppController = TextEditingController();

  List<Teacher> teachers = [];
  int nextId = 1;
  Teacher? selectedTeacher;

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
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Functions.logo(),
                            Divider(
                                color: ColorsManager.black.withOpacity(0.3)),
                            verticalSpace(2),
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
              if (_isAddingTeacher) _buildNewTeacherForm(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFirstColumn() {
    return _buildColumnContainer(
      width: 400.w,
      child: Column(
        children: [
          _buildAddTeacherButton(),
          verticalSpace(10),
          _buildTeacherDetailsContainer(),
        ],
      ),
    );
  }

  Widget _buildSecondColumn() {
    return _buildColumnContainer(
      width: 594.w,
      child: ColoredBox(
        color: ColorsManager.white,
        child: Column(
          children: [
            _buildSubjectHeader(),
            verticalSpace(10),
            _buildTeacherListView(),
          ],
        ),
      ),
    );
  }

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
        decoration: BoxDecoration(color: ColorsManager.white),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 8.w),
          child: child,
        ),
      ),
    );
  }

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
          _isAddingTeacher = true;
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

  Widget _buildNewTeacherForm() {
    return Positioned(
      left: 100.w,
      right: 100.w,
      top: 160.h,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        margin: EdgeInsets.symmetric(vertical: 25.h),
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
                      _isAddingTeacher = false;
                    });
                    nameController.clear();
                    subjectController.clear();
                    phoneController.clear();
                    whatsAppController.clear();
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
                Functions.teacherTextFormField(subjectController,
                    label: "الماده"),
                Functions.teacherTextFormField(nameController, label: "الاسم"),
              ],
            ),
            verticalSpace(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Functions.teacherTextFormField(whatsAppController,
                    label: "رقم الواتس"),
                Functions.teacherTextFormField(phoneController,
                    label: "رقم الموبايل"),
              ],
            ),
            verticalSpace(50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 50.w),
                side: const BorderSide(
                    color: ColorsManager.mainOrange, width: 2.0),
                backgroundColor: ColorsManager.white,
              ).copyWith(
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    return (states.contains(WidgetState.pressed) ||
                            states.contains(WidgetState.hovered))
                        ? ColorsManager.mainOrange
                        : ColorsManager.white;
                  },
                ),
                foregroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    return (states.contains(WidgetState.pressed) ||
                            states.contains(WidgetState.hovered))
                        ? ColorsManager.white
                        : ColorsManager.mainOrange;
                  },
                ),
              ),
              onPressed: () {
                setState(() {
                  // Add new teacher details to the list
                  teachers.add(Teacher(
                    id: nextId++,
                    name: nameController.text,
                    subject: subjectController.text,
                    phoneNumber: phoneController.text,
                    whatsAppNumber: whatsAppController.text,
                  ));

                  // Clear the text fields after adding the teacher
                  nameController.clear();
                  subjectController.clear();
                  phoneController.clear();
                  whatsAppController.clear();
                  _isAddingTeacher = false;
                });
              },
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

  Widget _buildTeacherListView() {
    return Container(
      width: 0.9.sw,
      height: 0.6.sh,
      decoration: BoxDecoration(
        color: ColorsManager.transparntt,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          final teacher = teachers[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedTeacher = teacher;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: ColorsManager.mainOrange, width: 2.sp),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        teacher.subject,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.mainOrange,
                        ),
                      ),
                    ),
                    horizentalSpace(10),
                    Flexible(
                      child: Text(
                        ' ${teacher.phoneNumber}',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.mainOrange,
                        ),
                      ),
                    ),
                    horizentalSpace(10),
                    Flexible(
                      child: Text(
                        teacher.name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.mainOrange,
                        ),
                      ),
                    ),
                    horizentalSpace(10),
                    Flexible(
                      child: Text(
                        ' ${teacher.id}',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.mainOrange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

//todo://////////////////////
  void _showEditTeacherDialog(Teacher teacher) {
    // Populate the text fields with the selected teacher's details
    nameController.text = teacher.name;
    subjectController.text = teacher.subject;
    phoneController.text = teacher.phoneNumber;
    whatsAppController.text = teacher.whatsAppNumber;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("تعديل معلومات المدرس"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Functions.teacherTextFormField(nameController, label: "الاسم"),
                verticalSpace(10),
                Functions.teacherTextFormField(subjectController,
                    label: "الماده"),
                verticalSpace(10),
                Functions.teacherTextFormField(phoneController,
                    label: "رقم الموبايل"),
                verticalSpace(10),
                Functions.teacherTextFormField(whatsAppController,
                    label: "رقم الواتس"),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Update the teacher details in the list
                  teacher.name = nameController.text;
                  teacher.subject = subjectController.text;
                  teacher.phoneNumber = phoneController.text;
                  teacher.whatsAppNumber = whatsAppController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text("تحديث"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("إلغاء"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTeacherDetailsContainer() {
    return Container(
      width: 480.w,
      height: 458.h,
      decoration: const BoxDecoration(color: ColorsManager.white),
      child: SingleChildScrollView(
        child: (selectedTeacher == null)
            ? Column(
                children: [
                  Image.asset(
                    "assets/images/image_null_listview_teacher.png",
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  verticalSpace(2),
                  Image.asset(
                    "assets/images/logo_company.png",
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ],
              )
            : Column(
                children: [
                  _buildAvatar(),
                  verticalSpace(5),
                  _buildTeacherDetails(),
                  verticalSpace(5),
                  _buildGroupDropdown(),
                  verticalSpace(5),
                  _buildActionButtons(),
                ],
              ),
      ),
    );
  }

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

  Widget _buildTeacherDetails() {
    return Column(
      children: [
        Functions.textDetails("ID", "${selectedTeacher!.id}"),
        verticalSpace(10),
        Functions.textDetails("الاسم", selectedTeacher!.name),
        verticalSpace(10),
        Functions.textDetails("رقم الموبايل", selectedTeacher!.phoneNumber),
        verticalSpace(10),
        Functions.textDetails("رقم الواتس", selectedTeacher!.whatsAppNumber),
        verticalSpace(10),
        Functions.textDetails("المادة", selectedTeacher!.subject),
      ],
    );
  }

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

  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionButton(
            icon: Icons.edit,
            label: "تعديل",
            color: ColorsManager.mainOrange,
            onPressed: () {
              if (selectedTeacher != null) {
                _showEditTeacherDialog(selectedTeacher!);
              }
            },
          ),
          _buildActionButton(
            icon: Icons.delete,
            label: "حذف",
            color: ColorsManager.mainOrange,
            onPressed: () {
              int? selectedTeacherIndex = teachers.indexOf(selectedTeacher!);
              if (selectedTeacherIndex >= 0) {
                setState(() {
                  teachers.removeAt(selectedTeacherIndex);
                  selectedTeacher = null; // Clear the selected teacher
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        size: 22.sp,
        color: ColorsManager.white,
      ),
      label: Text(
        label,
        style: TextStyle(fontSize: 18.sp, color: ColorsManager.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      onPressed: onPressed,
    );
  }

  Widget _buildSubjectHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.mainOrange),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              "المادة",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.mainOrange,
              ),
            ),
          ),
          horizentalSpace(10),
          Flexible(
            child: Text(
              "رقم الموبايل",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.mainOrange,
              ),
            ),
          ),
          horizentalSpace(10),
          Flexible(
            child: Text(
              "اسم المدرس",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.mainOrange,
              ),
            ),
          ),
          horizentalSpace(10),
          Flexible(
            child: Text(
              "ID",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.mainOrange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
