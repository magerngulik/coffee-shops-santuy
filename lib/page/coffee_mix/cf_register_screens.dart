import 'package:coffee_shops_santuy/util/color_util.dart';
import 'package:flutter/material.dart';

class CfRegisterScreens extends StatelessWidget {
  const CfRegisterScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 54.0,
          ),
          Container(
            height: 227,
            width: 271,
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/cfmix/image/illustration.png",
                ),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w500,
                    color: darkCoffee),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: darkCoffee, width: 1.0)),
                labelStyle: const TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: darkCoffee, width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: darkCoffee, width: 1.0)),
              ),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: darkCoffee, width: 1.0)),
                labelStyle: const TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: darkCoffee, width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: darkCoffee, width: 1.0)),
              ),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: darkCoffee, width: 1.0)),
                labelStyle: const TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: darkCoffee, width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: darkCoffee, width: 1.0)),
              ),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Container(
            width: 112,
            height: 38,
            margin: const EdgeInsets.symmetric(horizontal: 131.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: darkCoffee,
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              child: const Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 38.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: darkCoffee),
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder()),
              onPressed: () {
                Navigator.pushNamed(context, "/second");
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
          const SizedBox(
            height: 39.0,
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, "/login"),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do You Have an Account? Login",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: darkGrey,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
