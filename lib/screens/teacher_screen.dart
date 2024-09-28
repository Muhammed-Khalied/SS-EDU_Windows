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
        ],
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
                nameController.clear();
                subjectController.clear();
                phoneController.clear();
                whatsAppController.clear();
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
              // Edit action here
            },
          ),
          _buildActionButton(
            icon: Icons.delete,
            label: "حذف",
            color: ColorsManager.mainOrange,
            onPressed: () {
              // Delete action here
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
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorsManager.mainOrange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        'المواد الدراسية',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: ColorsManager.mainOrange,
        ),
      ),
    );
  }
}
