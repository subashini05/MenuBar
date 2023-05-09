import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);
  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late Color operatorColor;
  //variables
  double firstNum = 0.0;
  double secondNum = 0.0;

  @override
  void initState() {
    super.initState();
    operatorColor = Color.fromARGB(255, 242, 242, 239);
  }

  Widget button({
    required String text,
    Color tColor = Colors.white,
    Color buttonBgColor = Colors.grey,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(22),
            primary: buttonBgColor,
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  var input = '';
  var output = '';
  var operation = '';
  onButtonClick(value) {
    print(value);
    if (value == "AC") {
      input = '';
      output = '';
    } else if (value == "C") {
      input = input.substring(0, input.length - 1);
    } else if (value == "=") {
      var userInput = input;
      userInput = input.replaceAll("x", "*");
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
    } else {
      input = input + value;
    }
    setState(() {});
  }

//void setState(Null Function() param0) {}
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
          backgroundColor: Colors.black,
          body: Column(
            children: [
              ElevatedButton(
                child: Text('Go back'),
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  color: Color.fromARGB(255, 6, 6, 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        input,
                        style: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        output,
                        style: TextStyle(
                          fontSize: 34,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  button(
                    text: "AC",
                    buttonBgColor: operatorColor,
                    tColor: Color.fromARGB(255, 13, 13, 14),
                    onPressed: () {},
                  ),
                  button(
                    text: "C",
                    buttonBgColor: operatorColor,
                    tColor: Color.fromARGB(255, 13, 13, 14),
                    onPressed: () {},
                  ),
                  button(
                      text: "",
                      buttonBgColor: Colors.transparent,
                      onPressed: () {}),
                  button(
                    text: "/",
                    buttonBgColor: operatorColor,
                    tColor: Color.fromARGB(255, 13, 13, 14),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  button(text: "7", onPressed: () {}),
                  button(text: "8", onPressed: () {}),
                  button(text: "9", onPressed: () {}),
                  button(
                    text: "x",
                    tColor: Color.fromARGB(255, 13, 13, 14),
                    buttonBgColor: operatorColor,
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  button(text: "4", onPressed: () {}),
                  button(text: "5", onPressed: () {}),
                  button(text: "6", onPressed: () {}),
                  button(
                    text: "-",
                    tColor: Color.fromARGB(255, 13, 13, 14),
                    buttonBgColor: operatorColor,
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  button(text: "1", onPressed: () {}),
                  button(text: "2", onPressed: () {}),
                  button(
                      text: "3",
                      buttonBgColor: Color.fromARGB(255, 108, 109, 110),
                      onPressed: () {}),
                  button(
                    text: "+",
                    tColor: Color.fromARGB(255, 13, 13, 14),
                    buttonBgColor: operatorColor,
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  button(text: "%", onPressed: () {}),
                  button(text: "0", onPressed: () {}),
                  button(
                      text: ".",
                      buttonBgColor: Color.fromARGB(255, 128, 129, 130),
                      onPressed: () {}),
                  button(
                    text: "=",
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
