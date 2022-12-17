import 'package:coffee_shops_santuy/util/color_util.dart';
import 'package:flutter/material.dart';

import '../../services/services_google.dart';

class CfLoginSelectorScreens extends StatefulWidget {
  const CfLoginSelectorScreens({super.key});

  @override
  State<CfLoginSelectorScreens> createState() => _CfLoginSelectorScreensState();
}

class _CfLoginSelectorScreensState extends State<CfLoginSelectorScreens> {
  doLoginGoogle() async {
    try {
      await ServicesGoogleCF.signInWithGoogle();
      Navigator.pushNamed(context, "/navigator");
    } catch (e) {
      print("Detail Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 54.0,
          ),
          Container(
            height: 289.91,
            width: 345,
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/cfmix/image/illustration.png",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 109.0,
          ),
          Container(
            width: 344,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: darkCoffee,
                  shape: const RoundedRectangleBorder()),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/register");
              },
              child: const Text(
                "SIGNUP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            width: 344,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: darkCoffee),
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder()),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/login");
              },
              child: Text(
                "LOGIN",
                style: TextStyle(
                    color: darkCoffee,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(
            height: 19.0,
          ),
          Container(
            width: 344,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: darkCoffee),
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder()),
              onPressed: () {
                doLoginGoogle();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/cfmix/image/google.png",
                    width: 24.0,
                    height: 24.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    "COUNTINUE WITH GOOGLE",
                    style: TextStyle(
                        color: darkCoffee,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
