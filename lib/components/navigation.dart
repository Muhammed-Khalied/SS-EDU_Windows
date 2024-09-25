import 'package:flutter/material.dart';
import 'package:ss_edu/screens/attendance_screen.dart';

import 'package:ss_edu/screens/reports_screen.dart';
import 'package:ss_edu/screens/settings_screen.dart';
import 'package:ss_edu/screens/student_screen.dart';
import 'package:ss_edu/screens/teacher_screen.dart';

class Navigation {
  static void navigateToTeatcherPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            TeacherScreen(), // Replace NewPage with your target page
      ),
    );
  }

  static void navigateToSettingsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SettingsScreen(), // Replace NewPage with your target page
      ),
    );
  }

  static void navigateToStudentPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            StudentScreen(), // Replace NewPage with your target page
      ),
    );
  }

  static void navigateToReportsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ReportsScreen(), // Replace NewPage with your target page
      ),
    );
  }

  static void navigateToAttendencePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Attendance_Screen(), // Replace NewPage with your target page
      ),
    );
  }
}
