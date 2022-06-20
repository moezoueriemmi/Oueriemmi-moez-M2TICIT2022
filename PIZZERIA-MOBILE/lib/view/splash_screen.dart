import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_order_ui/view/login_page/login_page_view.dart';
import 'package:food_order_ui/view/pageAcceuil/Acceuil_page_view.dart';
import 'package:food_order_ui/view/start_page/start_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../configuration/articleCart.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  listCartAriclesEmpty() async {
    // var ArticleCartList = <ArticleCart>[];
    // var ar = ArticleCart(
    //     "1", "tacos.png", "tacos", "remarque", "categorie", "4", "13");
    // ArticleCartList.add(ar);
    // String s = ArticleCart.encode(ArticleCartList);
    // sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences.setString("ArticleCartList", s);

    SharedPreferences schared = await SharedPreferences.getInstance();
    schared.setString('url', 'http://127.0.0.1:8000/api');
  }

  @override
  void initState() {
    listCartAriclesEmpty();
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AcceuilPageView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/main/splashscreen.gif"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
