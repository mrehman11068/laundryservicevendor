import 'package:flutter/material.dart';
import 'package:laundryservice/models/cartproduct.dart';
import 'package:laundryservice/pages/booking/pricing.dart';
import 'package:laundryservice/utils/constants.dart';

import '../../models/product.dart';
import '../../widgets/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  var cost = 65;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView.builder(
        itemCount: Constants.productsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Image.asset(
                        Constants.productsList[index].image,
                        height: 30,
                      ),
                      trailing: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  PricingScreen(product: Constants.productsList[index])));
                        },
                        child: Container(
                          height: 30.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4.0),
                            // color: Constants.primaryColorTransparent
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "+\tAdd",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        Constants.productsList[index].name,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Constants.productsList[index].description),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "From",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                              text: " AED ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: Constants.productsList[index].price
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text:
                                    " Price Per ${Constants.productsList[index].unit}",
                                style: TextStyle(color: Colors.black)),
                          ])),
                          SizedBox(
                            height: 5,
                          ),

                          Container(
                            height: 20,
                            child: Row(
                              children: [
                                InkWell(
                                  child: checkIsFavorite(Constants
                                              .productsList[index]) ==
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
                                          Constants.productsList[index])) {
                                        Constants.favoritProductsList.remove(
                                            Constants.productsList[index]);
                                      } else {
                                        Constants.favoritProductsList.add(
                                            Constants.productsList[index]);
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Constants
                                      .productsList[index].subproducts.length,
                                  itemBuilder: (context, subindex) {
                                    return Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2),
                                        height: 20.0,
                                        alignment: Alignment.center,
                                        // Align the child to the left
                                        decoration: BoxDecoration(
                                            // border: Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            color: Constants.lightGreyColor),
                                        child: Text(
                                          Constants.productsList[index]
                                              .subproducts[subindex],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.0,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          );
        },
      ),
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
