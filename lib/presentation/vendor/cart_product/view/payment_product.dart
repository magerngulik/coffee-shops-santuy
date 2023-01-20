// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_shops_santuy/bloc/product/product_bloc.dart';
import 'package:coffee_shops_santuy/data/model/checkout_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_shops_santuy/presentation/vendor/cart_product/view/detail_payment.dart';

class PaymentProduct extends StatefulWidget {
  List<Item> chekout;
  int total;
  PaymentProduct({required this.total, required this.chekout, Key? key})
      : super(key: key);

  @override
  State<PaymentProduct> createState() => _PaymentProductState();
}

class _PaymentProductState extends State<PaymentProduct> {
  final _formKey = GlobalKey<FormState>();
  List<String> listPayment = <String>['Cash', 'Debit', 'Ovo', 'Dana', 'Gopay'];
  String paymentSelected = "";
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.chekout.clear();
  }

  @override
  Widget build(BuildContext context) {
    ProductBloc productBloc = context.read<ProductBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pembayaran"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.chekout.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = widget.chekout[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: CachedNetworkImage(
                            imageUrl: item.imageUrl!,
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
                      title: Text("${item.name}"),
                      subtitle: Text("${item.price} x ${item.qty}"),
                      trailing: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${item.qty! * int.parse(item.price!)}",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
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
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10.0),
          height: 250.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                16.0,
              ),
            ),
          ),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Metode Pembayaran",
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonFormField<String>(
                        validator: (value) => value == null
                            ? 'Silahkan Pilih Metode Pembayaran'
                            : null,
                        hint: Text(
                          'Pilih Metode Pembayaran',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        decoration: InputDecoration(
                          errorStyle: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                                width: 2.0, color: Color(0xffE5E5E5)),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                                width: 2.0, color: Color(0xffE5E5E5)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                                width: 2.0, color: Color(0xffE5E5E5)),
                          ),
                        ),
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        items: listPayment
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          paymentSelected = value!;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Total Harga",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "${widget.total}",
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<ProductBloc, ProductState>(
                      bloc: productBloc,
                      builder: (context, state) {
                        return SizedBox(
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
                              if (_formKey.currentState!.validate()) {
                                double totalPoint = (widget.total / 100) * 10;
                                Checkout checkitem = Checkout(
                                    point: totalPoint.toInt(),
                                    item: widget.chekout,
                                    total: widget.total,
                                    payment: paymentSelected,
                                    vendor: Vendor(
                                        id: FirebaseAuth
                                            .instance.currentUser!.uid,
                                        email: FirebaseAuth
                                            .instance.currentUser!.email,
                                        name: FirebaseAuth.instance.currentUser!
                                            .displayName));

                                var qrCodeString = jsonEncode(checkitem);
                                // await showCustomDialog(
                                //   globalContext: context,
                                //   title: "Order success",
                                //   children: [
                                //     Center(
                                //       child: SizedBox(
                                //         height: 250.0,
                                //         width: 250.0,
                                //         child: QrImage(
                                //           data: qrCodeString,
                                //           version: QrVersions.auto,
                                //           size: 200.0,
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // );
                                // productBloc.add(DeleteCheckoutEvent());

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPayment(
                                            qrPayment: qrCodeString,
                                            checkout: checkitem,
                                          )),
                                );
                              }
                            },
                            child: const Text("Bayar"),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
