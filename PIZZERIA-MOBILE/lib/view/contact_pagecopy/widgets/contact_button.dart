import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/login_page/login_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../contact_page_view.dart';

class ContactButton extends StatefulWidget {
  const ContactButton({Key? key}) : super(key: key);

  @override
  _ContactButtonState createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth! / 20.55,
          SizeConfig.screenHeight! / 17.075,
          SizeConfig.screenWidth! / 20.55,
          SizeConfig.screenHeight! / 45.54),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.0, 1.0],
            colors: [
              buttonColor,
              lightColor,
            ],
          ),
          borderRadius: BorderRadius.circular(30),
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
                SizeConfig.screenHeight! / 13.66)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () async {
            //envoyer(nometprenom, email, telc, message);
          },
          child: Text(
            "Envoyer",
            style: TextStyle(
              fontSize: SizeConfig.screenHeight! / 42.68,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),

            /// 16
          ),
        ),
      ),
    );
  }

  // envoyer(String nometprenom, String email, String telc, String message) async {
  //   var url = "http://localhost:7999/contact/add";
  //   final response = await http.post(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'nom_prenom': nometprenom,
  //       'telc': telc,
  //       'email': email,
  //       'message': message,
  //     }),
  //   );
  //   print(response.body);
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   var parse = jsonDecode(response.body);

  //   print(parse);
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => ContactPageView()));
  // }
}
