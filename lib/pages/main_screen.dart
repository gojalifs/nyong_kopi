import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nyong_kopi/model/cart_model.dart';
import 'package:nyong_kopi/pages/cart_screen.dart';
import 'package:nyong_kopi/pages/history_page.dart';
import 'package:nyong_kopi/pages/home_screen.dart';
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
    return Scaffold(
        appBar: _selectedIndex == 1
            ? buildAppBar('Pick Your Favourite Menu')
            : _selectedIndex == 2
                ? buildAppBar('Cart')
                : _selectedIndex == 3
                    ? buildAppBar('Order History')
                    : null,
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.black45,
            showUnselectedLabels: true,
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: "Order History")
            ]),
        body: SafeArea(
            child: ListView(shrinkWrap: true, children: [
          buildLayoutBuilder(_selectedIndex),
        ])));
  }

  LayoutBuilder buildLayoutBuilder(var page) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth >= 1025) {
        return bottomPage(page, context, 5);
      } else if (constraints.maxWidth >= 820) {
        return bottomPage(page, context, 4);
      } else if (constraints.maxWidth >= 620) {
        return bottomPage(page, context, 3);
      } else {
        return bottomPage(page, context, 2);
      }
    });
  }

  Widget bottomPage(page, BuildContext context, int gridCount) {
    if (page == 0) {
      return HomeScreen(gridCount: gridCount);
    } else if (page == 1) {
      return MenuPage();
    } else if (page == 2) {
      return Cart();
    } else {
      return HistoryScreen();
    }
  }

  AppBar buildAppBar(String title) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'baloo',
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
