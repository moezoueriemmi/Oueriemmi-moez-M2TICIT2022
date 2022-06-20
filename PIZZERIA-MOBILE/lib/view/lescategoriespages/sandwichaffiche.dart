import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/articleCart.dart';
import 'package:food_order_ui/view/cart_page/widgets/bottom_bar.dart';
import 'package:food_order_ui/view/cart_page/widgets/food_list.dart';
import 'package:food_order_ui/view/lescategoriespages/pizzas.dart';
import 'package:food_order_ui/view/lescategoriespages/sandwichs.dart';

import '../food_detail_page/components/arrow_back.dart';

class SandwichAfficheView extends StatefulWidget {
  const SandwichAfficheView({Key? key}) : super(key: key);

  @override
  _SandwichAfficheViewState createState() => _SandwichAfficheViewState();
}

class _SandwichAfficheViewState extends State<SandwichAfficheView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "NOS SANDWICHS",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(child: Stack(children: [Sandwichs()]))

        //bottomNavigationBar: BottomBar(),
        );
  }
}
