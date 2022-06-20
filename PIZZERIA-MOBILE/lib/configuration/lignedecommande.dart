import 'package:food_order_ui/configuration/artcile.dart';
import 'package:food_order_ui/configuration/client.dart';
import 'package:food_order_ui/configuration/commande.dart';
import 'package:intl/intl.dart';

class Lignedecommande {
  int id;
  String remarque;
  String qte;
  Article article;
  Commande commande;

  Lignedecommande(
      this.id, this.remarque, this.qte, this.article, this.commande);

  factory Lignedecommande.fromJson(Map<String, dynamic> json) {
    return new Lignedecommande(
      json["id"],
      json["remarque"],
      json["qte"],
      Article.fromJson(json["article"]),
      Commande.fromJson(json["commande"]),
    );
  }
}
