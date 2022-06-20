import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

import '../../bottom_navigator.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        height: SizeConfig.screenHeight! / 19.51,
        width: SizeConfig.screenWidth! / 10.28,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 193, 184, 184).withOpacity(0.25),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: IconButton(
          onPressed: () async {
            // Add what you want to do on tap

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ));
  }
}
