import 'package:flutter/material.dart';
import 'package:food_order_ui/view/checkout_page/components/checkbox_save.dart';
import 'package:food_order_ui/view/checkout_page/components/checkout_textfield.dart';
import 'package:food_order_ui/view/checkout_page/components/page_name.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageName(text_name: "Nom"),
          CheckoutTextField(
            enter_text: "Entrer votre nom",
            size_width: 1.18,
          ),
          //350
          PageName(text_name: "Prenom"),
          CheckoutTextField(
            enter_text: "Entrer votre prenom",
            size_width: 1.18,
          ),
          PageName(text_name: "Telephone"),
          CheckoutTextField(
            enter_text: "Entrer votre numéro telephone",
            size_width: 1.18,
          ),
          PageName(text_name: "Adresse"),
          CheckoutTextField(
            enter_text: "Entrer votre adresse",
            size_width: 1.18,
          ),
          PageName(text_name: "Type"),
          CheckoutTextField(
            enter_text: "livraison ou sur place",
            size_width: 1.18,
          ),
        ],
      ),
    );
  }
}
