import "package:flutter/material.dart";

class TabBarViewPage extends StatefulWidget {
  @override
  _TabBarViewState createState() => _TabBarViewState();
}

class _TabBarViewState extends State<TabBarViewPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabs Test"),
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
                      Tab(text: "Price List"),
                      Tab(text: "Service Details"),
                ]),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          ListTile(
                              contentPadding: EdgeInsets.all(10),
                              // trailing: Text("+ Add"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("AED 65"),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(
                                            4.0),
                                        // color: Constants.primaryColorTransparent
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              // cost = cost + 65;
                                            });
                                          },
                                          child: Center(
                                              child:
                                              Text('+'))),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                              subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                          ),
                          Divider(),
                          ListTile(
                              contentPadding: EdgeInsets.all(10),
                              // trailing: Text("+ Add"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("AED 65"),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(
                                            4.0),
                                        // color: Constants.primaryColorTransparent
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                          },
                                          child: Center(
                                              child:
                                              Text('+'))),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                              subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                          ),
                          Divider(),
                          ListTile(
                              contentPadding: EdgeInsets.all(10),
                              // trailing: Text("+ Add"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("AED 65"),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(
                                            4.0),
                                        // color: Constants.primaryColorTransparent
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                          },
                                          child: Center(
                                              child:
                                              Text('+'))),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                              subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                          ),
                          Divider(),
                          ListTile(
                              contentPadding: EdgeInsets.all(10),
                              // trailing: Text("+ Add"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("AED 65"),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(
                                            4.0),
                                        // color: Constants.primaryColorTransparent
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                          },
                                          child: Center(
                                              child:
                                              Text('+'))),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                              subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                          ),
                          Divider(),
                          ListTile(
                              contentPadding: EdgeInsets.all(10),
                              // trailing: Text("+ Add"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("AED 65"),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(
                                            4.0),
                                        // color: Constants.primaryColorTransparent
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                          },
                                          child: Center(
                                              child:
                                              Text('+'))),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                              subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                          ),
                          Divider(),
                          ListTile(
                              contentPadding: EdgeInsets.all(10),
                              // trailing: Text("+ Add"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("AED 65"),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(
                                            4.0),
                                        // color: Constants.primaryColorTransparent
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                          },
                                          child: Center(
                                              child:
                                              Text('+'))),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                              subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                          ),
                          Divider(),
                          ListTile(
                              contentPadding: EdgeInsets.all(10),
                              // trailing: Text("+ Add"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("AED 65"),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(
                                            4.0),
                                        // color: Constants.primaryColorTransparent
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                          },
                                          child: Center(
                                              child:
                                              Text('+'))),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                              subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                          ),
                          Divider(),
                          ListTile(
                              contentPadding: EdgeInsets.all(10),
                              // trailing: Text("+ Add"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("AED 65"),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(
                                            4.0),
                                        // color: Constants.primaryColorTransparent
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                          },
                                          child: Center(
                                              child:
                                              Text('+'))),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                              subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                          ),
                          Divider(),
                          ListTile(
                              contentPadding: EdgeInsets.all(10),
                              // trailing: Text("+ Add"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("AED 65"),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(
                                            4.0),
                                        // color: Constants.primaryColorTransparent
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                          },
                                          child: Center(
                                              child:
                                              Text('+'))),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                              subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                          ),
                          Divider(),
                          ListTile(
                              contentPadding: EdgeInsets.all(10),
                              // trailing: Text("+ Add"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("AED 65"),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(
                                            4.0),
                                        // color: Constants.primaryColorTransparent
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                          },
                                          child: Center(
                                              child:
                                              Text('+'))),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                              subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                          ),
                          Divider(),
                          ListTile(
                              contentPadding: EdgeInsets.all(10),
                              // trailing: Text("+ Add"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("AED 65"),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(
                                            4.0),
                                        // color: Constants.primaryColorTransparent
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                          },
                                          child: Center(
                                              child:
                                              Text('+'))),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("Mixed Wash (Up to 6 kg)", style: TextStyle(color: Colors.black, fontSize: 16),),
                              subtitle: Text("Light and dark clothes washed together at 30°C. You can request 45°C instead.", style: TextStyle(fontSize: 14,))
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                    Text("Articles Body"),
                  ]),
                ),
              )
            ],
          ),
        ),
    );
  }
}