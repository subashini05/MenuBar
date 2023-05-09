import 'package:flutter/material.dart';
import 'package:student/pages/google_api_list_screen.dart';
import 'package:student/pages/calculator_screen.dart';
import 'package:student/pages/menuPage/coreWidget.dart';
import 'package:student/pages/menu_screen.dart';
import 'package:student/pages/profile_screen.dart';
import 'package:student/pages/table_screen.dart';

void main() => runApp(Navigation());

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Example',
      initialRoute: '/',
      routes: {
        '/': (context) => MyMenu(),
        '/table': (context) => TableScreen(),
        "/list": (context) => GoogleApiListScreen(),
        "/calculator": (context) => CalculatorApp(),
        "/profile": (context) => ProfileScreen(),
        "/coreWidget": (context) => CoreWidget(),
      },
    );
  }
}
