import 'dart:convert';

class ArticleCart {
  String idart;
  String image;
  String nom;
  String remarque;
  String categorie;
  String quantite;
  String prix;

  ArticleCart(this.idart, this.image, this.nom, this.remarque, this.categorie,
      this.quantite, this.prix);

  factory ArticleCart.fromJson(Map<String, dynamic> json) {
    return new ArticleCart(
        json["idart"].toString(),
        "http://localhost:7999/photo/" + json["image"],
        json["nom"],
        json["remarque"].toString(),
        json["categorie"].toString(),
        json["quantite"].toString(),
        json["prix"].toString());
  }
  static Map<String, dynamic> toMap(ArticleCart articleCart) => {
        'id': articleCart.idart,
        'image': articleCart.image,
        'nom': articleCart.nom,
        'remarque': articleCart.remarque,
        'categorie': articleCart.categorie,
        'quantite': articleCart.quantite,
        'prix': articleCart.prix,
      };

  static String encode(List<ArticleCart> articlesc) => json.encode(
        articlesc
            .map<Map<String, dynamic>>((article) => ArticleCart.toMap(article))
            .toList(),
      );
  static List<ArticleCart> decode(String articlesc) =>
      (json.decode(articlesc) as List<dynamic>)
          .map<ArticleCart>((item) => ArticleCart.fromJson(item))
          .toList();
}
