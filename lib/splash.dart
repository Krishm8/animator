import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
        void initState() {
      super.initState();
      Future.delayed(
        Duration(seconds: 3),
            () {
          return Navigator.pushReplacementNamed(context, "home");
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.network(
            "https://images.pexels.com/photos/1257860/pexels-photo-1257860.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 550),
                  duration: Duration(seconds: 4),
                  builder: (context, value, child) {
                    return Image.asset(
                      "assets/1.png",
                      fit: BoxFit.cover,
                      width: value,
                    );
                  },
                ),
                Text(
                  "GALAXY",
                  style: TextStyle(
                    fontSize: 50,
                    letterSpacing: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, 0.6),
            child: Text(
              "Let's explore the universe",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
