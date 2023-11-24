import 'package:flutter/material.dart';

import '../models/cartproduct.dart';
import '../models/product.dart';

class Constants {
  static final Color primaryColor = Colors.blueGrey;
  static final Color primaryColorTransparent = Color(0x810095FF);
  static final Color blueTextColor = Color(0xff0890F1);
  static final Color blueDarkColor = Color(0xff005b9a);
  static final Color transparentColor = Color(0x00ffffff);
  static final Color lightGreyColor = Color(0xffe5e5e5);
  static final Color scaffoldBackgroundColor = Color.fromRGBO(245, 247, 249, 1);
  static var cartCount = 10;

  static List<Product> productsList = [
    Product(
        id: "id",
        name: "Wash",
        description: "For everyday laundry, bedsheets and towels.",
        image: "assets/images/wash.png",
        price: 65,
        unit: "KG",
        subproducts: ["WASH", "TUMBLE-DRY", "IN A BAG"]),
    Product(
        id: "id",
        name: "Clean & Iron",
        description: "For everyday laundry that requires ironing after washing, or for dry cleaning.",
        image: "assets/images/clean_and_iron.png",
        price: 4,
        unit: "Item",
        subproducts: ["WASH/DRY CLEANING", "IRONING", "ON HANGERS"]),
    Product(
        id: "id",
        name: "Ironing",
        description: "For items that are already clean.",
        image: "assets/images/ironing.png",
        price: 7,
        unit: "Item",
        subproducts: ["IRONING", "ON HANGERS"]),
    Product(
        id: "id",
        name: "Duvets & Bulky Items",
        description: "For larger items that require extra care.",
        image: "assets/images/duvets_and_bulky_items.png",
        price: 18,
        unit: "Item",
        subproducts: ["CUSTOM CLEANING"]),
    Product(
        id: "id",
        name: "Carpet Cleaning",
        description: "For carpets requiring special processing.",
        image: "assets/images/carpets.png",
        price: 18,
        unit: "Item",
        subproducts: ["CUSTOM CLEANING"]),
    Product(
        id: "id",
        name: "Sneakers Cleaning",
        description: "Professional sneakers cleaning.",
        image: "assets/images/shoe_cleaning.png",
        price: 79,
        unit: "Item",
        subproducts: ["CUSTOM CLEANING"])
  ];

  static List<Product> favoritProductsList = [];

  static List<Cart> carItemsList = [
    Cart(
      id: "1",
      quantity: 1,
      totalprice: 65,
      product: Product(
          id: "id",
          name: "Wash",
          description: "For everyday laundry, bedsheets and towels.",
          image: "assets/images/wash.png",
          price: 65,
          unit: "KG",
          subproducts: ["WASH", "TUMBLE-DRY", "IN A BAG"]),
    ),
    Cart(
        id: "1",
        quantity: 1,
        totalprice: 4,
        product: Product(
            id: "id",
            name: "Clean & Iron",
            description: "For everyday laundry that requires ironing after washing, or for dry cleaning.",
            image: "assets/images/clean_and_iron.png",
            price: 4,
            unit: "Item",
            subproducts: ["WASH/DRY CLEANING", "IRONING", "ON HANGERS"])),
    // Cart(
    //     id: "1",
    //     quantity: 1,
    //     totalprice: 7,
    //     product: Product(
    //         id: "id",
    //         name: "Ironing",
    //         description: "For items that are already clean.",
    //         image: "assets/images/ironing.png",
    //         price: 7,
    //         unit: "Item",
    //         subproducts: ["IRONING", "ON HANGERS"])),
    // Cart(
    //     id: "1",
    //     quantity: 1,
    //     totalprice: 18,
    //     product: Product(
    //         id: "id",
    //         name: "Duvets & Bulky Items",
    //         description: "For larger items that require extra care.",
    //         image: "assets/images/duvets_and_bulky_items.png",
    //         price: 18,
    //         unit: "Item",
    //         subproducts: ["CUSTOM CLEANING"])),
    // Cart(
    //     id: "1",
    //     quantity: 1,
    //     totalprice: 18,
    //     product: Product(
    //         id: "id",
    //         name: "Carpet Cleaning",
    //         description: "For carpets requiring special processing.",
    //         image: "assets/images/carpets.png",
    //         price: 18,
    //         unit: "Item",
    //         subproducts: ["CUSTOM CLEANING"])),
    // Cart(
    //     id: "1",
    //     quantity: 1,
    //     totalprice: 79,
    //     product: Product(
    //         id: "id",
    //         name: "Sneakers Cleaning",
    //         description: "Professional sneakers cleaning.",
    //         image: "assets/images/shoe_cleaning.png",
    //         price: 79,
    //         unit: "Item",
    //         subproducts: ["CUSTOM CLEANING"])),
  ];
}
