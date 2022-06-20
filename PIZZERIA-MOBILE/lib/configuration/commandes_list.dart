import 'dart:convert';
import 'package:food_order_ui/configuration/commande.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Commande>> bringTheCommandesClient() async {
  var commandes = <Commande>[];
  SharedPreferences shared = await SharedPreferences.getInstance();
  var id = shared.getInt("id")!.toString();

  final response =
      await http.get(Uri.parse('http://localhost:7999/commandeC/' + id));
  print(response.body.length);
  var data = await json.decode(response.body);
  final items = data.cast<Map<String, dynamic>>();
  print(items);
  commandes = items.map<Commande>((json) {
    return Commande.fromJson(json);
  }).toList();

  return commandes;
  //////
  ///
}
