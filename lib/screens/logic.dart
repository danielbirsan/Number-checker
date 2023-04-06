import 'package:flutter/material.dart';
import 'dart:math';

class NumberVerifyWidget extends StatefulWidget {
  const NumberVerifyWidget({super.key});

  @override
  NumberVerifyWidgetState createState() => NumberVerifyWidgetState();
}

class NumberVerifyWidgetState extends State<NumberVerifyWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _isSquare = false;
  bool _isCube = false;
  bool _isInvalidInput = false;

  void _checkNumber(String text) {
    if (text.isEmpty) {
      _isSquare = false;
      _isCube = false;
      _isInvalidInput = false;
      return;
    }

    if (int.tryParse(text) == null) {
      _isSquare = false;
      _isCube = false;
      _isInvalidInput = true;
      return;
    }

    final number = int.parse(text);
    final squareRoot = sqrt(number);
    final cubeRoot = pow(number, 1 / 3);

    _isSquare = number == squareRoot.toInt() * squareRoot.toInt();
    _isCube = number == cubeRoot.toInt() * cubeRoot.toInt() * cubeRoot.toInt();
    _isInvalidInput = false;
  }

  void _showDialog() {
    String message;
    if (_isInvalidInput) {
      message = 'Please enter a valid integer number';
    } else if (_isSquare && _isCube) {
      message = 'The number is both a square and a cube';
    } else if (_isSquare) {
      message = 'The number is a square';
    } else if (_isCube) {
      message = 'The number is a cube';
    } else {
      message = 'The number is neither a square nor a cube';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Number Analysis'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decorationStyle: TextDecorationStyle.dashed,
                letterSpacing: 1,
                wordSpacing: 2,
                height: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            //text color
            style: const TextStyle(color: Colors.black),
            onChanged: _checkNumber,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
              //hint text color
              hintStyle: const TextStyle(color: Colors.black),
              //label text color
              labelStyle: const TextStyle(color: Colors.black),
              border: const OutlineInputBorder(),
              labelText: 'Enter a number',
              errorText: _isInvalidInput
                  ? 'Please enter a valid integer number'
                  : null,
            ),
          ),
        ),
        ElevatedButton(
            onPressed: _isInvalidInput ? null : _showDialog,
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            child: const Text('Check Number')),
      ],
    );
  }
}
