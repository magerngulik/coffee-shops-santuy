import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:testing_local_storage/bloc/product/product_bloc.dart';
import 'package:testing_local_storage/data/model/card_model.dart';
import 'package:testing_local_storage/data/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProduct extends StatefulWidget {
  Product? item;
  DetailProduct({this.item, Key? key}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  var itemSize = [
    {
      "name": "Small",
      "image": "assets/product/image/small.png",
      "image_food": "assets/product/image/food_small.png",
    },
    {
      "name": "Medium",
      "image": "assets/product/image/medium.png",
      "image_food": "assets/product/image/food_medium.png",
    },
    {
      "name": "Large",
      "image": "assets/product/image/large.png",
      "image_food": "assets/product/image/food_large.png",
    },
  ];

  String? selected;

  var itemTopping = ["Boba", "Almond", "Cheese", "Oat"];
  String? selectedToping;

  int totalPrice = 0;
  int qty = 1;

  addQty() {
    qty += 1;
    totalPrice = int.parse(widget.item!.price) * qty;
    setState(() {});
  }

  removeQty() {
    if (qty < 2) {
      return;
    }
    qty -= 1;
    totalPrice = int.parse(widget.item!.price) * qty;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    totalPrice = int.parse(widget.item!.price);
  }

  @override
  Widget build(BuildContext context) {
    ProductBloc productBloc = context.read<ProductBloc>();
    return Scaffold(
      appBar: AppBar(
        actions: const [],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Column(
            children: [
              Container(
                height: 150.0,
                width: 100,
                decoration: const BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.item!.image,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                widget.item!.name,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  widget.item!.description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            height: 300.0,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Drink Size",
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(itemSize.length, (index) {
                    var itemSelected = itemSize[index];
                    return InkWell(
                      onTap: () {
                        selected = itemSelected["name"];
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 45.0,
                              backgroundColor:
                                  (selected == itemSelected["name"])
                                      ? Colors.orange[100]
                                      : Colors.white,
                              child: Image.asset(
                                widget.item!.category == "Food"
                                    ? "${itemSelected["image_food"]}"
                                    : "${itemSelected["image"]}",
                                width: 64.0,
                                height: 64.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Text(
                              "${itemSelected["name"]}",
                              style: GoogleFonts.montserrat(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                Text(
                  "Toppings",
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 40.0,
                  child: ListView.builder(
                    itemCount: itemTopping.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var itemToppingSelected = itemTopping[index];
                      return InkWell(
                        onTap: () {
                          selectedToping = itemToppingSelected;
                          setState(() {});
                        },
                        child: Container(
                          width: 100.0,
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            color: (selectedToping == itemToppingSelected)
                                ? Colors.orange[100]
                                : Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              itemToppingSelected,
                              style: const TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100.0,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              30.0,
            ),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      removeQty();
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "$qty",
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  IconButton(
                    onPressed: () {
                      addQty();
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    if (selected == "" || selected == null) {
                      Flushbar(
                              message: "Ukuran Belum pilih!",
                              icon: Icon(
                                Icons.info_outline,
                                size: 28.0,
                                color: Colors.red[300],
                              ),
                              flushbarPosition: FlushbarPosition.TOP,
                              duration: const Duration(seconds: 3),
                              leftBarIndicatorColor: Colors.red[300],
                              flushbarStyle: FlushbarStyle.GROUNDED)
                          .show(context);
                      return;
                    }
                    if (selectedToping == "" || selectedToping == null) {
                      Flushbar(
                              message: "Toping belum di pilih",
                              icon: Icon(
                                Icons.info_outline,
                                size: 28.0,
                                color: Colors.red[300],
                              ),
                              flushbarPosition: FlushbarPosition.TOP,
                              duration: const Duration(seconds: 3),
                              leftBarIndicatorColor: Colors.red[300],
                              flushbarStyle: FlushbarStyle.GROUNDED)
                          .show(context);
                      return;
                    }

                    productBloc.add(AddCartEvent(CartModel(
                      id: Random().nextInt(999).toString(),
                      createdAt: DateTime.now(),
                      drinkSize: selected,
                      item: widget.item,
                      qty: qty,
                      topping: selectedToping,
                    )));
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Add to bag Rp. $totalPrice",
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
