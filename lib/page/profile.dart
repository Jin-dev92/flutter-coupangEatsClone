import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

final List<Map<String, dynamic>> listViewItemList = [
  {
    'icon': Icon(Icons.eleven_mp),
    'title': "BMI 측정기",
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

  Widget buildBottomSheet (BuildContext context) {
    Widget component;
    switch (_currentIndex) {
      case 0:
        component = Text("sdfsdfldksfjlkj");
        break;
      default:
        component = Text("컴포넌트가없습니다");
        break;
    }
    return Center(
      child: component,
    );
  }

  @override
  Widget build(BuildContext context) {
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
            showModalBottomSheet(context: context, builder: buildBottomSheet);
            print("index:$index");
            // print(listViewItemList[index]['icon']);
          },
        );
      },
    );
  }
}
