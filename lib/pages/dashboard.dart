import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:laundryservice/pages/booking/bookingmain.dart';
import 'package:laundryservice/pages/booking/services.dart';
import 'package:laundryservice/pages/cart.dart';
import 'package:laundryservice/pages/deliveryboy.dart';
import 'package:laundryservice/pages/favorites.dart';
import 'package:laundryservice/pages/home.dart';
import 'package:laundryservice/pages/orders.dart';

import '../utils/constants.dart';
import 'booking/location.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {

  // Track active index
  int activeIndex;

  Dashboard({required this.activeIndex});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  var number = '+923051234567';

  List<Widget> screenslist = [
    OrdersScreen(),
    // LocationScreen(),
    DeliveryBoyScreen(),
    // CartScreen(),
    ServicesScreen(),
    Center(child: Text("Detail")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        buttonBackgroundColor: Constants.primaryColor,
        index: widget.activeIndex,
        items: [
          Icon(
            Icons.shopping_cart,
            size: 30.0,
            color: widget.activeIndex == 0 ? Colors.white : Color(0xFFC8C9CB),
          ),
          // Icon(
          //   Icons.pin_drop_rounded,
          //   size: 30.0,
          //   color: activeIndex == 1 ? Colors.white : Color(0xFFC8C9CB),
          // ),
          Icon(
            Icons.supervised_user_circle_sharp,
            size: 30.0,
            color: widget.activeIndex == 1 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            Icons.list,
            size: 30.0,
            color: widget.activeIndex == 2 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            Icons.person,
            size: 30.0,
            color: widget.activeIndex == 3 ? Colors.white : Color(0xFFC8C9CB),
          ),
        ],
        onTap: (index) {
          setState(() {
            widget.activeIndex = index;
          });
        },
      ),
      backgroundColor: Constants.scaffoldBackgroundColor,
      body: screenslist[widget.activeIndex],
    );
  }
}
