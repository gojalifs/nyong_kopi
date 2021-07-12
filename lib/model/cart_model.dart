import 'package:nyong_kopi/model/menu_model.dart';
import 'package:nyong_kopi/pages/detail_screen.dart';

class CartModel {
  final MenuModel menu;
  DetailScreen orderAmount;

  CartModel({required this.menu, required this.orderAmount});
}

Map<dynamic, int> itemQuantity = {};
Map<dynamic, int> itemPrice = {};

var cartList = <MenuModel>[];

List<int> priceList = [];

var cartOrderAmount = DetailScreen.orderAmount;
