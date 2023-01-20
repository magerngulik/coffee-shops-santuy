import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:coffee_shops_santuy/bloc/product/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_shops_santuy/data/model/card_model.dart';
import 'package:coffee_shops_santuy/data/model/checkout_model.dart';
import 'package:coffee_shops_santuy/presentation/vendor/cart_product/view/payment_product.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({Key? key}) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  int allTotal = 0;

  hitungTotal(CartModel item) {
    var total = item.qty! * int.parse(item.item!.price);
    return total;
  }

  //selected payment
  List<String> listPayment = <String>['Cash', 'Debit', 'Ovo', 'Dana', 'Gopay'];
  String paymentSelected = "";
  final _formKey = GlobalKey<FormState>();
  List<Item> itemChekout = [];

  @override
  Widget build(BuildContext context) {
    ProductBloc productBloc = context.read<ProductBloc>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Cart Product"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state.listCart.isEmpty) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 250,
                                height: 250,
                                child: Lottie.asset(
                                    "assets/lottie/no_data_checout.json")),
                            Text(
                              "Belum ada data checkout",
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.listCart.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      CartModel item = state.listCart[index];
                      var totalHarga = hitungTotal(item);
                      allTotal = allTotal + totalHarga as int;

                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: CachedNetworkImage(
                                imageUrl: item.item!.image,
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
                          title: Text(item.item!.name),
                          subtitle: Text(totalHarga.toString()),
                          trailing: SizedBox(
                            width: 120.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    productBloc.add(RemoveQtyEvent(item));
                                  },
                                  child: Card(
                                    color: Colors.grey[800],
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "${item.qty}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    productBloc.add(AddQtyEvent(item));
                                  },
                                  child: Card(
                                    color: Colors.grey[800],
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<ProductBloc, ProductState>(
        bloc: productBloc,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  double totalPoint = (allTotal / 100) * 10;
                  int total;
                  int newTotal = 0;
                  for (var i = 0; i < state.listCart.length; i++) {
                    var item = state.listCart[i];
                    total = item.qty! * int.parse(item.item!.price);
                    newTotal = total + newTotal;
                    itemChekout.add(Item(
                        id: item.id,
                        imageUrl: item.item!.image,
                        name: item.item!.name,
                        price: item.item!.price,
                        qty: item.qty));
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentProduct(
                              total: newTotal,
                              chekout: itemChekout,
                            )),
                  );
                  allTotal = 0;
                },
                child: const Text("Bayar"),
              ),
            ),
          );
        },
      ),
    );
  }
}
