import 'package:flutter/material.dart';

class BmiChecker extends StatefulWidget {
  const BmiChecker({Key? key}) : super(key: key);

  @override
  _BmiCheckerState createState() => _BmiCheckerState();
}

class _BmiCheckerState extends State<BmiChecker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("BMI Checker"), // 버튼 같은걸로 수정이 가능한가?
        backgroundColor: Colors.transparent,
        elevation: 0.0, // appBar 그림자 농도
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      extendBodyBehindAppBar: true, // body 위에 앱바 그리기
      body: Center(
        child: Text("sdfsdfsdfsdf"),
      ),
    );
  }
}
