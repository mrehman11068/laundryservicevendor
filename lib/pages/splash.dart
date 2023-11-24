import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/helper.dart';
import '../widgets/app_button.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    top: 120.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      height: 150.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/cloth_faded.png"),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Image.asset(
                        "assets/images/illustration.png",
                        scale: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 24.0,
              ),
              decoration: BoxDecoration(
                color: Constants.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  Text(
                    "Welcome to Laundry Service Orders!",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(19, 22, 33, 1),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "This app will serve as order management system for laundry service.",
                    style: TextStyle(
                      color: Color.fromRGBO(74, 77, 84, 1),
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  // Let's create a generic button widget
                  AppButton(
                    text: "Log In",
                    type: ButtonType.PRIMARY,
                    onPressed: () {
                      nextScreen(context, "/login");
                      // nextScreen(context, "/dashboard");
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
