import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laundryservice/models/cartproduct.dart';
import 'package:laundryservice/utils/constants.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../models/product.dart';
import '../widgets/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  String paymetnStatus = "unpaid";
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Constants.primaryColor,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 0.0,
              top: -20.0,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  "assets/images/washing_machine_illustration.png",
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Total Items: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: Colors.white,
                                              ),
                                        ),
                                        TextSpan(
                                          text: Constants.carItemsList.length
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.monetization_on_outlined,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Total Amount: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: Colors.white,
                                              ),
                                        ),
                                        TextSpan(
                                          text: getTotalAmount(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                      color: Colors.white,
                                      height: 400,
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "CHECKOUT",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Constants.primaryColor),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListTile(
                                            selected: true,
                                            selectedTileColor: Constants
                                                .scaffoldBackgroundColor,
                                            leading: Icon(
                                              Icons.location_on_outlined,
                                              size: 30,
                                              color: Constants.primaryColor,
                                            ),
                                            title: Text(
                                              "Address",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            subtitle: Text(
                                              "Digiskills, Dream Garden, Defense Road, Lahore, Pakistan",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListTile(
                                            selected: true,
                                            selectedTileColor: Constants
                                                .scaffoldBackgroundColor,
                                            leading: Icon(
                                              Icons.shopping_bag_outlined,
                                              size: 30,
                                              color: Constants.primaryColor,
                                            ),
                                            title: Text(
                                              "Order",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text: "Order Number  ",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey),
                                                    ),
                                                    TextSpan(
                                                      text: "0000111",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ]),
                                                ),
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text: "Total  ",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "${getTotalAmount()} AED",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                         ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                var snackBar = SnackBar(content: Text('Payment is successful'));
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                                Navigator.of(context).pop();
                                                // isVisible = true;
                                                // paymetnStatus = "paying";
                                                // // startTimer();
                                              });
                                            },
                                            child: Text("Pay Now"),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      Constants.primaryColor),
                                            ),
                                          ),

                                          SizedBox(height: 10,),

                                          Visibility(
                                            visible: isVisible,
                                            child:
                                            Text("Payment is in process"),

                                            // Column(
                                            //   children: [
                                            //
                                            //     // LoadingIndicator(
                                            //     //     indicatorType: Indicator.ballPulse, /// Required, The loading type of the widget
                                            //     //     colors: const [Colors.black],       /// Optional, The color collections
                                            //     //     strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                                            //     //     backgroundColor: Colors.black,      /// Optional, Background of the widget
                                            //     //     pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
                                            //     // ),
                                            //   ],
                                            // ),
                                          ),

                                          paymetnStatus == "paid" ? Row(
                                            children: [Icon(Icons.done, color: Colors.greenAccent,), SizedBox(width: 10,), Text("Payment is successful")],
                                          ) : Center()

                                        ],
                                      ));
                                },
                              );
                            },
                            child: SizedBox(
                              width: 120,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.money, color: Colors.white,),
                                  SizedBox(width: 10,),
                                  Text("Checkout"),
                                ],
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: Size(150, 40), //////// HERE
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 200.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        color: Constants.scaffoldBackgroundColor,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 24.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            child: Text(
                              "Cart Items",
                              style: TextStyle(
                                color: Color.fromRGBO(19, 22, 33, 1),
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 7.0),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Constants.carItemsList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Card(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ListTile(
                                              leading: Image.asset(
                                                Constants.carItemsList[index]
                                                    .product.image,
                                                height: 30,
                                              ),
                                              trailing: SizedBox(
                                                width: 150,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 30.0,
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                16.0),
                                                        // color: Constants.primaryColorTransparent
                                                      ),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    Constants
                                                                                .carItemsList[
                                                                                    index]
                                                                                .quantity >
                                                                            1
                                                                        ? --Constants
                                                                            .carItemsList[
                                                                                index]
                                                                            .quantity
                                                                        : Constants
                                                                            .carItemsList[
                                                                                index]
                                                                            .quantity;
                                                                    Constants
                                                                        .carItemsList[
                                                                            index]
                                                                        .totalprice = Constants
                                                                            .carItemsList[
                                                                                index]
                                                                            .product
                                                                            .price *
                                                                        Constants
                                                                            .carItemsList[
                                                                                index]
                                                                            .quantity;
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child:
                                                                        Text('-'))),
                                                          ),
                                                          Expanded(
                                                            child: Center(
                                                                child: Text(
                                                                    '${Constants.carItemsList[index].quantity}')),
                                                          ),
                                                          Expanded(
                                                            child: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    ++Constants
                                                                        .carItemsList[
                                                                            index]
                                                                        .quantity;

                                                                    Constants
                                                                        .carItemsList[
                                                                            index]
                                                                        .totalprice = Constants
                                                                            .carItemsList[
                                                                                index]
                                                                            .product
                                                                            .price *
                                                                        Constants
                                                                            .carItemsList[
                                                                                index]
                                                                            .quantity;
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child:
                                                                        Text('+'))),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 15,),
                                                    InkWell(
                                                        child: Icon(Icons.delete, color: Colors.red, size: 30,),
                                                      onTap: (){
                                                          setState(() {
                                                            Constants.carItemsList.removeAt(index);
                                                          });
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                              title: Text(
                                                Constants.carItemsList[index]
                                                    .product.name,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Price: ${Constants.carItemsList[0].product.price}"),
                                                  Text(
                                                    "Total: ${Constants.carItemsList[index].totalprice} AED",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getTotalAmount() {
    num amount = 0;
    for (Cart cart in Constants.carItemsList) {
      amount = amount + cart.totalprice;
    }

    return amount.toString();
  }

  late Timer _timer;
  int _start = 5;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          isVisible = false;
          setState(() {
            timer.cancel();
            Navigator.of(context).pop();
          });
        } else {
          setState(() {
            _start--;

            if (_start == 2) {
              setState(() {
                paymetnStatus == "paid";
              });
            }

          });
        }
      },
    );
  }

}
