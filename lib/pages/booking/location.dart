import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundryservice/utils/constants.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  final streetTextController = TextEditingController();

  List locationTypeList = ['Home', 'Office', 'Hotle'];
  int index_color = 0;

  var selectedLoaction = null;

  List<DropdownMenuItem<String>> menuItems = [];

  List<DropdownMenuItem<String>> get dropdownItems {

    for(int i = 1; i<11; i++)
    {
      // print(brand.logo2.toString());

      menuItems.add(

          DropdownMenuItem(child: Text("Locaion $i"),
              // Row(
          //   children: [
          //     // Image.asset("assets/images/add_icon.png", height: 20, width: 24,),
          //     // SvgPicture.asset("assets/images/location_arrow.svg", height: 20, width: 24,),
          //     // SizedBox(width: 10,),
          //     Text("Locaion $i"),
          //   ],
          // ),
              value: "Location$i")

      );

    }

    // [
    //   DropdownMenuItem(child: Row(
    //     children: [
    //       Image.asset("assets/images/add_icon.png", height: 20, width: 20,),
    //       SizedBox(width: 10,),
    //       Text("Bandu Khan"),
    //     ],
    //   ), value: "Bandu Khan"),
    //   DropdownMenuItem(child: Row(
    //     children: [
    //       Image.asset("assets/images/add_icon.png", height: 20, width: 24,),
    //       SizedBox(width: 10,),
    //       Text("Fadi's"),
    //     ],
    //   ), value: "Fadi's"),
    //   DropdownMenuItem(child: Row(
    //     children: [
    //       Image.asset("assets/images/add_icon.png", height: 20, width: 24,),
    //       SizedBox(width: 10,),
    //       Text("Shell - new"),
    //     ],
    //   ), value: "Shell - new"),
    // ];
    return menuItems;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,

        body: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 0),
            child: Column(children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Set Your Adress",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 20,),

              DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    label: Text("Select Address"),
                    // hintText: 'Select Department',
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.grey),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    fillColor: Colors.white,
                  ),
                  validator: (value) => value == null ? "Select a Address" : null,
                  dropdownColor: Colors.white,
                  value: selectedLoaction,
                  onChanged: (newValue) {
                    print("SelectedValue: $newValue");
                    // setState(() {
                    //   selectedBrand = newValue!;
                    // });
                  },
                  items: dropdownItems),
              SizedBox(height: 10,),

              TextFormField(
                  textAlign: TextAlign.start,
                  controller: streetTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text("Enter Address Details"),
                    // hintText: 'Name',
                    hintStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1,
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
              Container(
                  margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                  alignment: Alignment.topLeft,
                  child: Text("Select Address Type", style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),)),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(3, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            index_color = index;
                          });
                        },
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
                            locationTypeList[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),

              SizedBox(height: 20,),
              Row(
                children: [

                  SvgPicture.asset("assets/images/location_arrow.svg"),

                  Text(
                    "Search Map",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),

              Expanded(child:
              Container(child:
              OpenStreetMapSearchAndPick(
                  center: LatLong(25.1972, 55.2744),
                  buttonColor: Colors.blue,
                  buttonText: 'Looks Good',
                  onPicked: (pickedData) {
                    print(pickedData.latLong.latitude);
                    print(pickedData.latLong.longitude);
                    print(pickedData.address);
                  }),))

            ])));
  }
}



