import 'package:flutter/material.dart';

class TeacherScreen extends StatefulWidget {
  static const String routeName = "/TeacherScreen";

  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;

    return Center(
      child: Text("TeacherScreen"),
    );
  }
}
