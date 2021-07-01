import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nyong_kopi/model/cart_model.dart';
import 'package:nyong_kopi/pages/cart.dart';
import 'package:nyong_kopi/pages/device_view/mobile_view.dart';
import 'package:nyong_kopi/pages/menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic tabPage = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return MobileView();
              } else if (constraints.maxWidth <= 1200) {
                return Text(
                    "Tampilan Web1 + Size ${MediaQuery.of(context).size.width}");
              } else {
                return Text(
                    "Tampilan Web2 + Size ${MediaQuery.of(context).size.width}");
              }
            }),
            // MobileView(),
          ],
        ),
      ),
      MenuPage(),
      Cart(),
    ];

    return Scaffold(
        appBar: _selectedIndex == 1
            ? AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text(
                  "Pick Your Favourite Menu",
                  style: TextStyle(
                    fontFamily: 'baloo',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : null,
        backgroundColor: Color.fromRGBO(255, 255, 255, 15),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onTap,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_outlined), label: "Menu"),
              BottomNavigationBarItem(
                icon: Stack(children: [
                  Icon(Icons.shopping_bag_outlined),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: cartList.length == 0
                        ? Text(
                            "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : Icon(
                            Icons.circle,
                            size: 10,
                            color: Theme.of(context).primaryColor,
                          ),
                  )
                ]),
                label: "Cart",
              ),
            ]),
        body: SafeArea(
            child: ListView(
                shrinkWrap: true,
                children: [tabPage.elementAt(_selectedIndex)])));
  }
}
