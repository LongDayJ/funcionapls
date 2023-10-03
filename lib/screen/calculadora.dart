import 'package:flutter/material.dart';
import 'package:funcionapls/constants/color.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _expression = "";
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operand = "";
  bool _isDarkMode = false;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _expression = "";
        _num1 = 0.0;
        _num2 = 0.0;
        _operand = "";
      } else if (buttonText == "±") {
        _output = (-1 * double.parse(_output)).toString();
      } else if (buttonText == "%") {
        _output = (double.parse(_output) / 100).toString();
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "x" ||
          buttonText == "/") {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _expression += _output + " " + _operand + " ";
        _output = "0";
      } else if (buttonText == ".") {
        if (!_output.contains(".")) {
          _output += ".";
        }
      } else if (buttonText == "↩") {
        _output = _output.substring(0, _output.length - 1);
        if (_output == "") {
          _output = "0";
        }
      } else if (buttonText == "=") {
        _num2 = double.parse(_output);
        if (_operand == "+") {
          _output = (_num1 + _num2).toString();
        }
        if (_operand == "-") {
          _output = (_num1 - _num2).toString();
        }
        if (_operand == "x") {
          _output = (_num1 * _num2).toString();
        }
        if (_operand == "/") {
          _output = (_num1 / _num2).toString();
        }
        _expression += _num2.toString();
        _expression += " = " + _output;
        _num1 = 0.0;
        _num2 = 0.0;
        _operand = "";
      } else {
        if (_output == "0") {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
    });
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleTheme,
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: const MaterialStatePropertyAll(Colors.transparent),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: _isDarkMode
                    ? Toggler.darkBgColor
                    : Toggler.lightBgColor,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  width: 72,
                  height: 32,
                  child: Stack(
                    alignment: _isDarkMode ? Alignment.centerLeft : Alignment.centerRight,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: const Center(
                              child: Icon(
                                Icons.light_mode,
                                color: Toggler.iconColor,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: const Center(
                              child: Icon(
                                Icons.dark_mode_outlined,
                                color: Toggler.iconColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      Icon(
                        Icons.circle,
                        color: _isDarkMode ? Toggler.togglerDarkColor : Toggler.togglerLightColor,
                        size: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Text(
                _expression,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Text(
                _output,
                style: const TextStyle(fontSize: 50),
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemCount: 20,
                itemBuilder: (context, index) {
                  switch (index) {
                    // Button C
                    case 0:
                      return _buildButton("C", 
                      _isDarkMode ? DarkColor.functionButtonColor: LightColor.functionButtonColor);
                    // Button ±
                    case 1:
                      return _buildButton("±",
                      _isDarkMode ? DarkColor.functionButtonColor: LightColor.functionButtonColor);
                    // Button %
                    case 2:
                      return _buildButton("%",
                      _isDarkMode ? DarkColor.functionButtonColor: LightColor.functionButtonColor);
                    // Button /
                    case 3:
                      return _buildButton("/", ConstColor.operatorButtonColor);


                    // Button 7
                    case 4:
                      return _buildButton("7",
                      _isDarkMode ? DarkColor.numButtonColor: LightColor.numButtonColor);
                    // Button 8
                    case 5:
                      return _buildButton("8",
                      _isDarkMode ? DarkColor.numButtonColor: LightColor.numButtonColor);
                    // Button 9
                    case 6:
                      return _buildButton("9",
                      _isDarkMode ? DarkColor.numButtonColor: LightColor.numButtonColor);
                    // Button x
                    case 7:
                      return _buildButton("x", ConstColor.operatorButtonColor);


                    // Button 4
                    case 8:
                      return _buildButton("4",
                      _isDarkMode ? DarkColor.numButtonColor: LightColor.numButtonColor);
                    // Button 5
                    case 9:
                      return _buildButton("5",
                      _isDarkMode ? DarkColor.numButtonColor: LightColor.numButtonColor);
                    // Button 6
                    case 10:
                      return _buildButton("6",
                      _isDarkMode ? DarkColor.numButtonColor: LightColor.numButtonColor);
                    // Button -
                    case 11:
                      return _buildButton("-", ConstColor.operatorButtonColor);

                    
                    // Button 1
                    case 12:
                      return _buildButton("1",
                      _isDarkMode ? DarkColor.numButtonColor: LightColor.numButtonColor);
                    // Button 2
                    case 13:
                      return _buildButton("2",
                      _isDarkMode ? DarkColor.numButtonColor: LightColor.numButtonColor);
                    // Button 3
                    case 14:
                      return _buildButton("3",
                      _isDarkMode ? DarkColor.numButtonColor: LightColor.numButtonColor);
                    // Button +
                    case 15:
                      return _buildButton("+", ConstColor.operatorButtonColor);

                    // Button .
                    case 16:
                      return _buildButton(".",
                      _isDarkMode ? DarkColor.functionButtonColor: LightColor.functionButtonColor);
                    // Button 0
                    case 17:
                      return _buildButton("0",
                      _isDarkMode ? DarkColor.numButtonColor: LightColor.numButtonColor);
                    // Button ↩
                    case 18:
                      return _buildButton("↩",
                      _isDarkMode ? DarkColor.functionButtonColor: LightColor.functionButtonColor);
                    // Button =
                    case 19:
                      return _buildButton("=",
                      _isDarkMode ? DarkColor.equalButtonColor: LightColor.equalButtonColor);
                  }
                  return null;
                },
            ),
          )
        ],
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText, Color buttonColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _buttonPressed(buttonText),
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(const Size(80, 80)),
          backgroundColor: MaterialStatePropertyAll(buttonColor),
          foregroundColor: MaterialStatePropertyAll(_isDarkMode ? DarkColor.buttonTextColor : LightColor.buttonTextColor),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
          // padding: const EdgeInsets.all(24),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}