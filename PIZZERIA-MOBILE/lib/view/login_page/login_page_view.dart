import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../configuration/client.dart';
import '../food_detail_page/components/arrow_back.dart';
import '../profile_page/profile_page_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var password, login;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromRGBO(255, 149, 5, 1),
          Color.fromRGBO(255, 149, 5, 1),
          Color.fromRGBO(255, 149, 5, 1)
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ArrowBack(),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Pour Consulter Votre Commande  ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 249, 249, 249),
                        fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bienvenue",
                    style: TextStyle(
                        color: Color.fromARGB(255, 249, 247, 247),
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  onChanged: (value) {
                                    login = value;
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.account_circle),
                                      hintText: "Prenom",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  obscureText: true,
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      hintText: "Numéro Telephone",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromRGBO(255, 149, 5, 1)),
                          child: Center(
                            child: IconButton(
                                icon: new Icon(Icons.arrow_forward),
                                color: Color.fromARGB(255, 246, 246, 246),
                                onPressed: () async {
                                  signIn(login, password);
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void signIn(String login, String password) async {
    final response = await http.get(
        Uri.parse('http://localhost:7999/client/' + login + '/' + password));

    var res = json.decode(response.body);

    if (response.body.length != 51) {
      Client clientdata = Client.fromJson(res);
      print(clientdata);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt("id", clientdata.id_client);
      prefs.setString("nom", clientdata.nom);
      prefs.setString("prenom", clientdata.prenom);
      prefs.setString("tel", clientdata.tel);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ProfilePageView()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
