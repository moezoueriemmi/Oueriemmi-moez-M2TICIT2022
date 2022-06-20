import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_order_ui/view/cart_page/cart_view.dart';
import 'package:food_order_ui/view/favorite_page/favorite_page_view.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/home_page/home_page_view.dart';
import 'package:food_order_ui/view/profile_page/profile_page_view.dart';
import 'package:food_order_ui/view/profile_page/widgets/commandes_page.dart';
import 'package:food_order_ui/view/register_page/register_page_view.dart';
import 'package:food_order_ui/view/search_page/search_page_view.dart';

import 'contact_pagecopy/contact_page_view.dart';
import 'login_page/login_page_view.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screen = [
    HomePageView(),
    SearchPageView(),
    CartView(),
    ContactPageView(),
    LoginPage(),
    ProfilePageView(),
    //CommandesPageView(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(Icons.home, size: SizeConfig.screenHeight! / 20.00),

      /// 30.0
      Icon(Icons.search, size: SizeConfig.screenHeight! / 20.00),
      Icon(Icons.shopping_cart, size: SizeConfig.screenHeight! / 20.00),
      //Icon(Icons.favorite, size: SizeConfig.screenHeight! / 20.00),
      Icon(Icons.message, size: SizeConfig.screenHeight! / 20.00),
      Icon(Icons.person, size: SizeConfig.screenHeight! / 20.00),
    ];
    Size size = MediaQuery.of(context).size;
    return Container(
      color: buttonColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          body: screen[index],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: IconThemeData(color: Colors.white)),
            child: CurvedNavigationBar(
              key: navigationKey,
              color: Colors.black45,
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: buttonColor,
              height: SizeConfig.screenHeight! / 11.39,

              /// 60.0
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 400),
              index: index,
              items: items,
              onTap: (index) => setState(() => this.index = index),
            ),
          ),
        ),
      ),
    );
  }
}
