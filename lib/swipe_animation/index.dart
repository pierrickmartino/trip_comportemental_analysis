import 'dart:async';

//import 'package:animation_exp/PageReveal/page_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'active_card.dart';
import 'data.dart';
import 'dummy_card.dart';

class CardDemo extends StatefulWidget {
  @override
  CardDemoState createState() => CardDemoState();
}

class CardDemoState extends State<CardDemo> with TickerProviderStateMixin {
  AnimationController _buttonController;
  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  int flag = 0;

  List<dynamic> data = imageData;
  List<dynamic> selectedData = [];

  @override
  void initState() {
    super.initState();

    _buttonController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    rotate = Tween<double>(
      begin: -0,
      end: -40,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          final i = data.removeLast();
          data.insert(0, i);

          _buttonController.reset();
        }
      });
    });

    right = Tween<double>(
      begin: 0,
      end: 400,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    bottom = Tween<double>(
      begin: 15,
      end: 100,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    width = Tween<double>(
      begin: 20,
      end: 25,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  Future<Null> _swipeAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }

  void dismissImg(DecorationImage img) {
    setState(() {
      data.remove(img);
    });
  }

  void addImg(DecorationImage img) {
    setState(() {
      data.remove(img);
      selectedData.add(img);
    });
  }

  void swipeRight() {
    if (flag == 0) {
      setState(() {
        flag = 1;
      });
    }
    _swipeAnimation();
  }

  void swipeLeft() {
    if (flag == 1) {
      setState(() {
        flag = 0;
      });
    }
    _swipeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;

    const double initialBottom = 15;
    final dataLength = data.length;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    double backCardWidth = -10;
    return Container(
      color: const Color.fromRGBO(106, 94, 175, 1),
      alignment: Alignment.center,
      child: dataLength > 0
          ? Stack(
              alignment: AlignmentDirectional.center,
              children: data.map((item) {
                if (data.indexOf(item) == dataLength - 1) {
                  return cardDemo(
                      item,
                      bottom.value,
                      right.value,
                      0,
                      backCardWidth + 10,
                      rotate.value,
                      rotate.value < -10 ? 0.1 : 0.0,
                      context,
                      dismissImg,
                      flag,
                      addImg,
                      swipeRight,
                      swipeLeft);
                } else {
                  backCardPosition = backCardPosition - 10;
                  backCardWidth = backCardWidth + 10;

                  return cardDemoDummy(item, backCardPosition, 0, 0,
                      backCardWidth, 0, 0, context);
                }
              }).toList())
          : const Text('No Event Left',
              style: TextStyle(color: Colors.white, fontSize: 50)),
    );
  }
}
