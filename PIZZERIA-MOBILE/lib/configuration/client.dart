class Client {
  int id_client;
  String nom;
  String prenom;
  String tel;

  Client(this.id_client, this.nom, this.prenom, this.tel);

  factory Client.fromJson(Map<String, dynamic> json) {
    return new Client(
        json["id_client"], json["nom"], json["prenom"], json["tel"]);
  }
}
