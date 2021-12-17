import 'dart:developer';
import 'package:flutter/material.dart';
/*
*   pages
* */
import 'package:coupangeats_clone/page/favorite.dart';
import 'package:coupangeats_clone/page/home.dart';
import 'package:coupangeats_clone/page/orderHistory.dart';
import 'package:coupangeats_clone/page/profile.dart';
import 'package:coupangeats_clone/page/search.dart';

void main() {
  runApp(const MyApp());
}

const buttonNavigatorList = <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈",),
  BottomNavigationBarItem(icon: Icon(Icons.search), label: "검색",),
  BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "즐겨찾기",),
  BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "주문 내역",),
  BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "My 이츠",),
];
const pages = [
  Home(),
  Search(),
  Favorite(),
  OrderHistory(),
  Profile(),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // log('key:$key')
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '쿠팡이츠 클론 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: '쿠팡이츠 클론 앱'),
/*      routes: {
        '/search': (context) => const Search(),

      },*/
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    log("MyHomePage initState");
    // 복잡한 로직이나 네트워크 요청은 여기서 수행하여야함.
  }

  @override
  void dispose() {
    super.dispose();
    log("MyHomePage dispose");
  }

  void _iconBtnOnPressHandler() {
    log("NavigatorPush to Search");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Search()));
    // final result = await Navigator.pushNamed(context, "/search"); url을 통한 라우팅 방식
  }

  @override
  Widget build(BuildContext context) {
    log("MyHomepage build");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _iconBtnOnPressHandler,
            iconSize: 24,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: buttonNavigatorList,
        currentIndex: _currentIndex,
        onTap: (idx) => {
          setState(() => _currentIndex = idx),
        },
      ),
    );
  }
}
