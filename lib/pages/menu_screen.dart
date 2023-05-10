import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student/pages/profile_screen.dart';

import '../component/my_menu_bar.dart';

class MyMenu extends StatelessWidget {
  const MyMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'student',
      home: Shortcuts(
        shortcuts: <ShortcutActivator, Intent>{
          const SingleActivator(LogicalKeyboardKey.keyT, control: true):
              VoidCallbackIntent(() {
            debugDumpApp();
          }),
        },
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                MyMenuBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
