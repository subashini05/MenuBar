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
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text('Table'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/table');
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        child: Text('List'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/list');
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        child: Text('Calculator'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/calculator');
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        child: Text('Profile'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                      ),
                    ],
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
