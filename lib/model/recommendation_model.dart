import 'package:nyong_kopi/model/menu_model.dart';

class RecommendationBeverages {
  String name, assetImage, price;

  RecommendationBeverages(
      {required this.name, required this.assetImage, required this.price});
}



var recommended = recom.asMap();
var recommendedMenu = recommended.values.toList();
