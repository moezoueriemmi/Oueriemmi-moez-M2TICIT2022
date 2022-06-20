import 'dart:convert';
import 'package:food_order_ui/configuration/artcile.dart';
import 'package:food_order_ui/configuration/category.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> bringTheArticles() async {
  var articleList = <Article>[];
  var articlePizza = <Article>[];
  var articleBoisson = <Article>[];
  var articleSandwich = <Article>[];
  var articleCrepe = <Article>[];
  var articlePlat = <Article>[];

  final response = await http.get(Uri.parse('http://localhost:7999/articles'));
  print(response.body.length);
  var data = await json.decode(response.body);
  final items = data.cast<Map<String, dynamic>>();

  articleList = items.map<Article>((json) {
    return Article.fromJson(json);
  }).toList();

  print(response.body);

  for (var article in articleList) {
    if (article.categorie == "PIZZA") {
      articlePizza.add(article);
    } else if (article.categorie == "CREPE") {
      articleCrepe.add(article);
    } else if (article.categorie == "PLAT") {
      articlePlat.add(article);
    } else if (article.categorie == "SANDWICH") {
      articleSandwich.add(article);
    } else if (article.categorie == "BOISSON") {
      articleBoisson.add(article);
    }
  }
  return articleList;
}

Future<List<Category>> bringTheCategory() async {
  var categoryList = <Category>[];

  var c1 = Category(
      categoryId: 1, categoryName: "Plat", categoryImage: "category/plat.png");
  var c2 = Category(
      categoryId: 2,
      categoryName: "Sandwich",
      categoryImage: "/category/sandwich.png");
  var c3 = Category(
      categoryId: 3,
      categoryName: "Pizza",
      categoryImage: "/category/pizza.png");
  var c4 = Category(
      categoryId: 4,
      categoryName: "Boissons",
      categoryImage: "/category/boisson.png");
  var c5 = Category(
      categoryId: 5,
      categoryName: "Crepes",
      categoryImage: "/category/crepe.png");

  categoryList.add(c1);
  categoryList.add(c2);
  categoryList.add(c3);
  categoryList.add(c4);
  categoryList.add(c5);

  return categoryList;
}
