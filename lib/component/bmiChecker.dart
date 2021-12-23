import 'package:flutter/material.dart';

class BmiChecker extends StatefulWidget {
  const BmiChecker({Key? key}) : super(key: key);

  @override
  _BmiCheckerState createState() => _BmiCheckerState();
}

class _BmiCheckerState extends State<BmiChecker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Bmi 체커"),
      ),
    );
  }
}
