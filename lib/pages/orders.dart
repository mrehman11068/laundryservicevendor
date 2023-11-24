import 'package:flutter/material.dart';
import 'package:laundryservice/widgets/delivery_orders.dart';
import '../utils/constants.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Constants.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: Text("Orders", style: TextStyle(color: Colors.black),),
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[

              Container(
                constraints: BoxConstraints.expand(height: 50),
                child: TabBar(
                    unselectedLabelColor: Colors.grey,
                    dividerColor: Colors.black,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: "New"),
                      Tab(text: "Assigned"),
                      // Tab(text: "History"),
                    ]),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DeliveryOrders(type: "delivering"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DeliveryOrders(type: "picking"),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: OrdersHistoryScreen(),
                    // ),
                  ]),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
