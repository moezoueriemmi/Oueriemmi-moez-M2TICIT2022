import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
//import 'package:food_order_ui/view/profile_page/widgets/arrow_back.dart';
import 'package:food_order_ui/view/profile_page/widgets/commandes_page.dart';
import 'package:food_order_ui/view/profile_page/widgets/top_custom_shape.dart';
import 'package:food_order_ui/view/profile_page/widgets/user_sections.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../favorite_page/widgets/favorite_image.dart';
import '../login_page/login_page_view.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  late SharedPreferences shared;
  late String nom = "", prenom = "", tel = "";
  late int id;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    setState(() {
      id = shared.getInt("id")!;
      nom = shared.getString("nom")!;
      prenom = shared.getString("prenom")!;
      tel = shared.getString("tel")!;
      print(nom + prenom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          //elevation: 0,
          title: Text(
            "Profile : " + "${nom + ' ' + prenom}",
            //style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(children: [
          // crossAxisAlignment: CrossAxisAlignment.start,

          CommandesPageView(),
        ])

        //SizedBox(
        //  height: SizeConfig.screenHeight! / 34.15,
        //),

        /// 20.0
        // UserSection(
        //     icon_name: Icons.account_circle,
        //     section_text: "Mes Informations"),

        // UserSection(
        //     OnPressed: () {},
        //     icon_name: Icons.shopping_basket,
        //     section_text: "Mes Commandes"),
        // UserSection(
        //     OnPressed: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => LoginPage()));
        //     },
        //     icon_name: Icons.shopping_basket,
        //     section_text: "Logout")
        );
  }
}
