import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/artcile.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'package:food_order_ui/view/food_detail_page/widgets/detail_widget.dart';
import 'package:food_order_ui/view/food_detail_page/widgets/food_image.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class FoodDetailView extends StatefulWidget {
  Article article;
  FoodDetailView({required this.article});

  @override
  _FoodDetailViewState createState() => _FoodDetailViewState();
}

class _FoodDetailViewState extends State<FoodDetailView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            FoodImage(article: widget.article),
            DetailWidget(
              article: widget.article,
            ),
          ],
        ),
      ),
    );
  }
}
