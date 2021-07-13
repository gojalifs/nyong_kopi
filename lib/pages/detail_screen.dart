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
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int orderAmount = 0;

  addToCart() {
    if (orderAmount > 0) {
      int? _qty = itemQuantity[widget.menu];
      if (cartList.contains(widget.menu)) {
        setState(() {
          if (_qty != null) {
            itemQuantity[widget.menu] = _qty + orderAmount;
          }
        });
      } else {
        cartList.add(widget.menu);
        itemQuantity[widget.menu] = orderAmount;
        itemPrice[widget.menu] = orderAmount * widget.menu.price;
      }
      setState(() {
        Cart();
      });

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
          color: Color.fromRGBO(255, 255, 255, 255),
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
          body: buildPhoneView(context)),
    );
  }

  Column buildPhoneView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Hero(
            tag: widget.heroTag,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Image(
                image: AssetImage(widget.menu.assetsImage),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            widget.menu.menuName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'baloo',
              fontSize: 30,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
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
                      });
                    },
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 30,
                    )),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            addToCart();
            priceList.add(orderAmount * widget.menu.price);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor),
          ),
          child: Text("Add To Cart"),
        ),
        SizedBox(
          height: 75,
        ),
      ],
    );
  }
}
