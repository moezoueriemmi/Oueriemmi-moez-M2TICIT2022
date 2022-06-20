import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/articleCart.dart';
import 'package:food_order_ui/view/cart_page/widgets/bottom_bar.dart';
import 'package:food_order_ui/view/cart_page/widgets/food_list.dart';
import 'package:food_order_ui/view/lescategoriespages/crepes.dart';
import 'package:food_order_ui/view/lescategoriespages/pizzas.dart';

import '../food_detail_page/components/arrow_back.dart';

class CrepeAfficheView extends StatefulWidget {
  const CrepeAfficheView({Key? key}) : super(key: key);

  @override
  _CrepeAfficheViewState createState() => _CrepeAfficheViewState();
}

class _CrepeAfficheViewState extends State<CrepeAfficheView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "NOS CREPES",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(child: Stack(children: [Crepes()]))

        //bottomNavigationBar: BottomBar(),
        );
  }
}
