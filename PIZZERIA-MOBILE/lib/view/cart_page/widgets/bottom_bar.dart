import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:food_order_ui/view/cart_page/widgets/bottom_bar_widget/3d_secure.dart';
import 'package:food_order_ui/view/cart_page/widgets/bottom_bar_widget/bottombar_text.dart';
import 'package:food_order_ui/view/cart_page/widgets/bottom_bar_widget/checkout_button.dart';
import 'package:food_order_ui/view/food_detail_page/components/separator.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var Cart = FlutterCart();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.screenHeight! / 15.0,
        horizontal: SizeConfig.screenHeight! / 30.0,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(bottom: SizeConfig.screenHeight! / 85.37),

              /// 8.0
              child: MySeparator(
                color: Colors.grey,
              ),
            ),
            ThreeDSecure(),
            SizedBox(
              height: SizeConfig.screenHeight! / 45.54,
            ),

            /// 15.0
            BottomBarText(
                title_text: "Subtotal",
                price_text: (Cart.getTotalAmount().toString()) + " DT",
                font_size: SizeConfig.screenHeight! / 45.54,
                fontWeight: FontWeight.w400,
                text_color: Colors.black54),

            /// 15
            SizedBox(
              height: SizeConfig.screenHeight! / 45.54,
            ),
            BottomBarText(
              title_text: "Remise",
              price_text: "0 DT",
              font_size: SizeConfig.screenHeight! / 45.54,
              fontWeight: FontWeight.w400,
              text_color: Colors.black54,
            ),
            SizedBox(
              height: SizeConfig.screenHeight! / 45.54,
            ),
            BottomBarText(
              title_text: "Total",
              price_text: Cart.getTotalAmount().toString() + " DT",
              font_size: SizeConfig.screenHeight! / 37.95,
              fontWeight: FontWeight.bold,
              text_color: Colors.black,
            ),

            /// 18
            SizedBox(height: SizeConfig.screenHeight! / 34.15),

            /// 20.0
            CheckoutButton(),
          ],
        ),
      ),
    );
  }
}
