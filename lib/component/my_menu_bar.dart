import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student/pages/calculator_screen.dart';
import 'package:student/pages/profile_screen.dart';

import '../pages/table_screen.dart';

void main() => runApp(const MenuAcceleratorApp());

class MyMenuBar extends StatelessWidget {
  const MyMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: MenuBar(
                children: <Widget>[
                  SubmenuButton(
                    menuChildren: <Widget>[
                      SubmenuButton(
                        menuChildren: <Widget>[
                          MenuItemButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TableScreen()),
                              );
                            },
                            child: const MenuAcceleratorLabel('&Table'),
                          ),
                          MenuItemButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CalculatorApp()),
                              );
                            },
                            child: const MenuAcceleratorLabel('&Calculator'),
                          ),
                          MenuItemButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen()),
                              );
                            },
                            child: const MenuAcceleratorLabel('&Profile'),
                          ),
                        ],
                        child: const MenuAcceleratorLabel('&Sample screen'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Your Content saved Successfuly!'),
                            ),
                          );
                          //Navigator.pushNamed(context, '/table');
                        },
                        child: const MenuAcceleratorLabel('&Open'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('exit'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Exit'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&File'),
                  ),
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Magnify!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Magnify'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Minify!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Minify'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Settings!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Settings'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&View'),
                  ),
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Changed your Style'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel(' Style'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  ' ✓ Your font Settings set Successfully'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('Font'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&Edit'),
                  ),
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Loding...'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('Downlodes'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('view your documents here'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('Document'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(''),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('Storage'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&Device'),
                  ),
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Add operation'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Addition'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&Add'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MenuAcceleratorApp extends StatelessWidget {
  const MenuAcceleratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Shortcuts(
        shortcuts: <ShortcutActivator, Intent>{
          const SingleActivator(LogicalKeyboardKey.keyT, control: true):
              VoidCallbackIntent(() {
            debugDumpApp();
          }),
        },
        child: const Scaffold(body: MyMenuBar()),
      ),
    );
  }
}
