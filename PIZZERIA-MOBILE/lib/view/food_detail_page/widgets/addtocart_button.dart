import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../configuration/artcile.dart';

class AddToCartButton extends StatelessWidget {
  var cart = FlutterCart();
  Article article;
  String? remarque;

  AddToCartButton({Key? key, required this.article, required this.remarque})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth! / 20.55,
        SizeConfig.screenHeight! / 34.15,
        SizeConfig.screenWidth! / 20.55,
        0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(
                SizeConfig.screenWidth! / 1.37,
                SizeConfig.screenHeight! / 11.66)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () async {
            SharedPreferences schared = await SharedPreferences.getInstance();

            cart.addToCart(
                productId: article.idart,
                productName: article.nom,
                unitPrice: int.parse(article.prix),
                productDetailsObject: article.idart,
                quantity: schared.getInt('counter')!,
                remarque: remarque.toString());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Article Ajouter'),
              ),
            );
          },
          child: Wrap(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(right: SizeConfig.screenWidth! / 51.38),

                /// 8.0
                child: Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.white,
                ),
              ),
              Text(
                "Ajouter au Panier",
                style: TextStyle(
                  fontSize: SizeConfig.screenHeight! / 34.15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
