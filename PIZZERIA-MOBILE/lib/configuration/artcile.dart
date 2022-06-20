class Article {
  String idart;
  String image;
  String nom;
  String ingredients;
  String categorie;
  String prix;

  Article(this.idart, this.image, this.nom, this.ingredients, this.categorie,
      this.prix);

  factory Article.fromJson(Map<String, dynamic> json) {
    return new Article(
        json["idart"].toString(),
        "http://localhost:7999/photo/" + json["image"],
        json["nom"],
        json["ingredients"].toString(),
        json["categorie"].toString(),
        json["prix"].toString());
  }
}
