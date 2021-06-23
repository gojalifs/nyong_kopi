import 'package:nyong_kopi/model/menu_model.dart';
import 'package:nyong_kopi/pages/detail_screen.dart';

class CartModel {
  final MenuModel menu;
  DetailScreen orderAmount;

  CartModel({required this.menu, required this.orderAmount});

//   void cartAmount(int orderAmount) {
//     this.orderAmount = orderAmount;
//   }
}

// var cart = CartModel(menu: menu, orderAmount: orderAmount)
Map<dynamic, int> price = {};

var cartList = <MenuModel>[];
var cartOrderAmount = DetailScreen.orderAmount;
// var orderAmount = CartModel(menu: MenuModel.menu).orderAmount;
// var orderAmount = DetailScreen().orderAmount;
