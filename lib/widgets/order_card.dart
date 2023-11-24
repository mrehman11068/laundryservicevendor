import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:laundryservice/pages/single_order.dart';

import '../models/order.dart';
import '../utils/helper.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  OrderCard({required this.order});

  // For formatting date
  final DateFormat formatter = DateFormat("yyyy MM dd");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SingleOrder(order: order,),
            ));
        },
      child: Container(
        height: ScreenUtil().setHeight(121.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Color.fromRGBO(220, 233, 245, 1),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getOrderIconWidget(order.status),
            SizedBox(
              width: 25.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getOrderStatusText(order.status),
                    style: TextStyle(
                      color: Color.fromRGBO(19, 22, 33, 1),
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  textRow("Placed On", formatter.format(order.placedDate)),
                  SizedBox(
                    height: 5.0,
                  ),
                  textRow("Delivery On", formatter.format(order.arrivalDate))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textRow(String textOne, String textTwo) {
  return Wrap(
    children: [
      Text(
        "$textOne:",
        style: TextStyle(
          color: Color.fromRGBO(74, 77, 84, 0.7),
          fontSize: 14.0,
        ),
      ),
      SizedBox(
        width: 4.0,
      ),
      Text(
        textTwo,
        style: TextStyle(
          color: Color.fromRGBO(19, 22, 33, 1),
          fontSize: 14.0,
        ),
      ),
    ],
  );
}

Widget getOrderIconWidget(OrderStatus status) {
  switch (status) {
    case OrderStatus.ASSIGNED:
      return Container(
        width: ScreenUtil().setWidth(37.0),
        height: ScreenUtil().setHeight(37.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(221, 40, 81, 0.18),
        ),
        child: Icon(
          Icons.local_activity,
          color: Color.fromRGBO(221, 40, 81, 1),
        ),
      );
    case OrderStatus.NEW_ORDER:
      return Container(
        width: ScreenUtil().setWidth(37.0),
        height: ScreenUtil().setHeight(37.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(255, 99, 2, 0.15),
        ),
        child: Icon(
          Icons.history,
          color: Color.fromRGBO(255, 99, 2, 1),
        ),
      );
    // case OrderStatus.DELIVERED:
    //   return Container(
    //     width: ScreenUtil().setWidth(37.0),
    //     height: ScreenUtil().setHeight(37.0),
    //     decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       color: Color.fromRGBO(0, 234, 19, 0.14901960784313725),
    //     ),
    //     child: Icon(
    //       Icons.check_circle_outline,
    //       color: Colors.green,
    //     ),
    //   );
    // case OrderStatus.PICKED:
    //   return Container(
    //     width: ScreenUtil().setWidth(37.0),
    //     height: ScreenUtil().setHeight(37.0),
    //     decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       color: Color.fromRGBO(0, 234, 19, 0.14901960784313725),
    //     ),
    //     child: Icon(
    //       Icons.check_circle_outline,
    //       color: Colors.green,
    //     ),
    //   );
    // case OrderStatus.NOT_DELIVERED:
    //   return Container(
    //     width: ScreenUtil().setWidth(37.0),
    //     height: ScreenUtil().setHeight(37.0),
    //     decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       color: Color.fromRGBO(187, 187, 187, 0.14901960784313725),
    //     ),
    //     child: Icon(
    //       Icons.check_circle_outline,
    //       color: Colors.grey,
    //     ),
    //   );
    default:
      return Container(
        width: ScreenUtil().setWidth(37.0),
        height: ScreenUtil().setHeight(37.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(221, 40, 81, 0.18),
        ),
        child: Icon(
          Icons.local_activity,
          color: Color.fromRGBO(221, 40, 81, 1),
        ),
      );
  }
}

String getOrderStatusText(OrderStatus status) {
  switch (status) {
    case OrderStatus.NEW_ORDER:
      return "New Order Received";
    case OrderStatus.ASSIGNED:
      return "Assigned to delivery boy!";
    // case OrderStatus.DELIVERED:
    //   return "Order Is Delivered";
    // case OrderStatus.PICKED:
    //   return "Order Is Picked Up";
    // case OrderStatus.NOT_DELIVERED:
    //   return "Order Not Delivered";
    default:
      return "";
  }
}