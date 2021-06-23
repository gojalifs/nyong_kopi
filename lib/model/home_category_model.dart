class HotMenu {
  String name;
  final assetImage;

  HotMenu({required this.name, required this.assetImage});
}

var hotMenuList = [
  HotMenu(name: "Blended Beverages", assetImage: 'icons/coffee.png'),
  HotMenu(name: 'Brewed Coffee', assetImage: 'icons/coffee_maker.png'),
  HotMenu(name: 'Espresso Beverages', assetImage: 'icons/food_beverage.png'),
  HotMenu(name: 'Other', assetImage: 'icons/local_cafe.png'),
];
