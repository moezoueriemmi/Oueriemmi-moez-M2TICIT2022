import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/home_page_view.dart';
import 'package:food_order_ui/view/register_page/widgets/background_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_page/login_page_view.dart';
import 'widgets/contact_button.dart';
import 'widgets/text_field.dart';
import 'package:http/http.dart' as http;

class ContactPageView extends StatefulWidget {
  ContactPageView({Key? key}) : super(key: key);

  @override
  _ContactPageViewState createState() => _ContactPageViewState();
}

class _ContactPageViewState extends State<ContactPageView> {
  var nometprenom, email, telc, message;

  final nometprenomct = TextEditingController();
  final emailct = TextEditingController();
  final telct = TextEditingController();
  final messagect = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
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
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Contactez nous",
                    style: TextStyle(
                        color: Color.fromARGB(255, 247, 246, 246),
                        fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bienvenue",
                    style: TextStyle(
                        color: Color.fromARGB(255, 248, 248, 248),
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
                                child: Form(
                                  key: _formKey2,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      nometprenom = value;
                                    },
                                    validator: (value) =>
                                        validateNometPrenom(value),
                                    controller: nometprenomct,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.account_circle),
                                        hintText: "Entrer votre Nom&&Prenom",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: Form(
                                  key: _formKey,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      email = value;
                                    },
                                    validator: (value) => validateEmail(value),
                                    controller: emailct,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email),
                                        hintText: "Entrer votre Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: Form(
                                  key: _formKey1,
                                  child: TextFormField(
                                    validator: (value) =>
                                        validateTelephone(value),
                                    onChanged: (value) {
                                      telc = value;
                                    },
                                    controller: telct,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.phone_android),
                                        hintText: "Entrer votre Telephone",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: Form(
                                  key: _formKey3,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      message = value;
                                    },
                                    validator: (value) =>
                                        validateMessage(value),
                                    controller: messagect,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.edit),
                                        hintText: "Entrer votre Message",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
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
                                color: Color(0xFFF2F1F1),
                                onPressed: () async {
                                  if (_formKey2.currentState!.validate() &&
                                      _formKey.currentState!.validate() &&
                                      _formKey1.currentState!.validate() &&
                                      _formKey3.currentState!.validate()) {
                                    envoyer(email, message, nometprenom, telc);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('Message envoyer'),
                                      ),
                                    );
                                  }
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 50,
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

  envoyer(String email, String message, String nometprenom, String telc) async {
    var url = "http://localhost:7999/contact/add";
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'message': message,
        'nom_prenom': nometprenom,
        'telc': telc,
      }),
    );
    print(response.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var parse = jsonDecode(response.body);

    print(parse);
    messagect.clear();
    nometprenomct.clear();
    telct.clear();
    emailct.clear();
    // Navigator.pushReplacement(context,
    // MaterialPageRoute(builder: (BuildContext context) => super.widget));
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Entrer une adresse email valide';
    else
      return null;
  }

  String? validateNometPrenom(String? value) {
    String pattern = "[a-zA-Z]";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Entrer nom et prenom valide ';
    else
      return null;
  }

  String? validateMessage(String? value) {
    String pattern = "[a-zA-Z0-9?]";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Contenu invalide ';
    else
      return null;
  }

  String? validateTelephone(String? value) {
    String pattern = "([0-9]{8})";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Entrer un numéro de telephone  valide ';
    else
      return null;
  }
}
