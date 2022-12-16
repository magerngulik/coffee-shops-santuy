import 'package:google_fonts/google_fonts.dart';

import 'package:coffee_shops_santuy/util/color_util.dart';
import 'package:flutter/material.dart';

class CfCategoryPage extends StatelessWidget {
  CfCategoryPage({super.key});

  List itemCategory = [
    {
      "id": "1",
      "name": "Cappuccino",
      "image": "assets/cfmix/image/category/cappuccino.png"
    },
    {
      "id": "3",
      "name": "Coffee",
      "image": "assets/cfmix/image/category/coffee.png"
    },
    {
      "id": "2",
      "name": "English Tea",
      "image": "assets/cfmix/image/category/english_tea.png"
    },
    {
      "id": "2",
      "name": "Ice Coffee",
      "image": "assets/cfmix/image/category/ice_coffe.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 42.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Browse All Coffee:",
                    style: GoogleFonts.montserrat(
                      fontSize: 23.0,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  childAspectRatio: 149 / 212),
              itemCount: itemCategory.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = itemCategory[index];
                return Card(
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {},
                    splashColor: darkCoffee.withOpacity(0.5),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: darkCoffee.withOpacity(0.15),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.transparent,
                              child: Image.asset(
                                "${item['image']}",
                                width: 64.0,
                                height: 64.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text("${item['name']}",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18.0, color: darkCoffee)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
