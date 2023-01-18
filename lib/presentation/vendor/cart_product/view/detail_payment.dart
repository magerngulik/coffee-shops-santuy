// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:testing_local_storage/bloc/product/product_bloc.dart';
import 'package:testing_local_storage/data/model/checkout_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPayment extends StatefulWidget {
  String? qrPayment;
  Checkout? checkout;
  DetailPayment({this.checkout, this.qrPayment, Key? key}) : super(key: key);

  @override
  State<DetailPayment> createState() => _DetailPaymentState();
}

class _DetailPaymentState extends State<DetailPayment> {
  @override
  Widget build(BuildContext context) {
    ProductBloc productBloc = context.read<ProductBloc>();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Container(
                height: 350.0,
                width: 350,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Scan di sini",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 300.0,
                        width: 300.0,
                        child: QrImage(
                          data: widget.qrPayment!,
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 350,
                  height: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Detail Pesanan",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: widget.checkout!.item!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item = widget.checkout!.item![index];
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: CachedNetworkImage(
                                      imageUrl: item.imageUrl!,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          Center(
                                              child: CircularProgressIndicator(
                                                  value: downloadProgress
                                                      .progress)),
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
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 350,
                  height: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Rincian Pembayaran",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Metode Pembayaran",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${widget.checkout!.payment}",
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Harga (${widget.checkout!.item!.length} barang)",
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Rp. ${widget.checkout!.total}",
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Belanja (${widget.checkout!.item!.length} barang)",
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Rp. ${widget.checkout!.total}",
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    productBloc.add(DeleteCheckoutEvent());
                    var count = 0;
                    Navigator.popUntil(context, (route) {
                      return count++ == 2;
                    });
                  },
                  child: const Text("Kembali"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
