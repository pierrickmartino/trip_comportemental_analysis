import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'data.dart';
import 'styles.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key, this.type}) : super(key: key);

  final DecorationImage type;

  @override
  _DetailPageState createState() => _DetailPageState(type: type);
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  _DetailPageState({this.type});

  AnimationController _containerController;
  Animation<double> width;
  Animation<double> heigth;
  DecorationImage type;
  List<dynamic> data = imageData;
  final double _appBarHeight = 256;
  final AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  void initState() {
    _containerController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
    width = Tween<double>(
      begin: 200,
      end: 220,
    ).animate(
      CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    heigth = Tween<double>(
      begin: 400,
      end: 400,
    ).animate(
      CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    heigth.addListener(() {
      setState(() {
        if (heigth.isCompleted) {}
      });
    });
    _containerController.forward();
  }

  @override
  void dispose() {
    _containerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.7;
    final int img = data.indexOf(type);
    //print("detail");
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color.fromRGBO(106, 94, 175, 1),
        platform: Theme.of(context).platform,
      ),
      child: Container(
        width: width.value,
        height: heigth.value,
        color: const Color.fromRGBO(106, 94, 175, 1),
        child: Hero(
          tag: 'img',
          child: Card(
            color: Colors.transparent,
            child: Container(
              alignment: Alignment.center,
              width: width.value,
              height: heigth.value,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        elevation: 0,
                        forceElevated: true,
                        leading: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.cyan,
                            size: 30,
                          ),
                        ),
                        expandedHeight: _appBarHeight,
                        pinned: _appBarBehavior == AppBarBehavior.pinned,
                        floating: _appBarBehavior == AppBarBehavior.floating ||
                            _appBarBehavior == AppBarBehavior.snapping,
                        snap: _appBarBehavior == AppBarBehavior.snapping,
                        flexibleSpace: FlexibleSpaceBar(
                          title: const Text('Party'),
                          background: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Container(
                                width: width.value,
                                height: _appBarHeight,
                                decoration: BoxDecoration(
                                  image: data[img],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(<Widget>[
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(35),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.black12))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: const <Widget>[
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.cyan,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text('10:00  AM'),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: const <Widget>[
                                            Icon(
                                              Icons.map,
                                              color: Colors.cyan,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text('15 MILES'),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 16, bottom: 8),
                                    child: Text(
                                      'ABOUT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Text(
                                      "It's party, party, party like a nigga just got out of jail Flyin' in my 'Rari like a bat that just flew outta hell I'm from the east of ATL, but ballin' in the Cali hills Lil mama booty boomin', that bitch movin' and she standin' still I know these bitches choosin' me, but I got 80 on me still. host for the purposes of socializing, conversation, recreation, or as part of a festival or other commemoration of a special occasion. A party will typically feature food and beverages, and often music and dancing or other forms of entertainment.  "),
                                  Container(
                                    margin: const EdgeInsets.only(top: 25),
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 10),
                                    height: 120,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.black12))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Text(
                                          'ATTENDEES',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            CircleAvatar(
                                                backgroundImage: avatar1),
                                            CircleAvatar(
                                              backgroundImage: avatar2,
                                            ),
                                            CircleAvatar(
                                              backgroundImage: avatar3,
                                            ),
                                            CircleAvatar(
                                              backgroundImage: avatar4,
                                            ),
                                            CircleAvatar(
                                              backgroundImage: avatar5,
                                            ),
                                            CircleAvatar(
                                              backgroundImage: avatar6,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  Container(
                      width: 600,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(121, 114, 173, 1),
                      ),
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
        ),
      ),
    );
  }
}
