import 'package:coffee_shops_santuy/bloc/product/product_bloc.dart';
import 'package:coffee_shops_santuy/services/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCartProses extends StatefulWidget {
  ProductModel? cake;

  ProductCartProses({this.cake, Key? key}) : super(key: key);

  @override
  State<ProductCartProses> createState() => _ProductCartProsesState();
}

class _ProductCartProsesState extends State<ProductCartProses> {
  @override
  Widget build(BuildContext context) {
    ProductBloc productB = context.read<ProductBloc>();

    var hg = MediaQuery.of(context).size.height;
    var we = MediaQuery.of(context).size.width;

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
                        "assets/cfmix/image/product/cappoccino.png"),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Edit"),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    onPressed: () async {
                      bool confirm = false;
                      await showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Hapus Data'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const <Widget>[
                                  Text(
                                      'Apakah anda yakin untuk menghapus data ini?'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No"),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                onPressed: () {
                                  confirm = true;

                                  Navigator.pop(context);
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          );
                        },
                      );

                      if (confirm) {
                        productB.add(DeleteProductEvent(product: widget.cake!));
                      }
                    },
                    child: const Text("Delete"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
