import 'package:flutter/material.dart';
import 'package:food_order_ui/view/login_page/widgets/text_field.dart';
import 'widgets/next_button.dart';
import 'widgets/logo.dart';

class AcceuilPageView extends StatefulWidget {
  const AcceuilPageView({Key? key}) : super(key: key);

  @override
  _AcceuilPageViewState createState() => _AcceuilPageViewState();
}

class _AcceuilPageViewState extends State<AcceuilPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                LogoImage(),
                NextButonColor(),
              ],
            ),
          ),
        ));
  }
}
