import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/artcile.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodDescription extends StatelessWidget {
  late String ingredientsClient;
  FoodDescription({Key? key}) : super(key: key);
  late SharedPreferences sharedPreferences;

  descripCart() async {
    SharedPreferences schared = await SharedPreferences.getInstance();

    schared.setString('ingeredientsc', ingredientsClient);
  }

  @override
  void initState() {
    descripCart();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight! / 45.54),

      /// 15.0
      child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Text(
              "",
              style: TextStyle(color: Colors.black38),
              textAlign: TextAlign.justify,
            ),
            TextFormField(
              onChanged: (value) {
                ingredientsClient = value;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Entrer Vos Ingredients',
              ),
            ),
          ])),
    );
  }
}
