import 'dart:developer';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    log("home initState");
  }
  @override
  void dispose() {
    super.dispose();
    log("home dispose");
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildTop(),
          _buildCenter(),
          _buildBottom(),
        ],
      ),
    );
  }
}
  Widget _buildTop() {
    return Text("top");
  }
  Widget _buildCenter() {
    return Text("center");
  }
  Widget _buildBottom() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('구팡(주)|대표이사 : 김의진'),
        Text('사업자 등록번호 : 123-45-67890 | 통신판매업신고 : 2021-가가가가-1217'),
        Text('이메일 문의 : kpasd002@gmail.com'),
        Text('구팡은 통신판매중개자로서 통신판매의 당사자가 아니며, 판매자가 등록한 상품 정보, 상품의 품질 및 거래에 대해서 일체의 책임을 지지 않습니다.'),
      ],
    );
  }