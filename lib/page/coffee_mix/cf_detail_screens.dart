// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:coffee_shops_santuy/util/color_util.dart';

class CfDetailPage extends StatefulWidget {
  Map? item;
  CfDetailPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<CfDetailPage> createState() => _CfDetailPageState();
}

class _CfDetailPageState extends State<CfDetailPage> {
  List items = [
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

  // Map item = {
  //   "id": "1",
  //   "name": "White Mocha",
  //   "image": "assets/cfmix/image/product/white_mocha.png"
  // };

  List sizeCup = [24.0, 32.0, 50.0];

  double seletedCup = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 346.0,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(50.0),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    "${widget.item!['image']}",
                  ),
                  fit: BoxFit.fitWidth,
                )),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${widget.item!['name']}",
                            style: GoogleFonts.montserrat(
                                fontSize: 24.0,
                                color: darkCoffee,
                                fontWeight: FontWeight.w600)),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              size: 24.0,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              size: 24.0,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              size: 24.0,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              size: 24.0,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              size: 24.0,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text("\$30",
                        style: GoogleFonts.montserrat(
                            fontSize: 32.0,
                            color: darkGrey,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Details",
                        style: GoogleFonts.montserrat(
                            fontSize: 21.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    style: GoogleFonts.montserrat(
                        fontSize: 14.0,
                        color: lightGrey,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Sugar:",
                          style: GoogleFonts.montserrat(
                              fontSize: 21.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        width: 70.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            color: darkCoffee,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                color: lightGrey,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                color: lightGrey,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                color: lightGrey,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    color: lightGrey,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    color: lightGrey,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Size:",
                          style: GoogleFonts.montserrat(
                              fontSize: 21.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        width: 70.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Row(
                              children: List.generate(sizeCup.length, (index) {
                            var itemCup = sizeCup[index];

                            return GestureDetector(
                              onTap: () {
                                seletedCup = itemCup;
                                setState(() {});
                              },
                              child: Container(
                                height: itemCup,
                                width: 50,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                                child: Image.asset(
                                  "assets/cfmix/image/navbar/coffee.png",
                                  width: 64.0,
                                  height: 64.0,
                                  fit: BoxFit.fitHeight,
                                  color: (seletedCup == itemCup)
                                      ? darkCoffee
                                      : lightGrey,
                                ),
                              ),
                            );
                          })),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 153,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: BorderSide(color: darkCoffee, width: 2.0),
                              backgroundColor: Colors.white),
                          onPressed: () {},
                          child: Text("ADD TO CARD",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15.0,
                                  color: darkCoffee,
                                  fontWeight: FontWeight.w500))),
                    ),
                    const SizedBox(
                      width: 29.0,
                    ),
                    SizedBox(
                      width: 153,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: darkCoffee),
                          onPressed: () {},
                          child: Text("ADD TO CARD",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
