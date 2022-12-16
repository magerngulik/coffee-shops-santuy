import 'package:coffee_shops_santuy/page/coffee_mix/cf_category_screens.dart';
import 'package:coffee_shops_santuy/page/coffee_mix/cf_home_screens.dart';
import 'package:coffee_shops_santuy/util/color_util.dart';
import 'package:flutter/material.dart';

class CfNavigator extends StatefulWidget {
  const CfNavigator({Key? key}) : super(key: key);

  @override
  State<CfNavigator> createState() => _CfNavigatorState();
}

class _CfNavigatorState extends State<CfNavigator> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: [
            CfHomePage(),
            CfCategoryPage(),
            Container(
              color: Colors.purple[100],
            ),
            Container(
              color: Colors.blue[100],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey,
          currentIndex: selectedIndex,
          selectedItemColor: darkCoffee,
          unselectedItemColor: lightMocha,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              label: "home",
              icon: ImageIcon(
                AssetImage(
                  "assets/cfmix/image/navbar/home.png",
                ),
                size: 24.0,
              ),
            ),
            BottomNavigationBarItem(
              label: "coffee",
              icon: ImageIcon(
                AssetImage(
                  "assets/cfmix/image/navbar/coffee.png",
                ),
                size: 24.0,
              ),
            ),
            BottomNavigationBarItem(
              label: "checkout",
              icon: ImageIcon(
                AssetImage(
                  "assets/cfmix/image/navbar/checkout.png",
                ),
                size: 24.0,
              ),
            ),
            BottomNavigationBarItem(
              label: "setting ",
              icon: ImageIcon(
                AssetImage(
                  "assets/cfmix/image/navbar/settings.png",
                ),
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
