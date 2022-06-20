import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:food_order_ui/configuration/artcile.dart';
import 'package:food_order_ui/configuration/category.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'package:food_order_ui/configuration/food_list.dart';
import 'package:food_order_ui/view/cart_page/widgets/food_list_widget/delete_icon_button.dart';
import 'package:food_order_ui/view/cart_page/widgets/food_list_widget/food_text.dart';
import 'package:food_order_ui/view/cart_page/widgets/food_list_widget/food_image.dart';
import 'package:food_order_ui/view/food_detail_page/widgets/addtocart_button.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:lottie/lottie.dart';
import '../../../configuration/articleCart.dart';
import '../../../configuration/article_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodListWidget extends StatefulWidget {
  FoodListWidget({Key? key}) : super(key: key);
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodListWidget> {
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    var Cart = FlutterCart();

    super.initState();
    getlist();
  }

  getlist() async {
    // sharedPreferences = await SharedPreferences.getInstance();

    // var res = sharedPreferences.getString("ArticleCartList")!;
    // //print(res);
    // List<ArticleCart> ress = ArticleCart.decode(res);
    // for (var menu in ress) print(menu.image);
    //After successful login we will redirect to profile page. Let's create profile page now
    SharedPreferences schared = await SharedPreferences.getInstance();

    var ch = schared.getString('ingeredientsc');
    print(ch);
  }

  Future<List<ArticleCart>> bringTheCartArticle() async {
    var ArticleCartList = <ArticleCart>[];

    return ArticleCartList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! / 20),
      child: FutureBuilder<List<ArticleCart>>(
          future: bringTheCartArticle(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var articlesList = snapshot.data;
              var Cart = FlutterCart();

              return ListView.builder(
                  itemCount: Cart.getCartItemCount(),
                  itemBuilder: (context, index) {
                    // var article = articlesList[index];
                    print(Cart.cartItem[index].productDetails);
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.screenHeight! / 68.3),

                      /// 10.0
                      child: Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            DeleteIconButton(
                                foodName:
                                    Cart.cartItem[index].productName.toString(),
                                index: index);
                          });
                        },
                        background: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth! / 20.55),

                          /// 20.0
                          decoration: BoxDecoration(
                            color: Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [Spacer(), Icon(Icons.delete_outline)],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(4, 6),
                                  blurRadius: 4,
                                  color: Colors.black.withOpacity(0.1),
                                )
                              ]),
                          child: Row(
                            children: [
                              FoodImage(
                                  foodImage:
                                      "http://localhost:7999/photo/${Cart.cartItem[index].productDetails}"),
                              SizedBox(width: SizeConfig.screenWidth! / 20.55),

                              /// 20.0
                              FoodText(
                                foodId:
                                    Cart.cartItem[index].productId.toString(),
                                foodName:
                                    Cart.cartItem[index].productName.toString(),
                                foodPrice:
                                    Cart.cartItem[index].unitPrice.toString(),
                                quantite:
                                    Cart.cartItem[index].quantity.toString(),
                                // remarque:
                                //     Cart.cartItem[index].remarque.toString(),
                              ),
                              Spacer(),
                              DeleteIconButton(
                                  foodName: Cart.cartItem[index].productName
                                      .toString(),
                                  index: index),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return SizedBox(
                  child: Center(
                child: Lottie.network(
                    "https://assets10.lottiefiles.com/packages/lf20_peztuj79.json",
                    height: SizeConfig.screenHeight! / 6.83,

                    /// 100.0
                    width: SizeConfig.screenWidth! / 4.11,

                    /// 100.0
                    repeat: false),
              ));
            }
          }),
    );
  }
}
