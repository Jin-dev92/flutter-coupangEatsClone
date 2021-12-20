import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key); // 무슨 코드인지 확인 해 볼 것.
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.eleven_mp),
          title: Text("ㅇㄹㅇㄹ"),
        ),
        ListTile(
          leading: Icon(Icons.eleven_mp),
          title: Text("ㅇㄹㅇㄹ"),
        ),
        ListTile(
          leading: Icon(Icons.eleven_mp),
          title: Text("ㅇㄹㅇㄹ"),
        ),
      ],
    );
  }
}
