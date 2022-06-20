import 'dart:convert';
import 'package:food_order_ui/configuration/artcile.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> bringTheArticlesSandwich() async {
  var articleSandwich = <Article>[];

  final response =
      await http.get(Uri.parse('http://localhost:7999/articlessa'));
  print(response.body.length);
  var data = await json.decode(response.body);
  final items = data.cast<Map<String, dynamic>>();

  articleSandwich = items.map<Article>((json) {
    return Article.fromJson(json);
  }).toList();

  print(response.body);

  return articleSandwich;
}
