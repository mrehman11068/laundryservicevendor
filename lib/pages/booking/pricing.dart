import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/cartproduct.dart';
import '../../models/product.dart';
import '../../utils/constants.dart';

class PricingScreen extends StatefulWidget {

  Product product;

  PricingScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {

  num cost = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    cost = widget.product.price;

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text("Tabs Test"),
          // ),

          bottomSheet: Container(
            color: Colors.white,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Estimated Price: "),
                SizedBox(width: 20,),
                Text("$cost AED", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
                SizedBox(width: 20,),
                ElevatedButton(onPressed: (){

                  widget.product.price = cost;

                  setState(() {
                    Constants.carItemsList.add(
                      Cart(
                          id: "1",
                          quantity: 1,
                          totalprice: cost,
                          product: widget.product),);
                  });
                  Navigator.of(context).pop();
                }, child: Text("Add to Cart"))
              ],
            ),
          ),
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                ListTile(
                    title: Center(child: Text("Pricing", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),)),
                    trailing: InkWell(child: Icon(Icons.close, color: Colors.black, size: 30,),
                      onTap: (){
                        Navigator.of(context).pop();
                      },)
                ),

                ListTile(
                  selected: true,
                  selectedTileColor: Constants.scaffoldBackgroundColor,
                  contentPadding: EdgeInsets.all(10),
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(widget.product.image, height: 50,),
                    ],
                  ),
                  title: Text(widget.product.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  subtitle: Text(widget.product.description, style: TextStyle(color: Colors.black),),
                  trailing: InkWell(
                    child: checkIsFavorite(widget.product) ==
                        true
                        ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    )
                        : Icon(Icons.favorite_border, size: 30,),
                    onTap: () {
                      setState(() {
                        if (checkIsFavorite(
                            widget.product)) {
                          Constants.favoritProductsList.remove(
                              widget.product);
                        } else {
                          Constants.favoritProductsList.add(
                              widget.product);
                        }
                      });
                    },
                  ),
                ),

                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      dividerColor: Colors.black,
                      labelColor: Colors.black,
                      tabs: [
                        Tab(text: "Price List"),
                        Tab(text: "Service Details"),
                      ]),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 40),
                    child: TabBarView(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            ListTile(
                                contentPadding: EdgeInsets.all(10),
                                // trailing: Text("+ Add"),
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("AED ${widget.product.price}"),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(
                                              4.0),
                                          // color: Constants.primaryColorTransparent
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                cost = cost + widget.product.price;
                                              });
                                            },
                                            child: Center(
                                                child:
                                                Text('+'))),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                contentPadding: EdgeInsets.all(10),
                                // trailing: Text("+ Add"),
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("AED ${widget.product.price}"),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(
                                              4.0),
                                          // color: Constants.primaryColorTransparent
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                cost = cost + widget.product.price;
                                              });
                                            },
                                            child: Center(
                                                child:
                                                Text('+'))),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                contentPadding: EdgeInsets.all(10),
                                // trailing: Text("+ Add"),
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("AED ${widget.product.price}"),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(
                                              4.0),
                                          // color: Constants.primaryColorTransparent
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                cost = cost + widget.product.price;
                                              });
                                            },
                                            child: Center(
                                                child:
                                                Text('+'))),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                contentPadding: EdgeInsets.all(10),
                                // trailing: Text("+ Add"),
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("AED ${widget.product.price}"),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(
                                              4.0),
                                          // color: Constants.primaryColorTransparent
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                cost = cost + widget.product.price;
                                              });
                                            },
                                            child: Center(
                                                child:
                                                Text('+'))),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                contentPadding: EdgeInsets.all(10),
                                // trailing: Text("+ Add"),
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("AED ${widget.product.price}"),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(
                                              4.0),
                                          // color: Constants.primaryColorTransparent
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                cost = cost + widget.product.price;
                                              });
                                            },
                                            child: Center(
                                                child:
                                                Text('+'))),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                contentPadding: EdgeInsets.all(10),
                                // trailing: Text("+ Add"),
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("AED ${widget.product.price}"),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(
                                              4.0),
                                          // color: Constants.primaryColorTransparent
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                cost = cost + widget.product.price;
                                              });
                                            },
                                            child: Center(
                                                child:
                                                Text('+'))),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                contentPadding: EdgeInsets.all(10),
                                // trailing: Text("+ Add"),
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("AED ${widget.product.price}"),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(
                                              4.0),
                                          // color: Constants.primaryColorTransparent
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                cost = cost + widget.product.price;
                                              });
                                            },
                                            child: Center(
                                                child:
                                                Text('+'))),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                contentPadding: EdgeInsets.all(10),
                                // trailing: Text("+ Add"),
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("AED ${widget.product.price}"),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(
                                              4.0),
                                          // color: Constants.primaryColorTransparent
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                cost = cost + widget.product.price;
                                              });
                                            },
                                            child: Center(
                                                child:
                                                Text('+'))),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                contentPadding: EdgeInsets.all(10),
                                // trailing: Text("+ Add"),
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("AED ${widget.product.price}"),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(
                                              4.0),
                                          // color: Constants.primaryColorTransparent
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                cost = cost + widget.product.price;
                                              });
                                            },
                                            child: Center(
                                                child:
                                                Text('+'))),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                contentPadding: EdgeInsets.all(10),
                                // trailing: Text("+ Add"),
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("AED ${widget.product.price}"),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(
                                              4.0),
                                          // color: Constants.primaryColorTransparent
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                cost = cost + widget.product.price;
                                              });
                                            },
                                            child: Center(
                                                child:
                                                Text('+'))),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                contentPadding: EdgeInsets.all(10),
                                // trailing: Text("+ Add"),
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("AED ${widget.product.price}"),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(
                                              4.0),
                                          // color: Constants.primaryColorTransparent
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                cost = cost + widget.product.price;
                                              });
                                            },
                                            child: Center(
                                                child:
                                                Text('+'))),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            ListTile(
                                // trailing: Text("+ Add"),
                                leading: Image.asset("assets/images/service_overview.png", height: 30,),
                                title: Text("Service overview", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Your items are machine washed at 30°C and tumble dried. No ironing is included. 45°C can be requested at no extra charge.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                // trailing: Text("+ Add"),
                                leading: Image.asset("assets/images/service_options.png", height: 30,),
                                title: Text("Service options", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Mixed wash:\nWe will wash & tumble dry your laundry as you send it, all colours together.\n\nSeparate wash:\nWe will separate your laundry into 2 loads, lights and dark-coloured, and wash each load separately to minimize the risk of a colour run.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                // trailing: Text("+ Add"),
                                leading: Image.asset("assets/images/suitable_for.png", height: 30,),
                                title: Text("Suitable for", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Everyday laundry that can be machine washed and tumble dried. Some popular items typically included are t-shirts, trousers, bedsheets and undergarments.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                // trailing: Text("+ Add"),
                                leading: Image.asset("assets/images/do_not_include.png", height: 30,),
                                title: Text("Do not include", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("Laundry that is not suitable for machine washing and/or tumble drying\nDry-clean only items\nBath mats\nDuvets and bulky items\nAny type of shoes\nPet beds/items", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                // trailing: Text("+ Add"),
                                leading: Image.asset("assets/images/how_to_prepare_collection.png", height: 30,),
                                title: Text("How to prepare for collection", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("If you are booking multiple services, please prepare all items for the Wash service in a separate bag. Your laundryservice driver will tag the bag with the required service.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                            ListTile(
                                // trailing: Text("+ Add"),
                                leading: Image.asset("assets/images/how_to_receive_back_bag.png", height: 30,),
                                title: Text("How you'll receive the items back", style: TextStyle(color: Colors.black, fontSize: 16),),
                                subtitle: Text("We will return your clean laundry neatly packed, in a bag.", style: TextStyle(fontSize: 14,))
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        )
     );
  }
  checkIsFavorite(Product products) {
    for (Product favoriteProduct in Constants.favoritProductsList) {
      if (favoriteProduct == products) {
        return true;
        break;
      }
    }

    return false;
  }
}
