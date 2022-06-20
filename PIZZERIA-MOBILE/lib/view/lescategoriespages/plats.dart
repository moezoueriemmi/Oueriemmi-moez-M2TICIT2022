import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/artcile.dart';
import 'package:food_order_ui/configuration/articlePizza_list.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'package:food_order_ui/configuration/food_list.dart';
import 'package:food_order_ui/view/food_detail_page/food_detail_view.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

import '../../configuration/articlePlat_list.dart';

class Plats extends StatefulWidget {
  const Plats({Key? key}) : super(key: key);

  @override
  _PlatsState createState() => _PlatsState();
}

class _PlatsState extends State<Plats> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: bringTheArticlesPlat(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var articleList = snapshot.data;
          return SizedBox(
            height: SizeConfig.screenHeight! / 2.28,

            /// 300.0

            child: ListView.builder(
              padding: const EdgeInsets.all(50.0),
              scrollDirection: Axis.vertical,
              itemCount: articleList!.length,
              itemBuilder: (context, index) {
                var article = articleList[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FoodDetailView(article: article)));
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            SizeConfig.screenWidth! / 30.25,

                            /// 12.0
                            SizeConfig.screenHeight! / 110.84,

                            /// 6.0
                            SizeConfig.screenWidth! / 30.25,

                            /// 12.0
                            SizeConfig.screenHeight! / 30.77

                            /// 30.0
                            ),
                        height: SizeConfig.screenHeight! / 2.8,

                        /// 220.0
                        width: SizeConfig.screenWidth! / 1.74,

                        /// 150.0
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 6,
                                color: Colors.black.withOpacity(0.3),
                              )
                            ]),

                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: SizeConfig.screenHeight! / 9,

                                  /// 100.0
                                  width: SizeConfig.screenWidth! / 1.5,

                                  /// 150.0
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "http://localhost:7999/photo/${article.idart}"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(28.0),
                                        topRight: Radius.circular(28.0)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${article.nom}",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: SizeConfig.screenHeight! /
                                                34.15,

                                            /// 20
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "Ingredients:${article.ingredients}",
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: SizeConfig.screenHeight! /
                                                40.69,

                                            /// 16
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: SizeConfig.screenHeight! /
                                                130.6),

                                        /// 5.0
                                        child: Text(
                                          "${article.prix}\DT",
                                          style: TextStyle(
                                              color: buttonColor,
                                              fontSize:
                                                  SizeConfig.screenHeight! /
                                                      39.95,

                                              /// 18
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: SizeConfig.screenHeight! / 12.66,

                                /// 50.0
                                width: SizeConfig.screenWidth! / 8.22,

                                /// 50.0
                                decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(30.0),
                                    )),
                                child: Icon(
                                  Icons.shopping_cart_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
}
