import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';

import '../../cart_view.dart';

class DeleteIconButton extends StatefulWidget {
  String foodName;
  int index;
  DeleteIconButton({required this.foodName, required this.index});

  @override
  _DeleteIconButtonState createState() => _DeleteIconButtonState();
}

class _DeleteIconButtonState extends State<DeleteIconButton> {
  var Cart = FlutterCart();
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Supprimer ${widget.foodName}?"),
              action: SnackBarAction(
                  label: "Oui",
                  onPressed: () {
                    Cart.deleteItemFromCart(widget.index);
                    // Navigator.push(context,
                    //   MaterialPageRoute(builder: (context) => CartView()));
                  }),
            ),
          );
        },
        icon: Icon(
          Icons.delete_outline,
          color: Colors.black54,
        ));
  }
}
