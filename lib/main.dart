import 'package:animator/detail.dart';
import 'package:animator/home.dart';
import 'package:animator/splash.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MyApp(),
  );
}




class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/":(context)=>SplashPage(),
        "home":(context)=>HomePage(),
        "detail":(context)=>DetailPage(),
      },
    );
  }
}
