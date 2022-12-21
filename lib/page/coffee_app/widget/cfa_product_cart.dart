import 'dart:math';

import 'package:coffee_shops_santuy/bloc/checkout/checkout_bloc.dart';
import 'package:coffee_shops_santuy/services/checkout_model.dart';
import 'package:coffee_shops_santuy/services/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCart extends StatefulWidget {
  ProductModel? cake;

  ProductCart({this.cake, Key? key}) : super(key: key);

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    var hg = MediaQuery.of(context).size.height;
    var we = MediaQuery.of(context).size.width;

    CheckoutBloc checkoutB = context.read<CheckoutBloc>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0.r,
            blurRadius: 5.0.r,
          )
        ],
        color: Colors.white,
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0.h,
                width: 150.0.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.cake!.imageUrl ??
                        "https://i.ibb.co/S32HNjD/no-image.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10.0,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        (widget.cake!.isFavorite ?? false)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: Colors.red,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                widget.cake!.name ?? "product name",
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  widget.cake!.descripton ??
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                  style: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: we * 0.35,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  label: const Text("Add to cart"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    checkoutB.add(AddCheckoutEvent(CheckoutModel(
                        id: Random().nextInt(990),
                        date: DateTime.now(),
                        itemChekout: [widget.cake!])));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
