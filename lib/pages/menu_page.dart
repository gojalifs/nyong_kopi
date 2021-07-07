import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nyong_kopi/model/menu_model.dart';
import 'package:nyong_kopi/pages/detail_screen.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _indexMenu = 0;
  int _count = 0;
  String text = 'Pick Your Beverages';

  @override
  void initState() {
    super.initState();
    changeState();
  }

  changeState() {
    setState(() {
      switch (_indexMenu) {
        case 0:
          text = 'Get Your Beverages';
          setState(() {
            _count = basicBeveragesList.length;
          });
          break;
        case 1:
          text = 'Get Your Fresh Food';
          setState(() {
            _count = freshFoodList.length;
          });
          break;
        case 2:
          text = 'Get Your Whole Bean';
          setState(() {
            _count = wholeBeanList.length;
          });
          break;
        case 3:
          text = 'Get Your Merchandise';
          setState(() {
            _count = merchList.length;
          });
          break;
        default:
          text = 'Pick Your Beverages';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        setCategories(context),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'baloo',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        createMenu(),
      ],
    );
  }

  Padding setCategories(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width - 100,
        child: Wrap(children: [
          Card(
            elevation: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  shrinkWrap: true,
                  children: List.generate(categoryList.length, (index) {
                    final MenuModel menu = categoryList[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _indexMenu = index;
                          changeState();
                          // countIndex();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              child: Image(
                                image: AssetImage(menu.assetsImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.7),
                              child: Text(menu.menuName),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  createMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: _count ,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              // final MenuModel basicMenu = basicBeveragesList[index];

              final formatter = NumberFormat("#,###");
              // final MenuModel espressoMenu = blendedBeveragesList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(
                      menu: _indexMenu == 0
                          ? basicBeveragesList[index]
                          : _indexMenu == 1
                              ? freshFoodList[index]
                              : _indexMenu == 2
                                  ? wholeBeanList[index]
                                  : merchList[index],
                      heroTag: index.toString(),
                      stock: _indexMenu == 0
                          ? basicBeveragesList[index].stock
                          : _indexMenu == 1
                          ? freshFoodList[index].stock
                          : _indexMenu == 2
                          ? wholeBeanList[index].stock
                          : merchList[index].stock,
                    );
                  }));
                },
                child: _indexMenu == 0
                    ? createListView(index, basicBeveragesList[index], formatter)
                    : _indexMenu == 1
                        ? createListView(index, freshFoodList[index], formatter)
                        : _indexMenu == 2
                            ? createListView(
                                index, wholeBeanList[index], formatter)
                            : createListView(
                                index, merchList[index], formatter),
              );
            },
          ),
        ),
      ],
    );
  }

  Hero createListView(int index, MenuModel basicMenu, NumberFormat formatter) {
    return Hero(
      tag: index.toString(),
      child: Card(
        elevation: 5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 75,
              height: 75,
              child: Image(
                image: AssetImage(
                    _indexMenu == 0
                        ? basicMenu.assetsImage.toString()
                        : _indexMenu == 1
                        ? freshFoodList[index].assetsImage.toString()
                        : _indexMenu == 2
                        ? wholeBeanList[index].assetsImage.toString()
                        : merchList[index].assetsImage.toString()
                ),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // width: 300,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _indexMenu == 0
                          ? basicMenu.menuName.toString()
                          : _indexMenu == 1
                          ? freshFoodList[index].menuName.toString()
                          : _indexMenu == 2
                          ? wholeBeanList[index].menuName.toString()
                          : merchList[index].menuName.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "It's just " + formatter.format(
                          _indexMenu == 0
                              ? basicMenu.price
                              : _indexMenu == 1
                              ? freshFoodList[index].price
                              : _indexMenu == 2
                              ? wholeBeanList[index].price
                              : merchList[index].price
                      ) + " IDR",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
