import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryBoyScreen extends StatefulWidget {
  const DeliveryBoyScreen({super.key});

  @override
  State<DeliveryBoyScreen> createState() => _DeliveryBoyScreenState();
}

class _DeliveryBoyScreenState extends State<DeliveryBoyScreen> {

  List<String> deliveryBoysList = ["Delivery Boy", "Delivery Boy", "Delivery Boy", "Delivery Boy", "Delivery Boy", "Delivery Boy", "Delivery Boy", ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("delivery Boy List"),
      ),
      body: ListView.builder(
        itemCount: deliveryBoysList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ListTile(
                    selected: true,
                    trailing: (Text("Assign Order", style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),)),
                    leading: Container(
                      width: ScreenUtil().setWidth(37.0),
                      height: ScreenUtil().setHeight(37.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(208, 208, 208, 0.1803921568627451),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Color.fromRGBO(124, 115, 116, 1.0),
                      ),
                    ),
                    title: Text(deliveryBoysList[index], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
