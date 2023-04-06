import 'package:flutter/material.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Verify'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Column(
        children: const [
          Center(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Welcome to Number Verify',
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
            ),
          ),
          NumberVerifyWidget(),
        ],
      ),
    );
  }
}
