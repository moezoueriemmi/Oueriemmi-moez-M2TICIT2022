import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/category.dart';
import 'package:food_order_ui/configuration/article_list.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/lescategoriespages/pizzaaffiche.dart';
//import 'package:food_order_ui/view/lescategoriespages/pizzas.dart';

import '../../lescategoriespages/boissonaffiche.dart';
import '../../lescategoriespages/crepeaffiche.dart';
import '../../lescategoriespages/plataffiche.dart';
import '../../lescategoriespages/sandwichaffiche.dart';

class CategoriesArticle extends StatefulWidget {
  const CategoriesArticle({Key? key}) : super(key: key);

  @override
  _CategoriesFoodState createState() => _CategoriesFoodState();
}

class _CategoriesFoodState extends State<CategoriesArticle> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: bringTheCategory(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var categoryList = snapshot.data;
          return SizedBox(
            height: SizeConfig.screenHeight! / 8.04,

            /// 85.0
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList!.length,
              itemBuilder: (context, indeks) {
                var category = categoryList[indeks];

                return Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        send("${category.categoryName}");
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                          SizeConfig.screenWidth! / 34.25,

                          /// 12.0
                          SizeConfig.screenHeight! / 170.75,

                          /// 4.0
                          SizeConfig.screenWidth! / 20.55,

                          /// 20.0
                          SizeConfig.screenHeight! / 170.75,

                          /// 4.0
                        ),
                        height: SizeConfig.screenHeight! / 15.18,

                        /// 45.0
                        width: SizeConfig.screenWidth! / 9.14,

                        /// 45.0
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("${category.categoryImage}"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Row(children: [
                      Text(
                        category.categoryName,
                        style: TextStyle(
                            fontSize: SizeConfig.screenHeight! / 52.54,
                            color: Colors.black45),
                      )

                      /// 13
                    ]),
                  ],
                );
              },
            ),
          );
        } else {
          return Center();
        }
      },
    );
  }

  void send(String s) {
    if (s == "Pizza") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PizzaAfficheView()));
    } else if (s == "Plat") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PlatAfficheView()));
    } else if (s == "Crepes") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CrepeAfficheView()));
    } else if (s == "Sandwich") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SandwichAfficheView()));
    } else if (s == "Boissons") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BoissonAfficheView()));
    }
  }
}
