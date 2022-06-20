import 'package:flutter/material.dart';

import '../../contact_pagecopy/widgets/text_field.dart';
import '../../contact_pagecopy/widgets/text_field_input.dart';

class ContactTextField extends StatefulWidget {
  var nometprenom, email, telc, message;
  ContactTextField(
      {Key? key,
      required String this.nometprenom,
      required String this.email,
      required String this.telc,
      required String this.message})
      : super(key: key);

  @override
  _ContactTextFieldState createState() => _ContactTextFieldState();
}

class _ContactTextFieldState extends State<ContactTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          TextFieldInput(
            text: "Nom et Prenom ",
            iconName: Icons.account_circle,
            ltext: "Nom et Prenom",
            onChanged: (value) {
              widget.nometprenom = value;
            },
          ),
          TextFieldInput(
            text: "email",
            iconName: Icons.mail,
            ltext: "Email",
            onChanged: (value) {
              widget.email = value;
            },
          ),
          TextFieldInput(
            text: "Telephone",
            iconName: Icons.phone,
            ltext: "Telephone",
            onChanged: (value) {
              widget.telc = value;
            },
          ),
          TextFieldInput(
            text: "Message",
            iconName: Icons.message,
            ltext: "Message",
            onChanged: (value) {
              widget.message = value;
            },
          ),
        ]));
  }
}
