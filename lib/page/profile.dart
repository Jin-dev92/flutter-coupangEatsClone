import 'dart:developer';
import 'dart:math';

import 'package:coupangeats_clone/component/bmiChecker.dart';
import 'package:coupangeats_clone/page/home.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> listViewItemList = [
  {
    'icon': Icon(Icons.eleven_mp),
    'title': "BMI 측정기",
    'page': const BmiChecker(),
  },
  {
    'icon': Icon(Icons.eleven_mp),
    'title': "스톱워치",
  },
  {
    'icon': Icon(Icons.eleven_mp),
    'title': "ToDo List",
  },
];

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Route _createRoute() {
      // @todo 나중에 애니메이션끼리 묶기
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            listViewItemList[_currentIndex]['page'],
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween), // tween 을 이용한 애니메이션 변환
            child: child,
          );
        },
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: listViewItemList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          style: ListTileStyle.list,
          leading: listViewItemList[index]['icon'],
          title: Text(listViewItemList[index]['title']),
          onTap: () {
            setState(() {
              _currentIndex = index;
            });

            Navigator.of(context).push(_createRoute());
            // showModalBottomSheet(context: context, builder: buildBottomSheet);
            print("index:$index");
            // print(listViewItemList[index]['icon']);
          },
        );
      },
    );
  }
}
