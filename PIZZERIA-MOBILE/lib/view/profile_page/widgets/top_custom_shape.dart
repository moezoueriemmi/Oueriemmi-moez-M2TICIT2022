import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/profile_page/components/CustomShape.dart';

class TopCustomShape extends StatefulWidget {
  String nom, prenom;
  TopCustomShape({Key? key, required this.nom, required this.prenom})
      : super(key: key);

  @override
  _TopCustomShapeState createState() => _TopCustomShapeState();
}

class _TopCustomShapeState extends State<TopCustomShape> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! / 2.84,

      /// 240.0
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.nom + " " + widget.prenom,
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! / 136.6,
                ),

                /// 5.0
              ],
            ),
          )
        ],
      ),
    );
  }
}
