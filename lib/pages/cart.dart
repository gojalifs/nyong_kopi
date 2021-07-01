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
  void onPress() {
    setState(() {});
  }

  var listView;

  var orderAmount = 0, stock;

  var total;

  List allQuantity = itemQuantity.values.toList();
  List<int> listOfPrice = itemPrice.values.toList();
  int totalToPay = 0;
  int totalPrice = 0;

  num sum = 0;

  List newCartList = cartList;

  int sumPrice() {
    int plus = listOfPrice.reduce((a, b) => a + b);
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
            int quantity = allQuantity[index];

            return Card(
              child: Row(
                children: [
                  SizedBox(
                      height: 75,
                      width: 75,
                      child: Image(
                        image: AssetImage(cartIndex.assetsImage),
                        fit: BoxFit.cover,
                      )),
                  Column(
                    children: [
                      Text(cartIndex.menuName),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Quantity ' + quantity.toString()),
                                Text('sub price ' + cartIndex.price.toString()),
                                Text("Total Price = " +
                                    listOfPrice[index].toString()),
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
                                            if (allQuantity[index] > 0) {
                                              allQuantity[index]--;
                                              quantity = allQuantity[index];
                                              itemQuantity[cartIndex] = quantity;
                                              print('item quantity ' +
                                                  quantity.toString());
                                              listOfPrice[index] =
                                                  allQuantity[index] *
                                                      cartIndex.price;

                                              print('the total price is ' +
                                                  totalPrice.toString());
                                              print('Quantity is ' +
                                                  allQuantity.toString());
                                              print('price is ' +
                                                  listOfPrice[index]
                                                      .toString());
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
                                            color:
                                                Theme.of(context).primaryColor,
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
                                            allQuantity[index]++;
                                            quantity = allQuantity[index];
                                            itemQuantity[cartIndex] = quantity;
                                            print('item quantity ' +
                                                quantity.toString());
                                            totalPrice =
                                                quantity * cartIndex.price;
                                            print(totalPrice);
                                            listOfPrice[index] = totalPrice;
                                            print('price is ' +
                                                listOfPrice[index].toString());
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
                        ],
                      ),
                    ],
                  ),
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
                      print(allQuantity);
                      print(priceList);
                      allQuantity.isEmpty
                          ? print('list kosong')
                          : print(allQuantity);
                      itemPrice.isEmpty
                          ? print('list kosong')
                          : print('harga nya ' + listOfPrice.toString());

                      sumPrice();
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
}
