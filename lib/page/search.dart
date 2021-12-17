import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key); // 무슨 코드인지 확인 해 볼 것.
  // Search({@required xxx}) xxx는 필수값!

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("검색"),
    );
  }
}