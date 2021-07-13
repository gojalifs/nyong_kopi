import 'dart:ui';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:nyong_kopi/model/cart_model.dart';
import 'package:nyong_kopi/model/history_model.dart';
import 'package:nyong_kopi/model/menu_model.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  CountDownController _countDownController = CountDownController();
  var orderAmount = 0, stock;
  var total;

  final formatter = NumberFormat("#,###");

  List _allQuantity = itemQuantity.values.toList();
  List<int> _listOfPrice = itemPrice.values.toList();

  var timeNow = DateTime.now().hour;
  int hour = 10;

  int sumPrice() {
    int plus = _listOfPrice.reduce((a, b) => a + b);
    double totalPrice = plus.toDouble();
    if (timeNow <= hour) {
      totalPrice = plus.toDouble() * 0.5;
      totalPrice.toInt();
    }
    return totalPrice.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).size.width >= 650
          ? EdgeInsets.only(left: 100, right: 100)
          : EdgeInsets.only(left: 10, right: 10),
      child: Card(
        child: Center(
          child: Column(
            children: [
              if (cartList.isNotEmpty)
                _buildCartListView()
              else
                Column(
                  children: [
                    Icon(
                      Icons.production_quantity_limits,
                      size: 75,
                    ),
                    Text(
                      "Your Cart Is Empty",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              cartList.isNotEmpty ? buildPay(context) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  ListView _buildCartListView() {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(
              height: 10,
              thickness: 5,
            ),
        itemCount: cartList.length,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final MenuModel cartIndex = cartList[index];
          int quantity = _allQuantity[index];

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                    height: 85,
                    width: 85,
                    child: Image(
                      image: AssetImage(cartIndex.assetsImage),
                      fit: BoxFit.cover,
                    )),
              ),
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          cartIndex.menuName,
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Rp' + formatter.format(cartIndex.price).toString(),
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.red,
                          fontFamily: 'baloo',
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 25,
                              height: 25,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_allQuantity[index] > 0) {
                                        _allQuantity[index]--;
                                        quantity = _allQuantity[index];
                                        itemQuantity[cartIndex] = quantity;
                                        _listOfPrice[index] =
                                            _allQuantity[index] *
                                                cartIndex.price;
                                      }
                                    });
                                  },
                                  padding: EdgeInsets.all(0),
                                  splashRadius: 20,
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    size: 25,
                                  ))),
                          Container(
                            width: 60,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 3)),
                            child: Text(
                              quantity.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: IconButton(
                                padding: EdgeInsets.all(0),
                                splashRadius: 20,
                                onPressed: () {
                                  setState(() {
                                    _allQuantity[index]++;
                                    quantity = _allQuantity[index];
                                    itemQuantity[cartIndex] = quantity;

                                    _listOfPrice[index] =
                                        _allQuantity[index] * cartIndex.price;
                                  });
                                },
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  size: 25,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Text("Remove From Cart?"),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      itemQuantity.remove(cartList[index]);
                                      cartList.removeAt(index);
                                      _listOfPrice.removeAt(index);
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "No",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    icon: Icon(Icons.delete_forever)),
              ),
            ],
          );
        });
  }

  Column buildPay(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(
          thickness: 3,
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: discountCalc(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: ElevatedButton(
                  onPressed: () {
                    sumPrice();
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text("Confirm Your Order . . . "),
                            actions: [
                              CupertinoDialogAction(
                                child: Text(
                                  "Cancel Order",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                            content: CircularCountDownTimer(
                              controller: _countDownController,
                              autoStart: true,
                              width: 25,
                              height: 25,
                              duration: 5,
                              fillColor: Theme.of(context).primaryColor,
                              ringColor: Colors.black26,
                              isReverse: true,
                              onStart: () {
                                print("Started...");
                              },
                              onComplete: () {
                                historyList.addAll(cartList);
                                cartList.clear();
                                itemQuantity.clear();
                                itemPrice.clear();
                                pop();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                            "We are working on your order, "
                                            "you can now enjoy your netflix"
                                            " while we are delivering your order"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              child: Text('OK')),
                                        ],
                                      );
                                    });
                              },
                            ),
                          );
                        });
                  },
                  child: Text(
                    "Pay Now",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> discountCalc() {
    return [
      Text(
        'Total To Pay : ',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      if (timeNow < hour)
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                'Rp' + formatter.format(sumPrice()).toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Rp' + formatter.format(sumPrice() * 2).toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black26,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        )
      else
        Text(
          'Rp' + formatter.format(sumPrice()).toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
    ];
  }

  pop() {
    Navigator.pop(context);
  }
}
