import 'package:flutter/material.dart';
import 'package:laundryservice/utils/constants.dart';

import '../../widgets/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';

class CollectionAndDeliveryScreen extends StatefulWidget {
  const CollectionAndDeliveryScreen({super.key});

  @override
  State<CollectionAndDeliveryScreen> createState() => _CollectionAndDeliveryScreenState();
}

class _CollectionAndDeliveryScreenState extends State<CollectionAndDeliveryScreen> {

  final instructionsTextController = TextEditingController();

  List<String> daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
  int selectedCollectionDayIndex = 0, selectedDeliveryDayIndex = 0;

  List<String> timesOfDay = ["12:00 - 15:00", "13:00 - 16:00", "14:00 - 17:00", "15:00 - 18:00", "16:00 - 19:00", "17:00 - 20:00", "18:00 - 21:00", "19:00 - 22:00", "20:00 - 23:00"];
  int selectedCollectionTimeIndex = 0, selectedDeliveryTimeIndex = 0;

  List<String> collectionTypeList = ["Deliver to me in person", "Leave at door", "Deliver to the reception"];
  int selectedCollectionTypeIndex = 0, selectedDeliveryTypeIndex = 0;

  List frequencyList = ['Just Once', 'Weekly', 'Every Two Weeks', 'Every Four Weeks'];
  int index_color = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              width: double.infinity,
              child: Text(
                "Collection Time",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),

            SizedBox(height: 10,),

            /////////Drop down widget for days
            InkWell(
              child: ListTile(
                  leading: Icon(Icons.date_range_outlined, color: Colors.black,),
                  trailing: Icon(Icons.edit, color: Colors.black,),
                  title: Text(daysOfWeek[selectedCollectionDayIndex], style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.white,
                        height: 250,
                      padding: EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: daysOfWeek.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedCollectionDayIndex = index;
                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              color: index == selectedCollectionDayIndex ? Constants.primaryColorTransparent : Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(daysOfWeek[index], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                                  Divider()
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    );
                  },
                );
              },
            ),

            /////////Drop down widget for time
            InkWell(
              child: ListTile(
                  leading: Icon(Icons.lock_clock, color: Colors.black,),
                  trailing: Icon(Icons.edit, color: Colors.black,),
                  title: Text(timesOfDay[selectedCollectionTimeIndex], style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        color: Colors.white,
                        height: 300,
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                          itemCount: timesOfDay.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedCollectionTimeIndex = index;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                color: index == selectedCollectionTimeIndex ? Constants.primaryColorTransparent : Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(timesOfDay[index], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                                    Divider()
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                    );
                  },
                );
              },
            ),

            /////////Drop down widget for collect type
            InkWell(
              child: ListTile(
                  leading: Icon(Icons.table_bar, color: Colors.black,),
                  trailing: Icon(Icons.edit, color: Colors.black,),
                  title: Text(collectionTypeList[selectedCollectionTypeIndex], style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        color: Colors.white,
                        height: 150,
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                          itemCount: collectionTypeList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedCollectionTypeIndex = index;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                color: index == selectedCollectionTypeIndex ? Constants.primaryColorTransparent : Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(collectionTypeList[index], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                                    Divider()
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                    );
                  },
                );
              },
            ),

            SizedBox(height: 50,),

            Divider(
              color: Colors.black12,
              height: 5,
            ),

            SizedBox(height: 20,),

            SizedBox(
              width: double.infinity,
              child: Text(
                "Delivery Time",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),

            SizedBox(height: 10,),

            /////////Drop down widget for days delivery
            InkWell(
              child: ListTile(
                  leading: Icon(Icons.date_range_outlined, color: Colors.black,),
                  trailing: Icon(Icons.edit, color: Colors.black,),
                  title: Text(daysOfWeek[selectedDeliveryDayIndex], style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.white,
                        height: 250,
                      padding: EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: daysOfWeek.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedDeliveryDayIndex = index;
                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              color: index == selectedDeliveryDayIndex ? Constants.primaryColorTransparent : Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(daysOfWeek[index], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                                  Divider()
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    );
                  },
                );
              },
            ),

            /////////Drop down widget for time delivery
            InkWell(
              child: ListTile(
                  leading: Icon(Icons.lock_clock, color: Colors.black,),
                  trailing: Icon(Icons.edit, color: Colors.black,),
                  title: Text(timesOfDay[selectedDeliveryTimeIndex], style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        color: Colors.white,
                        height: 300,
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                          itemCount: timesOfDay.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedDeliveryTimeIndex = index;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                color: index == selectedDeliveryTimeIndex ? Constants.primaryColorTransparent : Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(timesOfDay[index], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                                    Divider()
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                    );
                  },
                );
              },
            ),

            /////////Drop down widget for collect type delivery
            InkWell(
              child: ListTile(
                  leading: Icon(Icons.table_bar, color: Colors.black,),
                  trailing: Icon(Icons.edit, color: Colors.black,),
                  title: Text(collectionTypeList[selectedDeliveryTypeIndex], style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        color: Colors.white,
                        height: 150,
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                          itemCount: collectionTypeList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedDeliveryTypeIndex = index;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                color: index == selectedDeliveryTypeIndex ? Constants.primaryColorTransparent : Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(collectionTypeList[index], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                                    Divider()
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                    );
                  },
                );
              },
            ),

            SizedBox(height: 10,),

            Divider(
              color: Colors.black12,
              height: 5,
            ),

            SizedBox(height: 20,),

            TextFormField(
                textAlign: TextAlign.start,
                controller: instructionsTextController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Add any specific instructions for the driver"),
                  // hintText: 'Name',
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.grey),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null; // Return null for no error
                }),

            Divider(
              color: Colors.black12,
              height: 5,
            ),

            SizedBox(height: 20,),

            SizedBox(
              width: double.infinity,
              child: Text(
                "Frequency",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),

            SizedBox(height: 10,),

            Container(
              height: 100,
              child: GridView.builder(

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                  crossAxisCount: 2, // Number of columns
                ),
                itemCount: frequencyList.length,
                itemBuilder: (context, index) {
                  return  GestureDetector(
                    onTap: () {
                      setState(() {
                        index_color = index;
                      });
                    },
                    child: Card(
                      child: Container(
                        height: 40.0,
                        width: 100.0,
                        decoration: index_color == index
                            ? BoxDecoration(
                            border: Border.all(color: Constants.blueDarkColor),
                            borderRadius: BorderRadius.circular(4.0),
                            color: Constants.primaryColorTransparent
                        )
                            : BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4.0),
                          // color: Constants.primaryColorTransparent
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          frequencyList[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
