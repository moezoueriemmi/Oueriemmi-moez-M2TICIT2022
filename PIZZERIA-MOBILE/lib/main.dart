import 'package:flutter/material.dart';
import 'package:food_order_ui/view/splash_screen.dart';

import 'view/home_page/home_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Royal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: StartPageView(),
      //home: HomePageView(),
      home: SplashScreen(),
    );
  }
}
