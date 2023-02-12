import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangeScreen extends StatefulWidget {
  const ChangeScreen({Key? key}) : super(key: key);

  @override
  _ChangeScreenState createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        // 현재 페이지 가져오기
        int? nextPage = pageController.page?.toInt();

        if(nextPage == null) { // 현재 페이지 값 없을 때 예외처리
          return;
        }

        if(nextPage == 4) { // 첫 페이지와 마지막 페이지 분기 처리
          nextPage = 0;
        } else {
          nextPage++;
        }
        pageController.animateToPage( // 페이지 변경
            nextPage,
            duration: const Duration(microseconds: 500),
            curve: Curves.linear
        );

      });

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
        body: PageView(
          controller: pageController,
          children: [1, 2, 3, 4, 5].map((e) => Image.asset('asset/img/image_$e.jpeg', fit: BoxFit.cover,)).toList(),
        )
    );
  }
}
