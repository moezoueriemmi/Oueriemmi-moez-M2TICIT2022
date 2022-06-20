import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/articleCart.dart';
import 'package:food_order_ui/view/cart_page/widgets/bottom_bar.dart';
import 'package:food_order_ui/view/cart_page/widgets/food_list.dart';
import 'package:food_order_ui/view/lescategoriespages/boissons.dart';
import 'package:food_order_ui/view/lescategoriespages/pizzas.dart';

import '../food_detail_page/components/arrow_back.dart';

class BoissonAfficheView extends StatefulWidget {
  const BoissonAfficheView({Key? key}) : super(key: key);

  @override
  _BoissonAfficheViewState createState() => _BoissonAfficheViewState();
}

class _BoissonAfficheViewState extends State<BoissonAfficheView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "NOS BOISSONS",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(child: Stack(children: [Boissons()]))

        //bottomNavigationBar: BottomBar(),
        );
  }
}
