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

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  int _indexMenu = 0;
  int _count = 0;
  String titleText = 'Pick Your Beverages';

  int length = basicBeveragesList.length;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    changeState();
    _tabController = TabController(length: categoriesTab.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _indexMenu = _tabController.index;
      });
    });
  }

  changeState() {
    setState(() {
      switch (_indexMenu) {
        case 0:
          titleText = 'Get Your Beverages';
          _count = basicBeveragesList.length;
          length = basicBeveragesList.length;
          break;
        case 1:
          titleText = 'Get Your Fresh Food';
          _count = freshFoodList.length;
          length = freshFoodList.length;
          break;
        case 2:
          titleText = 'Get Your Whole Bean';
          _count = wholeBeanList.length;
          length = wholeBeanList.length;
          break;
        case 3:
          titleText = 'Get Your Merchandise';
          _count = merchList.length;
          length = merchList.length;
          break;
        default:
          titleText = 'Pick Your Beverages';
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
                titleText,
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

  setCategories(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DefaultTabController(
          length: categoriesTab.length,
          child: TabBar(
            labelStyle: TextStyle(
              fontSize: 20,
            ),
            isScrollable: true,
            unselectedLabelColor: Theme.of(context).primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white70,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).primaryColor),
            controller: _tabController,
            onTap: changeState(),
            tabs: [
              for (int i = 0; i < categoriesTab.length; i++)
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        categoriesTab[i],
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }

  createMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MediaQuery.of(context).size.width > 1050
              ? gridViewBuilder(6)
              : MediaQuery.of(context).size.width > 850
                  ? gridViewBuilder(5)
                  : MediaQuery.of(context).size.width > 650
                      ? gridViewBuilder(4)
                      : listViewBuilder(),
        ),
      ],
    );
  }

  GridView gridViewBuilder(int count) {
    return GridView.count(
      addSemanticIndexes: true,
      crossAxisSpacing: 2.5,
      crossAxisCount: count,
      primary: false,
      shrinkWrap: true,
      children: List.generate(length, (index) {
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
              ? createGridCard(index, basicBeveragesList[index])
              : _indexMenu == 1
                  ? createGridCard(index, freshFoodList[index])
                  : _indexMenu == 2
                      ? createGridCard(index, wholeBeanList[index])
                      : createGridCard(index, merchList[index]),
        );
      }),
    );
  }

  Hero createGridCard(int index, MenuModel menu) {
    return Hero(
      tag: index.toString(),
      child: Card(
        semanticContainer: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image(
                  image: AssetImage(menu.assetsImage),
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.7),
                child: Text(
                  menu.menuName,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView listViewBuilder() {
    return ListView.builder(
      itemCount: _count,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final formatter = NumberFormat("#,###");
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
                      ? createListView(index, wholeBeanList[index], formatter)
                      : createListView(index, merchList[index], formatter),
        );
      },
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
                image: AssetImage(_indexMenu == 0
                    ? basicMenu.assetsImage.toString()
                    : _indexMenu == 1
                        ? freshFoodList[index].assetsImage.toString()
                        : _indexMenu == 2
                            ? wholeBeanList[index].assetsImage.toString()
                            : merchList[index].assetsImage.toString()),
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
                      "It's just " +
                          formatter.format(_indexMenu == 0
                              ? basicMenu.price
                              : _indexMenu == 1
                                  ? freshFoodList[index].price
                                  : _indexMenu == 2
                                      ? wholeBeanList[index].price
                                      : merchList[index].price) +
                          " IDR",
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

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
