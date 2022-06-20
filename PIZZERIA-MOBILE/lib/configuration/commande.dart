import 'package:food_order_ui/configuration/artcile.dart';
import 'package:food_order_ui/configuration/client.dart';
import 'package:intl/intl.dart';

class Commande {
  int id_com;
  String adresse;
  String date_com;
  String etat;
  int prix;
  String type;
  Client client;

  Commande(this.id_com, this.adresse, this.date_com, this.etat, this.prix,
      this.type, this.client);

  factory Commande.fromJson(Map<String, dynamic> json) {
    return new Commande(
      json["id_com"],
      json["adresse"],
      json["date_com"],
      json["etat"],
      json["prix"],
      json["type"],
      Client.fromJson(json["client"]),
    );
  }
}
