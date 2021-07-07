import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nyong_kopi/model/cart_model.dart';
import 'package:nyong_kopi/model/menu_model.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  CountDownController _countDownController = CountDownController();

  void onPress() {
    setState(() {});
  }

  var listView;
  var orderAmount = 0, stock;
  var total;

  List _allQuantity = itemQuantity.values.toList();
  List<int> _listOfPrice = itemPrice.values.toList();
  int _totalPrice = 0;

  int sumPrice() {
    int plus = _listOfPrice.reduce((a, b) => a + b);
    print(plus.toString());
    return plus;
  }

  @override
  Widget build(BuildContext context) {
    if (cartList.length > 0) {
      listView = ListView.builder(
          itemCount: cartList.length,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final MenuModel cartIndex = cartList[index];
            int quantity = _allQuantity[index];

            return Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 75,
                      width: 75,
                      child: Image(
                        image: AssetImage(cartIndex.assetsImage),
                        fit: BoxFit.cover,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartIndex.menuName),
                        Text('sub price ' + cartIndex.price.toString()),
                        Text("Total Price = " + _listOfPrice[index].toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (_allQuantity[index] > 0) {
                                          _allQuantity[index]--;
                                          quantity = _allQuantity[index];
                                          itemQuantity[cartIndex] = quantity;
                                          print('item quantity ' +
                                              quantity.toString());
                                          _listOfPrice[index] =
                                              _allQuantity[index] *
                                                  cartIndex.price;

                                          print('the total price is ' +
                                              _totalPrice.toString());
                                          print('Quantity is ' +
                                              _allQuantity.toString());
                                          print('price is ' +
                                              _listOfPrice[index].toString());
                                        }
                                      });
                                    },
                                    padding: EdgeInsets.all(0),
                                    splashRadius: 20,
                                    icon: Icon(
                                      Icons.remove_circle_outline,
                                      size: 30,
                                    ))),
                            Container(
                              width: 80,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 3)),
                              child: Text(
                                quantity.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
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
                                      _allQuantity[index]++;
                                      quantity = _allQuantity[index];
                                      itemQuantity[cartIndex] = quantity;
                                      print('item quantity ' +
                                          quantity.toString());
                                      _totalPrice = quantity * cartIndex.price;
                                      print(_totalPrice);
                                      _listOfPrice[index] = _totalPrice;
                                      print('price is ' +
                                          _listOfPrice[index].toString());
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    size: 30,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
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
                                          color:
                                              Theme.of(context).primaryColor),
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
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      icon: Icon(Icons.delete_forever)),
                ],
              ),
            );
          });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        cartList.isNotEmpty
            ? listView
            : Center(child: Text("Your Cart Is Empty")),
        cartList.isNotEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      // Container(
                      //   child:
                      //   Text(
                      //     total.toString(),
                      //   ),
                      // ),
                      Text(
                        'Total To Pay : ' + sumPrice().toString(),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onPress();
                      sumPrice();
                      // _countDownController.start();

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
                                  pop();
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                              "We are working on your order, "
                                              "you can now enjoy your netflix"
                                              " while we are delivering your order"),
                                        );
                                      });
                                },
                              ),
                            );
                          });
                    },
                    child: Text(
                      "Pay Now",
                    ),
                  ),
                ],
              )
            : SizedBox.shrink(),
      ],
    );
  }

  pop() {
    Navigator.pop(context);
  }
}
