import 'dart:math';

import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late AnimationController acontroller;
  late Animation degree = Tween(begin: 0.0, end: 2 * pi).animate(
    CurvedAnimation(
      parent: acontroller,
      curve: Curves.linear,
    ),
  );

  // late Animation dani = Tween(begin: 0.0, end: 10.0).animate(
  //   CurvedAnimation(
  //     parent: acontroller,
  //     curve: Curves.easeIn,
  //   ),
  // );

  @override
  void initState() {
    super.initState();
    acontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    acontroller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    List data = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedBuilder(
            animation: acontroller,
            builder: (context, child) {
              return Transform.rotate(
                angle: degree.value,
                child: Hero(
                  tag: "image${data[1]}",
                  child: Image.network("${data[0]["img"]}"),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Hero(
              tag: "name${data[1]}",
              child: Text(
                "${data[0]["name"]}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0,end: 1.0),
              duration: Duration(seconds: 2),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Text(
                    "${data[0]["des"]}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white60,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
