import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../configuration/artcile.dart';
import '../../../configuration/client.dart';

class FavoriteDetail extends StatefulWidget {
  String id_com;
  String adresse;
  String date_com;
  String etat;
  String prix;
  String type;

  FavoriteDetail({
    required this.id_com,
    required this.adresse,
    required this.date_com,
    required this.etat,
    required this.type,
    required this.prix,
  });

  @override
  _FavoriteDetailState createState() => _FavoriteDetailState();
}

class _FavoriteDetailState extends State<FavoriteDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.date_com}",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: SizeConfig.screenHeight! / 34.15,

                    /// 20.0
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "${widget.type}",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: SizeConfig.screenHeight! / 34.15,

                    /// 20.0
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "${widget.etat}",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: SizeConfig.screenHeight! / 34.15,

                    /// 20.0
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight! / 136.6),

                /// 5.0
                child: Text(
                  "${widget.prix} DT",
                  style: TextStyle(
                      color: buttonColor,
                      fontSize: SizeConfig.screenHeight! / 40.95,

                      /// 18
                      fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.cancel_rounded),
                  onPressed: () {
                    annuler(widget.id_com);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Votre Commande a été annulée'),
                      ),
                    );
                  })
            ],
          ),
        )
      ],
    );
  }
}

annuler(String id) async {
  var url = "http://localhost:7999/commandes/modC/" + id;

  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}
