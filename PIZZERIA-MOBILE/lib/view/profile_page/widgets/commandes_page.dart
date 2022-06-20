import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/artcile.dart';
import 'package:food_order_ui/configuration/commande.dart';
import 'package:food_order_ui/view/bottom_navigator.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/login_page/login_page_view.dart';
import 'package:food_order_ui/view/profile_page/widgets/detail_commande.dart';
import 'package:food_order_ui/view/profile_page/widgets/top_custom_shape.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../configuration/commandes_list.dart';

class CommandesPageView extends StatefulWidget {
  const CommandesPageView({Key? key}) : super(key: key);

  @override
  _CommandesPageViewState createState() => _CommandesPageViewState();
}

class _CommandesPageViewState extends State<CommandesPageView> {
  late SharedPreferences shared;
  late String nom = "", prenom = "", tel = "";
  late int id;
  void initState() {
    super.initState();

    bringTheCommandesClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Mes Commandes",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            // Add what you want to do on tap

            shared = await SharedPreferences.getInstance();

            if (shared.getInt("id") != null) {
              shared.clear();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            }
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! / 8.0,
            vertical: SizeConfig.screenHeight! / 120.6),

        /// 20.0 - 5.0
        child: FutureBuilder<List<Commande>>(
            future: bringTheCommandesClient(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var commandeList = snapshot.data;
                return GridView.builder(
                    itemCount: commandeList!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      childAspectRatio: 3.2 / 4,
                    ),
                    itemBuilder: (context, index) {
                      var commande = commandeList[index];
                      return Stack(
                        children: [
                          TopCustomShape(nom: nom, prenom: prenom),
                          Container(
                              height: SizeConfig.screenHeight! / 2.10,

                              /// 220.0
                              width: SizeConfig.screenWidth! / 1.06,

                              /// 200.0
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                      color: Colors.black.withOpacity(0.1),
                                    )
                                  ]),
                              child: Stack(
                                children: [
                                  FavoriteDetail(
                                      id_com: commande.id_com.toString(),
                                      adresse: commande.adresse,
                                      date_com: commande.date_com
                                          .toString()
                                          .substring(0, 10),
                                      etat: commande.etat,
                                      type: commande.type,
                                      prix: commande.prix.toString())

                                  //FavoriteCartIcon(),
                                  // FavoriteIcon(),
                                ],
                              )),
                        ],
                      );
                    });
              } else {
                return Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.screenHeight! / 2.10),

                  /// 200.0
                  child: Column(
                    children: [
                      Center(
                          child: Icon(
                        Icons.shopping_cart,
                        color: Colors.black12,
                        size: SizeConfig.screenHeight! / 11.39,
                      )),

                      /// 60.0
                      SizedBox(
                        height: SizeConfig.screenHeight! / 34.15,
                      ),

                      /// 20.0
                      Center(
                          child: Text(
                        "VOS Commandes",
                        style: TextStyle(
                            color: Colors.black12,
                            fontSize: SizeConfig.screenHeight! / 34.15),
                      ))

                      /// 20.0
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
