// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '*',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: '**'),
//     );
//   }A?
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//  final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               '__',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), 
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:untitled/weedcity.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kamiti Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  SimpleCalculator({Key? key}) : super(key: key);

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "error";
        }
      } else {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    },
  );
}

  void setState(Null Function() param0) {}
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {

  return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
        color: buttonColor,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: const BorderSide(
                color: Colors.white,
                width: 1,
                style: BorderStyle.solid,
              )),
          //padding: const EdgeInsets.all(16.0),
          onPressed: () => buttonPressed(buttonText),
          child: const Text(
            "buttonText",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
      //ukifinyilia hii button inafaa iende hidden page.
      onLongPress: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WeedCity()),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple Calculator'),
        ),
      body: Column(
        children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: const Text(
                "equation",
                //style: TextStyle(fontSize: equationFontSize),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: const Text(
                "result",
                //style: TextStyle(fontSize: resultFontSize),
              ),
            ),
          const Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * .75,
                  child: Table(children: [
                    TableRow(children: [
                      buildButton("C", 1, Colors.redAccent),
                      buildButton("⌫", 1, Colors.blue),
                      buildButton("÷", 1, Colors.blue),
                    ]),
                    TableRow(
                      children: [
                        buildButton("7", 1, Colors.black54),
                        buildButton("8", 1, Colors.black54),
                        buildButton("9", 1, Colors.black54),
                      ],
                    ),
                    TableRow(children: [
                      buildButton("4", 1, Colors.black54),
                      buildButton("5", 1, Colors.black54),
                      buildButton("6", 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      buildButton("1", 1, Colors.black54),
                      buildButton("2", 1, Colors.black54),
                      buildButton("3", 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      buildButton(".", 1, Colors.black54),
                      buildButton("0", 1, Colors.black54),
                      buildButton("00", 1, Colors.black54),
                    ])
                  ])),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("×", 1, Colors.blue),
                    ]),
                    TableRow(
                      children: [
                        buildButton("⁻", 1, Colors.blue),
                      ],
                    ),
                    TableRow(children: [
                      buildButton("+", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("=", 2, Colors.redAccent),
                    ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  buttonPressed(String buttonText) {}
}
