import 'dart:convert';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:food_order_ui/configuration/artcile.dart';
import 'package:food_order_ui/view/contact_pagecopy/contact_page_view.dart';
//import 'package:food_order_ui/view/checkout_page/widgets/address.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/success_page/success_page_view.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../configuration/client.dart';
import '../login_page/login_page_view.dart';
import 'components/checkout_textfield.dart';
import 'components/page_name.dart';

class CheckoutPageView extends StatefulWidget {
  const CheckoutPageView({Key? key}) : super(key: key);

  @override
  _CheckoutPageViewState createState() => _CheckoutPageViewState();
}

class _CheckoutPageViewState extends State<CheckoutPageView> {
  int currentStep = 0;
  bool isCompleted = false;
  var Cart = FlutterCart();
  String? Nom, Prenom, Tel, Adresse, Type;
  final _formKey2 = GlobalKey<FormState>();

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text(
            "Client",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: Address(),
        ),
        // Step(
        //   state: currentStep > 1 ? StepState.complete : StepState.indexed,
        //   isActive: currentStep >= 1,
        //   title: Text(
        //     "Complete",
        //     style: TextStyle(
        //       fontSize: 18,
        //     ),
        //   ),
        //   content: Payment(),
        // ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Commande",
            style: TextStyle(
                color: buttonColor, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        body: isCompleted
            ? CheckCart()
            : Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(primary: buttonColor)),
                child: Stepper(
                  type: StepperType.vertical,
                  steps: getSteps(),
                  currentStep: currentStep,
                  onStepContinue: () {
                    final isLastStep = currentStep == getSteps().length - 1;
                    if (isLastStep) {
                      setState(() => isCompleted = true);
                      if (_formKey2.currentState!.validate()) {
                        envoyer(Nom!, Prenom!, Tel!, Adresse!, Type!);
                        
                        /// send data to server
                      } else {
                        /// code
                      }
                      setState(() => currentStep += 1);
                    }
                  },
                  onStepTapped: (step) => setState(() => currentStep = step),
                  onStepCancel: currentStep == 0
                      ? null
                      : () {
                          setState(() => currentStep -= 1);
                        },
                  controlsBuilder:
                      (BuildContext context, ControlsDetails controls) {
                    final isLastStep = currentStep == getSteps().length - 1;
                    return Container(
                      margin:
                          EdgeInsets.only(top: SizeConfig.screenHeight! / 68.3),

                      /// 10.0
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: controls.onStepContinue,
                              child: Container(
                                height: SizeConfig.screenHeight! / 13.66,

                                /// 50.0
                                decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Center(
                                  child: Text(
                                    isLastStep ? "Confirmer" : "Suivant",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            SizeConfig.screenHeight! / 37.95,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! / 34.25,
                          ),

                          /// 12.0
                          if (currentStep != 0)
                            Expanded(
                              child: InkWell(
                                onTap: controls.onStepCancel,
                                child: Container(
                                  height: SizeConfig.screenHeight! / 13.66,

                                  /// 50.0
                                  decoration: BoxDecoration(
                                      color: buttonColor,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Center(
                                    child: Text(
                                      "Précédent",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.screenHeight! / 37.95,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                  /// 18
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                )));
  }

  Address() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageName(text_name: "Nom"),
          // CheckoutTextField(
          //   enter_text: "Entrer votre nom",
          //   size_width: 1.18,
          // ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.screenWidth! / 41.1,

                /// 10.0
                0,
                SizeConfig.screenWidth! / 82.2,

                /// 5.0
                SizeConfig.screenHeight! / 85.37

                /// 8.0
                ),
            child: Container(
              width: SizeConfig.screenWidth! / 1.18,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: TextField(
                onChanged: (value) {
                  Nom = value;
                },
                style: TextStyle(color: textColor),
                cursorColor: textColor,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(width: 1, color: Colors.transparent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Entrer Votre Nom",
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
          ),
          //350

          PageName(text_name: "Prenom"),
          Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.screenWidth! / 41.1,

                /// 10.0
                0,
                SizeConfig.screenWidth! / 82.2,

                /// 5.0
                SizeConfig.screenHeight! / 85.37

                /// 8.0
                ),
            child: Container(
              width: SizeConfig.screenWidth! / 1.18,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: TextField(
                onChanged: (value) {
                  Prenom = value;
                },
                style: TextStyle(color: textColor),
                cursorColor: textColor,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(width: 1, color: Colors.transparent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Entrer Votre Prenom",
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
          ),
          PageName(text_name: "Telephone"),
          Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.screenWidth! / 41.1,

                /// 10.0
                0,
                SizeConfig.screenWidth! / 82.2,

                /// 5.0
                SizeConfig.screenHeight! / 85.37

                /// 8.0
                ),
            child: Container(
              width: SizeConfig.screenWidth! / 1.18,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Form(
                key: _formKey2,
                child: TextFormField(
                  onChanged: (value) {
                    Tel = value;
                  },
                  validator: (value) => validateTelephone(value),
                  style: TextStyle(color: textColor),
                  cursorColor: textColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide:
                          BorderSide(width: 1, color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "Entrer Votre Telephone",
                    hintStyle: TextStyle(color: Colors.black26),
                  ),
                ),
              ),
            ),
          ),
          PageName(text_name: "Adresse"),
          Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.screenWidth! / 41.1,

                /// 10.0
                0,
                SizeConfig.screenWidth! / 82.2,

                /// 5.0
                SizeConfig.screenHeight! / 85.37

                /// 8.0
                ),
            child: Container(
              width: SizeConfig.screenWidth! / 1.18,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: TextField(
                onChanged: (value) {
                  Adresse = value;
                },
                style: TextStyle(color: textColor),
                cursorColor: textColor,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(width: 1, color: Colors.transparent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Entrer Votre Adresse",
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
          ),
          PageName(text_name: "Type de Commande"),
          Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.screenWidth! / 41.1,

                /// 10.0
                0,
                SizeConfig.screenWidth! / 82.2,

                /// 5.0
                SizeConfig.screenHeight! / 85.37

                /// 8.0
                ),
            child: Container(
              width: SizeConfig.screenWidth! / 1.18,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: TextField(
                onChanged: (value) {
                  Type = value;
                },
                style: TextStyle(color: textColor),
                cursorColor: textColor,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(width: 1, color: Colors.transparent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "LIVRAISON ou SUR PLACE ou EMPORTER",
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String? validateTelephone(String? value) {
    String pattern = "([0-9]{8})";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Entrer un numéro de telephone  valide ';
    else
      return null;
  }

  getCurrentDate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    return (formatted); // something like 2013-04-20
  }

  void envoyer(String nom, String prenom, String tel, String adresse,
      String? type) async {
    var url = "http://localhost:7999/clients/add";
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, dynamic>{
        'nom': nom,
        'prenom': prenom,
        'tel': tel,
      }),
    );
    var res = json.decode(response.body);

    var cl = json.encode(<String, dynamic>{
      'id_client': res['id_client'],
      'nom': res['nom'],
      'prenom': res['prenom'],
      'tel': res['tel'],
    });

    int prix = Cart.getTotalAmount();
    String remarque = '';
    List<dynamic> lis = [];
    for (final c in Cart.cartItem) {
      final resp = await http
          .get(Uri.parse('http://localhost:7999/articlee/' + c.productId));
      var data = await json.decode(resp.body);
      var art = {
        'idart': data['idart'],
        'image': data['image'],
        'nom': data['nom'],
        'ingredients': data['ingredients'],
        'prix': data['prix'],
        'categorie': data['categorie'],
        'qte': c.quantity
      };

      remarque = (c.remarque);
      lis.add(art);
    }

    var urll = "http://localhost:7999/commande/add";
    final respo = await http.post(
      Uri.parse(urll),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, dynamic>{
        'adresse': adresse,
        'date_com': getCurrentDate(),
        'etat': "pas encore",
        'prix': prix,
        'type': type,
        'client': {
          'id_client': res['id_client'],
          'nom': res['nom'],
          'prenom': res['prenom'],
          'tel': res['tel'],
        },
      }),
    );
    var resc = json.decode(respo.body);
    var commande = {
      'id_com': resc['id_com'],
      'date_com': resc['date_com'],
      'etat': resc['etat'],
      'prix': resc['prix'],
      'type': resc['type'],
      'adresse': resc['adresse'],
      'client': {
        'id_client': res['id_client'],
        'nom': res['nom'],
        'prenom': res['prenom'],
        'tel': res['tel'],
      },
    };
    print(commande);
    var i = 0;
    for (var l in lis) {
      var urlll = "http://localhost:7999/lignecommande/add";
      final respl = await http.post(
        Uri.parse(urlll),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode(<String, dynamic>{
          'remarque': Cart.cartItem[i].remarque,
          'qte': l['qte'].toString(),
          'article': {
            'idart': l['idart'],
            'image': l['image'],
            'nom': l['nom'],
            'ingredients': l['ingredients'],
            'prix': l['prix'],
            'categorie': l['categorie']
          },
          'commande': commande
        }),
      );
      i = i + 1;
    }

    var urllll = "http://localhost:7999/recette/somme";
    final responsee = await http.post(
      Uri.parse(urllll),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_com': resc['id_com'],
        'date_com': resc['date_com'],
        'etat': resc['etat'],
        'prix': resc['prix'],
        'type': resc['type'],
      }),
    );
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
