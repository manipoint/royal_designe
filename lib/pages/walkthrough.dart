import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'auth/auth.dart';

class Walkthrough extends StatelessWidget {
  Walkthrough({Key? key}) : super(key: key);

  final List pageInfos = [
    {
      "title": "Royal Designe",
      "body": "Our designers create most unique desigen "
          " so your personlty ipmects uniquly "
          "",
      "img": "assets/on1.png",
    },
    {
      "title": "Fast Delivery",
      "body": "Royal designe take care of fast delivery",
      "img": "assets/on2.png",
    },
    {
      "title": "Easy Payment",
      "body": "Payment are cash on dilivery you can open parsal before pay",
      "img": "assets/on3.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages = [
      for (int i = 0; i < pageInfos.length; i++)
        _buildPageModel(context, pageInfos[i])
    ];

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IntroductionScreen(
            pages: pages,
            onDone: () {
              Get.to(AuthenticationScreen());
            },
            onSkip: () {
             Get.to(AuthenticationScreen());
            },
            showSkipButton: true,
            skip: const Text("Skip"),
            next: Text(
              "Next",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                // ignore: deprecated_member_use
                color: Theme.of(context).accentColor,
              ),
            ),
            done: Text(
              "Done",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                // ignore: deprecated_member_use
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildPageModel(BuildContext context, Map item) {
    return PageViewModel(
      title: item['title'],
      body: item['body'],
      image: Image.asset(
        item['img'],
        height: 185.0,
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          // ignore: deprecated_member_use
          color: Theme.of(context).accentColor,
        ),
        bodyTextStyle: const TextStyle(fontSize: 15.0),
        pageColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
