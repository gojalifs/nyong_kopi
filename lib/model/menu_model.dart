class MenuModel {
  String assetsImage, menuName, description;
  double rating;
  int price, stock;

  MenuModel(
      {required this.assetsImage,
      required this.menuName,
      required this.price,
      required this.description,
      required this.rating,
      // required this.orderAmount,
      required this.stock});
}

var categoryList = [
  MenuModel(
      assetsImage: 'images/beverages.png',
      menuName: 'Beverages',
      price: 0,
      rating: 4,
      stock: 0,
      description: ''),
  MenuModel(
      assetsImage: 'images/food.png',
      menuName: "Fresh Food",
      price: 0,
      rating: 5,
      stock: 0,
      description: ''),
  MenuModel(
      assetsImage: 'images/whole_bean.png',
      menuName: 'Whole Bean',
      price: 0,
      rating: 4,
      stock: 0,
      description: ''),
  MenuModel(
      assetsImage: 'images/merch.png',
      menuName: 'Merchandise',
      price: 0,
      rating: 4.5,
      stock: 0,
      description: ''),
];
var basicBeveragesList = [
  MenuModel(
    assetsImage: 'images/caramelmacchiato.png',
    menuName: 'Caramel Macchiato',
    price: 57000,
    description:
        'Espresso combined with vanilla-flavoured syrup, milk and caramel sauce over ice. Chilled for a classic summer’s day.'
        'To our signature espresso we add a creamy mix of vanilla syrup and'
        'cold milk poured over ice; it’s then topped with our proprietary buttery caramel sauce. Sweet! ',
    rating: 4.5,
    stock: 10,
  ),
  MenuModel(
    assetsImage: 'images/caffeamericano.png',
    menuName: 'Caffe Americano',
    price: 34000,
    description: 'HOT: Rich, full-bodied espresso with hot water.',
    rating: 4,
    stock: 9,
  ),
  MenuModel(
    assetsImage: 'images/cappuccino.png',
    menuName: 'Cappuccino',
    price: 44000,
    description:
        'Espresso with steamed milk, topped with a deep layer of foam.',
    rating: 4.5,
    stock: 15,
  ),
  MenuModel(
    assetsImage: 'images/caffe_latte.png',
    menuName: 'Caffe Latte',
    price: 44000,
    description:
        'Rich, full-bodied espresso in steamed milk, lightly topped with foam.'
        'A caffè latte is simply a shot or two of bold, tasty espresso with fresh, sweet steamed milk over it.',
    rating: 5,
    stock: 13,
  ),
  MenuModel(
    assetsImage: 'images/cafe_mocha.png',
    menuName: 'Cafe Mocha',
    price: 53000,
    description:
        'Espresso with bittersweet mocha sauce and steamed milk, topped with sweetened whipped cream. Delightful.',
    rating: 4,
    stock: 7,
  ),
  MenuModel(
    assetsImage: 'images/espressomacchiato.png',
    menuName: 'Espresso Macchiato',
    price: 40000,
    description:
        'Sometimes a touch is just enough. And so it is with the slight dab'
        ' of foam we set atop our signature espresso in this classic European-style beverage.',
    rating: 4.5,
    stock: 5,
  ),
  MenuModel(
    assetsImage: 'images/asian_dolce_latte.png',
    menuName: 'Asian Dolce Latte',
    price: 53000,
    description: 'Double-shots of the premium,'
        ' dark-roasted Starbucks Espresso Roast, combine with the uniquely developed dolce sauce.',
    rating: 4,
    stock: 1,
  ),
  MenuModel(
    assetsImage: 'images/espresso_frappuccino.png',
    menuName: 'Espresso Frappuccino',
    price: 48000,
    description: 'Coffee is combined with a shot of espresso and milk, '
        'then blended with ice to give you a nice little jolt and lots of sipping joy.',
    rating: 4.5,
    stock: 4,
  ),
  MenuModel(
    assetsImage: 'images/caramel_frappuccino.png',
    menuName: "Caramel Frappuccino",
    price: 48000,
    description:
        'Buttery caramel syrup meets coffee, milk and ice for a rendezvous '
        'in the blender. Then whipped cream and caramel sauce layer the love on top.',
    rating: 4.5,
    stock: 3,
  ),
  MenuModel(
    assetsImage: 'images/caramel_java_chip_frappuccino.png',
    menuName: 'Caramel Java Chip Frappuccino',
    price: 48000,
    description: 'Java Chip Frappuccino® with a swirl of caramel sauce on top.',
    rating: 4,
    stock: 7,
  ),
  MenuModel(
    assetsImage: 'images/mocha_frappuccino.png',
    menuName: 'Mocha Frappuccino',
    price: 48000,
    description:
        'Mocha sauce, Frappuccino® roast coffee, milk and ice all come '
        'together for a mocha flavor that\'ll leave you wanting more.',
    rating: 4.5,
    stock: 9,
  ),
  MenuModel(
    assetsImage: 'images/coffee_frappuccino.png',
    menuName: 'Coffee Frappuccino',
    price: 39000,
    description:
        'nyong\'s® coffee is blended with nonfat milk and ice for a sip on the light side.',
    rating: 5,
    stock: 6,
  ),
];

var freshFoodList = [
  MenuModel(
      assetsImage: 'images/butter_croissant.jpg',
      menuName: 'Butter Croissant',
      price: 17000,
      rating: 4,
      stock: 10,
      description: 'A melt-in-your-mouth delight for any time of the day.'),
  MenuModel(
      assetsImage: 'images/almond_croissant.jpg',
      menuName: 'Almond Croissant',
      price: 37000,
      description:
          "Rich, almond flan enveloped in a croissant, then topped with sliced almonds. It's the perfect combination of sweet and savory.",
      rating: 4.5,
      stock: 20),
  MenuModel(
      assetsImage: 'images/chocolate_croissant.jpg',
      menuName: 'Chocolate Croissant',
      price: 28000,
      description:
          'Butter croissant dough is wrapped around two chocolate batons to create a perfect balance that will satisfy any sweet tooth.',
      rating: 4,
      stock: 20),
  MenuModel(
      assetsImage: 'images/bagel_bites.jpg',
      menuName: 'Bagel Bites',
      price: 15000,
      description: 'Bagel in small bites with Cheese Melt filling.',
      rating: 3.5,
      stock: 20),
  MenuModel(
      assetsImage: 'images/cinnamon_roll.jpg',
      menuName: 'Cinnamon Roll',
      price: 25000,
      description:
          'Sweet dough with cinnamon filling, sultanas and topped with a cream cheese style icing.',
      rating: 4,
      stock: 20),
  MenuModel(
      assetsImage: 'images/spicy_tuna_bread.jpg',
      menuName: 'Spicy Tuna Bread',
      price: 30000,
      description: 'Soft sweet dough filled with Spicy Savory Tuna.',
      rating: 3.5,
      stock: 20),
  MenuModel(
      assetsImage: 'images/espresso_brownie.jpg',
      menuName: 'Espresso Brownies',
      price: 29000,
      description: 'A rich moist, fudgy espresso brownie.',
      rating: 4.5,
      stock: 25),
  MenuModel(
      assetsImage: 'images/smoked_beef_quiche.jpg',
      menuName: 'Smoked Beef Quiche',
      price: 40000,
      description: 'A savory quiche pie made from Smoked Beef and Cheese.',
      rating: 4,
      stock: 10),
  MenuModel(
      assetsImage: 'images/via_red_velvet_roll_cake.jpg',
      menuName: 'Via Red Velvet',
      price: 30000,
      description: 'Velvety red jelly rolled cake blend with praline nuts.',
      rating: 4,
      stock: 15),
  MenuModel(
      assetsImage: 'images/classic_dark_chocolate_cake.jpg',
      menuName: 'Classic Dark Chocolate Cake',
      price: 40000,
      description: 'A classic Devil\'s Food Cake with Dark chocolate ganache.',
      rating: 4.5,
      stock: 5),
  MenuModel(
      assetsImage: 'images/beef_filone.jpg',
      menuName: 'Beef Filone Sandwich',
      price: 44000,
      description: 'Soft Baguette with Smoked Beef & Cheese filling.',
      rating: 4,
      stock: 13),
  MenuModel(
      assetsImage: 'images/chocolate_chips_cookies.jpg',
      menuName: 'Chocolate Chip Cookies',
      price: 20000,
      description: 'Your classic & staple chocolate chip cookie.',
      rating: 4,
      stock: 22),
  MenuModel(
      assetsImage: 'images/banana_cake.jpg',
      menuName: 'Banana Toffee Cake',
      price: 39000,
      description: 'Moist and flavorful Banana Quickbread cake',
      rating: 3.5,
      stock: 19),
];

var wholeBeanList = [
  MenuModel(
      assetsImage: 'images/dark_sumatra.png',
      menuName: 'Sumatra',
      price: 200000,
      description:
          'A pound a week, in fact. And it may interest you to know that this'
          ' coffee is the one single-origin offering that we most often '
          'choose to enjoy at home, after we take off the green apron.',
      rating: 4.5,
      stock: 9),
  MenuModel(
      assetsImage: 'images/italian_roast.png',
      menuName: 'Italian Roast',
      price: 250000,
      description:
          'The Italians have a saying, la dolce far niente, which translates'
          ' as “the sweetness of doing nothing.',
      rating: 4,
      stock: 10),
  MenuModel(
      assetsImage: 'images/kenya.png',
      menuName: 'Kenya',
      price: 240000,
      description:
          'Beloved, like the elephant that symbolizes it. Bold, like the sun '
          'coming up over the Great Rift Valley.',
      rating: 4,
      stock: 14),
];

var merchList = [
  MenuModel(
      assetsImage: 'images/mug.jpg',
      menuName: 'Mug',
      price: 100000,
      description:
          'Starbucks Teavana is an exciting new way to experience tea and'
          ' our exclusive, moderan tea serveware with clean and simple lines'
          ' that complement our bold new Teavana by Starbucks packaged teas.',
      rating: 4,
      stock: 10),
  MenuModel(
      assetsImage: 'images/logo_tumbler_black.jpeg',
      menuName: 'Logo Tumbler Black',
      price: 200000,
      description: 'a great tumbler for your every choices.',
      rating: 4,
      stock: 15),
  MenuModel(
      assetsImage: 'images/white_tumbler.jpg',
      menuName: 'Logo Tumbler White',
      price: 250000,
      description: 'a great tumbler for your every choices.',
      rating: 4.5,
      stock: 10),
  MenuModel(
      assetsImage: 'images/lucy_tumbler.jpg',
      menuName: 'Lucy Tumbler',
      price: 175000,
      description: 'a great tumbler for your every choices.',
      rating: 4,
      stock: 20),
  MenuModel(
      assetsImage: 'images/ceramic_pour_over.jpg',
      menuName: 'Ceramic Pour Over',
      price: 150000,
      description: 'a cup for your break.',
      rating: 4,
      stock: 10),
];

List categoriesTab = ['Beverages', 'Fresh Food', 'Whole Bean', 'Merchandise'];
