import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nyong_kopi/model/cart_model.dart';
import 'package:nyong_kopi/model/menu_model.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  // int orderAmount = CartAmount.amount(orderAmount);
  @override
  Widget build(BuildContext context) {
    var listView;
    var total;
    var orderAmount = 0, stock;

    if (cartList.length > 0) {
      listView = cartList.isNotEmpty
          ? ListView.builder(
              itemCount: cartList.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final MenuModel cart = cartList[index];
                final sum = price;
                final totalPrice = sum[cart]! * cart.price;
                total = totalPrice;
                return Card(
                  child: Row(
                    children: [
                      SizedBox(
                          height: 75,
                          width: 75,
                          child: Image(
                            image: AssetImage(cart.assetsImage),
                            fit: BoxFit.cover,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cart.menuName),
                            // Text(DetailScreen.orderAmount.toString()),
                            Text('Quantity ' + sum[cart].toString()),
                            Text("Total Price = " + totalPrice.toString()),
                          ],
                        ),
                      ),
                      Column(
                        children: [
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
                                          stock++;
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
                                        color: Theme.of(context).primaryColor,
                                        width: 3)),
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
                                      sum[cart].toString(),
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
                                        stock--;
                                        print(price);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      size: 30,
                                    )),
                              ),
                            ],
                          ),
                          Text(cart.price.toString()),
                        ],
                      ),
                    ],
                  ),
                );
              })
          : Text("Cart");
    }

    final height =
        MediaQuery.of(context).size.height - 2 * kBottomNavigationBarHeight;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        cartList.isNotEmpty ? listView : Text("Your Cart Is Empty"),
        cartList.isNotEmpty
            ? ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Order Now",
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
