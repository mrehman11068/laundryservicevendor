import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundryservice/pages/deliveryboy.dart';

import '../models/order.dart';
import '../utils/constants.dart';
import '../widgets/app_button.dart';

class SingleOrder extends StatefulWidget {

  Order? order;
  SingleOrder({this.order});

  @override
  _SingleOrderState createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 0.0,
              top: 10.0,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  "assets/images/washing_machine_illustration.png",
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: kToolbarHeight,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Details About\n",
                            style:
                                Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          TextSpan(
                            text: "Order #521",
                            style:
                                Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Constants.scaffoldBackgroundColor,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 16.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Details",
                            style:
                                Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Color.fromRGBO(74, 77, 84, 1),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "WASHING AND FOLDING",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(143, 148, 162, 1),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          getItemRow("3", "T-shirts (man)", "\$30.00"),
                          getItemRow("2", "T-shirts (man)", "\$40.00"),
                          getItemRow("4", "Pants (man)", "\$80.00"),
                          getItemRow("1", "Jeans (man)", "\$20.00"),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            "IRONING",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(143, 148, 162, 1),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          getItemRow("3", "T-shirt (woman)", "\$30.00"),
                          Divider(),
                          getSubtotalRow("Subtotal", "\$200.00"),
                          getSubtotalRow("Delivery", "\$225.00"),
                          SizedBox(
                            height: 10.0,
                          ),
                          getTotalRow("Total", "\$225.00"),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      height: ScreenUtil().setHeight(127.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [getOrderIconWidget(widget.order!.status, context),
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
}

Widget getTotalRow(String title, String amount) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color.fromRGBO(19, 22, 33, 1),
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          amount,
          style: TextStyle(
            color: Constants.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 17.0,
          ),
        )
      ],
    ),
  );
}

Widget getSubtotalRow(String title, String price) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color.fromRGBO(74, 77, 84, 1),
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          price,
          style: TextStyle(
            color: Color.fromRGBO(74, 77, 84, 1),
            fontSize: 15.0,
          ),
        )
      ],
    ),
  );
}

Widget getItemRow(String count, String item, String price) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        Text(
          count,
          style: TextStyle(
            color: Color.fromRGBO(74, 77, 84, 1),
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            " x $item",
            style: TextStyle(
              color: Color.fromRGBO(143, 148, 162, 1),
              fontSize: 15.0,
            ),
          ),
        ),
        Text(
          price,
          style: TextStyle(
            color: Color.fromRGBO(74, 77, 84, 1),
            fontSize: 15.0,
          ),
        )
      ],
    ),
  );
}

Widget getOrderIconWidget(OrderStatus status, context) {
  switch (status) {
    case OrderStatus.ASSIGNED:
      return Column(
        children: [
          Row(
            children: [
              Container(
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
              ),
              SizedBox(width: 20,),
              Text(
                "Order Assigned",
                style:
                Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Color.fromRGBO(74, 77, 84, 1),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text("This order is assigned to delivery boy.")
        ],
      );
    case OrderStatus.NEW_ORDER:
      return Column(
        children: [
          Row(
            children: [
              Container(
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
              ),
              SizedBox(width: 20,),
              Text(
                "New Order Received",
                style:
                Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Color.fromRGBO(74, 77, 84, 1),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          AppButton(
            type: ButtonType.PRIMARY,
            text: "Assign To Delivery Boy",
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      color: Colors.white,
                      height: 400,
                      padding: EdgeInsets.all(10),
                      child: DeliveryBoyScreen(),
                  );
                },
              );
              },
          )
        ],
      );
    // case OrderStatus.DELIVERED:
    //   return Row(
    //     children: [
    //       Container(
    //         width: ScreenUtil().setWidth(37.0),
    //         height: ScreenUtil().setHeight(37.0),
    //         decoration: BoxDecoration(
    //           shape: BoxShape.circle,
    //           color: Color.fromRGBO(0, 234, 19, 0.14901960784313725),
    //         ),
    //         child: Icon(
    //           Icons.check_circle_outline,
    //           color: Colors.green,
    //         ),
    //       ),
    //       SizedBox(width: 20,),
    //       Text(
    //         "Clothes are delivered.",
    //         style:
    //         Theme.of(context).textTheme.titleLarge?.copyWith(
    //           color: Color.fromRGBO(74, 77, 84, 1),
    //           fontSize: 16.0,
    //           fontWeight: FontWeight.w800,
    //         ),
    //       ),
    //     ],
    //   );
    // case OrderStatus.PICKED:
    //   return Row(
    //     children: [
    //       Container(
    //         width: ScreenUtil().setWidth(37.0),
    //         height: ScreenUtil().setHeight(37.0),
    //         decoration: BoxDecoration(
    //           shape: BoxShape.circle,
    //           color: Color.fromRGBO(0, 234, 19, 0.14901960784313725),
    //         ),
    //         child: Icon(
    //           Icons.check_circle_outline,
    //           color: Colors.green,
    //         ),
    //       ),
    //       SizedBox(width: 20,),
    //       Text(
    //         "Clothes are picked up.",
    //         style:
    //         Theme.of(context).textTheme.titleLarge?.copyWith(
    //           color: Color.fromRGBO(74, 77, 84, 1),
    //           fontSize: 16.0,
    //           fontWeight: FontWeight.w800,
    //         ),
    //       ),
    //     ],
    //   );
    // case OrderStatus.NOT_DELIVERED:
    //   return Row(
    //     children: [
    //       Container(
    //         width: ScreenUtil().setWidth(37.0),
    //         height: ScreenUtil().setHeight(37.0),
    //         decoration: BoxDecoration(
    //           shape: BoxShape.circle,
    //           color: Color.fromRGBO(187, 187, 187, 0.14901960784313725),
    //         ),
    //         child: Icon(
    //           Icons.check_circle_outline,
    //           color: Colors.grey,
    //         ),
    //       ),
    //       SizedBox(width: 20,),
    //       Text(
    //         "Clothes are not delivered.",
    //         style:
    //         Theme.of(context).textTheme.titleLarge?.copyWith(
    //           color: Color.fromRGBO(74, 77, 84, 1),
    //           fontSize: 16.0,
    //           fontWeight: FontWeight.w800,
    //         ),
    //       ),
    //     ],
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
