import 'package:coffee_shops_santuy/page/coffee_mix/cf_detail_screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_shops_santuy/util/color_util.dart';
import 'package:flutter/material.dart';

class CfHomePage extends StatelessWidget {
  CfHomePage({super.key});

  List item = [
    {
      "id": "1",
      "name": "White Mocha",
      "image": "assets/cfmix/image/product/white_mocha.png"
    },
    {
      "id": "3",
      "name": "Cappochino",
      "image": "assets/cfmix/image/product/cappoccino.png"
    },
    {
      "id": "2",
      "name": "Latte",
      "image": "assets/cfmix/image/product/latte.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 47.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Good Morning",
                    style: GoogleFonts.montserrat(
                      fontSize: 36.0,
                    )),
                Text("Rahma Shafiyah",
                    style: GoogleFonts.montserrat(
                      fontSize: 36.0,
                    )),
                const SizedBox(
                  height: 35.0,
                ),
                Text("Good Morning Coffe:",
                    style: GoogleFonts.montserrat(
                      fontSize: 23.0,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            height: 220.0,
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView.builder(
              itemCount: item.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var itemProduct = item[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CfDetailPage(
                                  item: itemProduct,
                                )),
                      );
                    },
                    child: SizedBox(
                      width: 149.0,
                      height: 220,
                      child: Column(
                        children: [
                          Container(
                            height: 149.0,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  32.0,
                                ),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  "${itemProduct['image']}",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            height: 14,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${itemProduct['name']}",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: darkCoffee)),
                                const Spacer(),
                                const Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.red,
                                  size: 20.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            height: 14,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 15.0,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 15.0,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 15.0,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 15.0,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                  size: 15.0,
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.arrow_forward,
                                  color: darkCoffee,
                                  size: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 35.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Your Favorite Coffee:",
                style: GoogleFonts.montserrat(
                  fontSize: 23.0,
                )),
          ),
          const SizedBox(
            height: 31.0,
          ),
          Container(
            height: 100.0,
            width: 128,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/cfmix/image/no_favorite.png",
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(
            height: 11.0,
          ),
          Center(
            child: Text("Your Don't have favorites coffee yet",
                style:
                    GoogleFonts.montserrat(fontSize: 11.0, color: lightGrey)),
          ),
        ],
      ),
    );
  }
}
