import 'dart:math';

import 'package:flutter/material.dart';

import 'detail.dart';

Positioned cardDemo(
    DecorationImage img,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context,
    Function dismissImg,
    int flag,
    Function addImg,
    Function swipeRight,
    Function swipeLeft) {
  final Size screenSize = MediaQuery.of(context).size;
  // print("Card");
  return Positioned(
    bottom: 100.0 + bottom,
    right: flag == 0
        ? right != 0.0
            ? right
            : null
        : null,
    left: flag == 1
        ? right != 0.0
            ? right
            : null
        : null,
    child: Dismissible(
      key: Key(Random().toString()),
      crossAxisEndOffset: -0.3,
      onResize: () {
        //print("here");
        // setState(() {
        //   var i = data.removeLast();

        //   data.insert(0, i);
        // });
      },
      onDismissed: (DismissDirection direction) {
//          _swipeAnimation();
        if (direction == DismissDirection.endToStart) {
          dismissImg(img);
        } else {
          addImg(img);
        }
      },
      child: Transform(
        alignment: flag == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
        //transform: null,
        transform: Matrix4.skewX(skew),
        //..rotateX(-math.pi / rotation),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(
              flag == 0 ? rotation / 360 : -rotation / 360),
          child: Hero(
            tag: 'img',
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     new MaterialPageRoute(
                //         builder: (context) => new DetailPage(type: img)));
                Navigator.of(context).push(PageRouteBuilder<dynamic>(
                  pageBuilder: (_, __, ___) => DetailPage(type: img),
                ));
              },
              child: Card(
                color: Colors.transparent,
                elevation: 4,
                child: Container(
                  alignment: Alignment.center,
                  width: screenSize.width / 1.2 + cardWidth,
                  height: screenSize.height / 1.7,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(121, 114, 173, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: screenSize.width / 1.2 + cardWidth,
                        height: screenSize.height / 2.2,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          image: img,
                        ),
                      ),
                      Container(
                          width: screenSize.width / 1.2 + cardWidth,
                          height:
                              screenSize.height / 1.7 - screenSize.height / 2.2,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              OutlinedButton(
                                  onPressed: () {
                                    swipeLeft();
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 130,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: const Text(
                                      "DON'T",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                              OutlinedButton(
                                  onPressed: () {
                                    swipeRight();
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 130,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: const Text(
                                      "I'M IN",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
