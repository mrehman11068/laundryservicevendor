import 'package:flutter/material.dart';
import 'package:laundryservice/pages/booking/collectionanddelivery.dart';
import 'package:laundryservice/pages/booking/services.dart';
import 'package:laundryservice/pages/dashboard.dart';
import 'package:laundryservice/utils/constants.dart';

import 'location.dart';

class BookingMainScreen extends StatefulWidget {
  const BookingMainScreen({super.key});

  @override
  State<BookingMainScreen> createState() => _BookingMainScreenState();
}

class screenmodel {
  String screenname;
  Widget screen;

  screenmodel({required this.screenname, required this.screen});
}

class _BookingMainScreenState extends State<BookingMainScreen> {
  List<screenmodel> bookingScreensList = [
    screenmodel(screenname: "Location", screen: LocationScreen()),
    screenmodel(screenname: "Delivery & Collection", screen: CollectionAndDeliveryScreen()),
    screenmodel(screenname: "Services", screen: ServicesScreen())
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Constants.transparentColor,
        title: Text(
          bookingScreensList[index].screenname,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              if (index < bookingScreensList.length - 1) {
                setState(() {
                  ++index;
                });
              }
              else
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(activeIndex: 2,),
                      ));
                }
            },
            child: Center(
                child: Text(
              "Next",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: bookingScreensList[index].screen,
    ));
  }
}
