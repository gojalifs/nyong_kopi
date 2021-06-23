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
  String text = 'Pick Your Beverages';

  changeText() {
    setState(() {
      switch (_indexMenu) {
        case 0:
          text = 'Get Your Beverages';
          break;
        case 1:
          text = 'Get Your Fresh Food';
          break;
        case 2:
          text = 'Get Your Whole Bean';
          break;
        case 3:
          text = 'Getc Your Merchandise';
          break;
        default:
          text = 'Pick Your Beverages';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic menuTab = [
      beveragesList(),
      Text('Fresh Food'),
      Text('Whole Bean'),
      Text('Merchandise'),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
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
                              changeText();
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
        ),
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
        menuTab.elementAt(_indexMenu),
      ],
    );
  }

  beveragesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: basicBeveragesList.length,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final MenuModel basicMenu = basicBeveragesList[index];
              final formatter = NumberFormat("#,###");
              // final MenuModel espressoMenu = blendedBeveragesList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    print(index);
                    return DetailScreen(
                      menu: basicMenu,
                      heroTag: index.toString(),
                      stock: basicMenu.stock,
                    );
                  }));
                },
                child: Hero(
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
                            image: AssetImage(basicMenu.assetsImage),
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
                                  basicMenu.menuName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "It's just " +
                                      formatter.format(basicMenu.price) +
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
