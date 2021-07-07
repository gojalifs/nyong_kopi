import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nyong_kopi/model/cart_model.dart';
import 'package:nyong_kopi/model/menu_model.dart';
import 'package:nyong_kopi/pages/cart_screen.dart';
import 'package:nyong_kopi/pages/description_page.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:swipe_up/swipe_up.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  final MenuModel menu;
  final String heroTag;
  int stock;
  static var orderAmount;
  int quantity;

  DetailScreen(
      {required this.menu,
      required this.heroTag,
      required this.stock,
      this.quantity = 0});

  @override
  _DetailScreenState createState() => _DetailScreenState(this.quantity);
}

class _DetailScreenState extends State<DetailScreen> {
  int orderAmount = 0;
  int quantity;

  _DetailScreenState(this.quantity);

  addToCart() {
    if (orderAmount > 0) {
      int? _qty = itemQuantity[widget.menu];
      if (cartList.contains(widget.menu)) {
        setState(() {
          if (_qty != null) {
            itemQuantity[widget.menu] = _qty + orderAmount;
          }
        });
        print('sudah ' + itemQuantity[widget.menu].toString());
      } else {
        cartList.add(widget.menu);
        itemQuantity[widget.menu] = orderAmount;
        itemPrice[widget.menu] = orderAmount * widget.menu.price;
      }
      setState(() {
        Cart();
      });

      print(itemQuantity[widget.menu]);
      Navigator.pop(context);
    } else {
      Fluttertoast.showToast(msg: "Please Enter Order Quantity!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SwipeUp(
      animate: true,
      sensitivity: 0.5,
      onSwipe: () {
        Navigator.push(context, MaterialPageRoute(builder: (builder) {
          return DescriptionPage(description: widget.menu.description);
        }));
      },
      showArrow: true,
      child: Container(
        width: 200,
        height: 50,
        child: Material(
          child: Text(
            "Swipe Up For Detail",
            style: TextStyle(
              color: Colors.black38,
              fontSize: 15,

            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Scaffold(
        appBar: AppBar(
          title: Text("Item Detail"),
        ),
        body: Column(
          children: [
            Hero(
                tag: widget.heroTag,
                child: Image.asset(widget.menu.assetsImage)),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.menu.menuName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'baloo',
                fontSize: 30,
              ),
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width - 125,
            //   child: Text(
            //     widget.menu.description,
            //     style: TextStyle(fontSize: 20),
            //     textAlign: TextAlign.justify,
            //   ),
            // ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (orderAmount > 0) {
                            orderAmount--;
                            widget.stock++;
                          }
                        });
                      },
                      padding: EdgeInsets.all(0),
                      splashRadius: 20,
                      icon: Icon(
                        Icons.remove_circle_outline,
                        size: 30,
                      )),
                ),
                Container(
                  width: 80,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // TextField(
                      //   textAlign: TextAlign.center,
                      //   controller: _addToCartController,
                      //
                      // ),
                      Text(
                        // 'Amount of Your Order is ' +
                        orderAmount.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: IconButton(
                      padding: EdgeInsets.all(0),
                      splashRadius: 20,
                      onPressed: () {
                        setState(() {
                          orderAmount++;
                          widget.stock--;
                          print(itemQuantity);
                        });
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 30,
                      )),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                addToCart();
                priceList.add(orderAmount * widget.menu.price);
                print(orderAmount.toString());
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
              ),
              child: Text("Add To Cart"),
            ),
            Text(
              "Stock Available : ${widget.stock.toString()}",
            ),
          ],
        ),
      ),
    );
  }
}
