import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'package:food_order_ui/view/food_detail_page/components/separator.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../configuration/artcile.dart';

class IncreaseDecrease extends StatefulWidget {
  Article article;
  IncreaseDecrease({required this.article});

  @override
  _IncreaseDecreaseState createState() => _IncreaseDecreaseState();
}

class _IncreaseDecreaseState extends State<IncreaseDecrease> {
  int _counter = 1;
  test() async {
    SharedPreferences schared = await SharedPreferences.getInstance();
    schared.setInt('counter', 1);
  }

  @override
  void initState() {
    super.initState();
    test();
  }

  Future<void> _increaseCart() async {
    SharedPreferences schared = await SharedPreferences.getInstance();

    setState(() {
      _counter++;
      schared.setInt('counter', _counter);
    });
  }

  Future<void> _decreaseCart() async {
    SharedPreferences schared = await SharedPreferences.getInstance();

    setState(() {
      if (_counter > 1) {
        _counter--;
        schared.setInt('counter', _counter);
      } else {
        _counter = 1;
        schared.setInt('counter', _counter);
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight! / 45.54),

      /// 15.0
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.screenHeight! / 68.3,
                bottom: SizeConfig.screenHeight! / 34.15),

            /// 10.0 - 20.0
            child: MySeparator(
              color: Colors.grey,
            ),
          ),
          Text(
            "Total",
            style: TextStyle(
                color: Colors.black54,
                fontSize: SizeConfig.screenHeight! / 42.69),
          ),

          /// 16
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${int.parse(widget.article.prix) * _counter} DT",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.screenHeight! / 27.32),
                  )

                  /// 25
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _decreaseCart();
                      },
                      child: Container(
                        height: SizeConfig.screenHeight! / 13.94,

                        /// 49.0
                        width: SizeConfig.screenWidth! / 8.39,

                        /// 49.0
                        decoration: BoxDecoration(
                          border: Border.all(color: buttonColor, width: 1),
                          borderRadius: BorderRadius.circular(15),
                          color: textColor.withOpacity(0.1),
                          //borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Icon(Icons.remove, color: buttonColor),
                        ),
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth! / 6.85,

                      /// 60.0
                      height: SizeConfig.screenHeight! / 13.94,

                      /// 49.0
                      child: Center(
                        child: Text(
                          "${_counter}",
                          style: TextStyle(
                              fontSize: SizeConfig.screenHeight! / 37.95,
                              fontWeight: FontWeight.bold),
                        ),

                        /// 18
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _increaseCart();
                      },
                      child: Container(
                        height: SizeConfig.screenHeight! / 13.94,

                        /// 49.0
                        width: SizeConfig.screenWidth! / 8.39,

                        /// 49.0
                        decoration: BoxDecoration(
                          border: Border.all(color: buttonColor, width: 1),
                          borderRadius: BorderRadius.circular(15),
                          color: textColor.withOpacity(0.4),
                        ),
                        child: Center(
                          child: Icon(Icons.add, color: buttonColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
