import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

List<Map<String, String>> mainSlideImageList = [
  {
    'image': "images/1.jpg",
    'url': "/",
  },
  {
    'image': "images/2.png",
    'url': "/",
  },
  {
    'image': "images/14741_16191_3712.jpg",
    'url': "/",
  },
  {
    'image': "images/210125_traditional_market_C1-2.png",
    'url': "/",
  },
];

enum subMenu {
  takeout, // 포장
  newPlace, // 신규 맛집
  one, // 1인분
  korean, // 한식
  chicken,
  bunsik, // 분식
  jokbo, // 족발/보쌈
  zzimNTang, // 찜탕
  pizza,
  japan, // 일식
  china, // 중식
}

final Map<subMenu, Map<dynamic, dynamic>> submenuMap = {
  subMenu.takeout: {
    'title': '포장',
    'image': '',
  },
  subMenu.newPlace: {
    'title': '신규 맛집',
  },
  subMenu.one: {
    'title': '1인분',
  },
  subMenu.korean: {
    'title': '한식',
  },
  subMenu.chicken: {
    'title': '치킨',
  },
  subMenu.bunsik: {
    'title': '분식',
    'image': 'images/bunsik.png',
  },
  subMenu.jokbo: {
    'title': '족발/보쌈',
  },
  subMenu.zzimNTang: {
    'title': '찜/탕',
  },
  subMenu.pizza: {
    'title': '피자',
  },
  subMenu.japan: {
    'title': '일식',
  },
  subMenu.china: {
    'title': '중식',
    'image': '',
  },
};

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
    return ListView(
      children: <Widget>[
        _buildTop(),
        _buildCenter(),
        _buildBottom(),
      ],
    );
  }
}

Widget _buildTop() {
  return Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 150.0,
              autoPlay: true,
              enableInfiniteScroll: true,
            ),
            items: mainSlideImageList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      // decoration: const BoxDecoration(),
                      child: ClipRect(
                        child: Image.asset(
                          i['image'].toString(),
                          fit: BoxFit.fitHeight,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ));
                },
              );
            }).toList(),
          ),
        ],
      ),
      Column(
        // mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: Co,
        children: [
/*          ListView(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: submenuMap.entries
                  .map((e) =>
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: GestureDetector(
                          child: ClipRect(
                            child: Image.asset(
                              e.value['image'] ?? "name",
                              // width: 50,
                              // height: 50,
                            ),
                          ),
                        ),
                    ))
                  .toList())*/
        ],
      )
    ],
  );
}

Widget _buildCenter() {
  return Column(
    children: [],
  );
}

Widget _buildBottom() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          '구팡(주) | 대표이사 : 김의진',
          style: TextStyle(fontSize: 12),
        ),
        Text(
          '사업자 등록번호 : 123-45-67890 | 통신판매업신고 : 2021-가가가가-1217',
          style: TextStyle(fontSize: 12),
        ),
        Text(
          '이메일 문의 : kpasd002@gmail.com',
          style: TextStyle(fontSize: 12),
        ),
        Text(
          '구팡은 통신판매중개자로서 통신판매의 당사자가 아니며, 판매자가 등록한 상품 정보, 상품의 품질 및 거래에 대해서 일체의 책임을 지지 않습니다.',
          style: TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
}
