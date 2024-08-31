import 'dart:math';

import 'package:flutter/material.dart';
import 'package:animator/util.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animationcontroller;
  late Animation degree = Tween(begin: 0.0, end: 2 * pi).animate(
    CurvedAnimation(
      parent: animationcontroller,
      curve: Curves.linear,
    ),
  );

  @override
  void initState() {
    super.initState();
    animationcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    animationcontroller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.network(
                  fit: BoxFit.cover,
                  "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1500w,f_auto,q_auto:best/newscms/2018_02/1868086/ss-170117-men-walked-moon-aldrin-mn-03.jpg",
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Journey",
                    style: TextStyle(
                      fontSize: 60,
                      fontFamily: "f1",
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "to the Moon",
                    style: TextStyle(
                      fontSize: 60,
                      // fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontFamily: "f1",
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Other ",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "directions",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allplanets.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "detail",
                              arguments: [allplanets[index], index]);
                        },
                        child: Container(
                          margin: (index == 8)
                              ? EdgeInsets.only(
                                  top: 10, bottom: 10, right: 20, left: 20)
                              : EdgeInsets.only(left: 20, top: 10, bottom: 10),
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AnimatedBuilder(
                                animation: animationcontroller,
                                builder: (context, child) {
                                  return Transform.rotate(
                                    angle: degree.value,
                                    child: Hero(
                                      tag: "image$index",
                                      child: Image.network(
                                          allplanets[index]["img"]),
                                    ),
                                  );
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Hero(
                                    tag: "name$index",
                                    child: Text(
                                      "${allplanets[index]["name"]}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
