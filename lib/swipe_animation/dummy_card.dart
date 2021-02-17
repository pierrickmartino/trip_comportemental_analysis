import 'package:flutter/material.dart';

Positioned cardDemoDummy(
    DecorationImage img,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context) {
  final Size screenSize = MediaQuery.of(context).size;
  // Size screenSize=(500,200);
  // print("dummyCard");
  return Positioned(
    bottom: 100 + bottom,
    // right: flag == 0 ? right != 0 ? right : null : null,
    //left: flag == 1 ? right != 0 ? right : null : null,
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
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                image: img,
              ),
            ),
            Container(
                width: screenSize.width / 1.2 + cardWidth,
                height: screenSize.height / 1.7 - screenSize.height / 2.2,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    OutlinedButton(
                        onPressed: () {},
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
                        onPressed: () {},
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
  );
}
