import 'package:nyong_kopi/model/menu_model.dart';

class RecommendationBeverages {
  String name, assetImage, price;

  RecommendationBeverages(
      {required this.name, required this.assetImage, required this.price});
}

var recommendations = [
  basicBeveragesList[1],
  basicBeveragesList[3],
  basicBeveragesList[4],
  basicBeveragesList[6],
  wholeBeanList[1],
  freshFoodList[2],
  freshFoodList[5],
  merchList[2],
];

var recommended = recommendations.asMap();
var recommendedMenu = recommended.values.toList();
