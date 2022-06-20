import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/articleCart.dart';
import 'package:food_order_ui/view/cart_page/widgets/bottom_bar.dart';
import 'package:food_order_ui/view/cart_page/widgets/food_list.dart';
import 'package:food_order_ui/view/lescategoriespages/pizzas.dart';
import 'package:food_order_ui/view/lescategoriespages/plats.dart';

import '../bottom_navigator.dart';
import '../food_detail_page/components/arrow_back.dart';

class PlatAfficheView extends StatefulWidget {
  const PlatAfficheView({Key? key}) : super(key: key);

  @override
  _PlatAfficheViewState createState() => _PlatAfficheViewState();
}

class _PlatAfficheViewState extends State<PlatAfficheView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "NOS PLATS",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(child: Stack(children: [Plats()]))

        //bottomNavigationBar: BottomBar(),
        );
  }
}
