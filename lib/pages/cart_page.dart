import 'package:flutter/material.dart';
import 'package:nyong_kopi/model/menu_model.dart';

class CartPage extends StatefulWidget {
  final MenuModel name, image;
  final int orderAmount;

  // CartPage();

  CartPage.hai({required this.name, required this.image, required this.orderAmount}); // CartPage(
  //     {required this.name, required this.orderAmount, required this.image});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String aa = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () {setState(() {
          aa = widget.name.toString();
        });}, icon: Icon(Icons.add_circle_outline)),
        Text(aa),
      ],
    );
  }
}
