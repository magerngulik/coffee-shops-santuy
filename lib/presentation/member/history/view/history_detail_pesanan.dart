// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:testing_local_storage/data/model/transaction_model.dart';

class HistoryDetailPesanan extends StatefulWidget {
  TransactionUser? item;
  HistoryDetailPesanan({this.item, Key? key}) : super(key: key);

  @override
  State<HistoryDetailPesanan> createState() => _HistoryDetailPesananState();
}

class _HistoryDetailPesananState extends State<HistoryDetailPesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pesanan"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          "Detail Product",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: List.generate(
                              widget.item!.detail!.item!.length, (index) {
                            var item = widget.item!.detail!.item![index];
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(
                                top: 10.0,
                              ),
                              child: Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 50.0,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  "${item!.imageUrl}",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(
                                                  8.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${item.name}",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "${item.qty} x ${item.price}",
                                                  style: const TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Total Harga",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          Text(
                                            "${item.qty! * int.parse(item.price!)}",
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Rincian Pembeyaran",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
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
                                "${widget.item!.detail!.payment}",
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
                                "Total Harga (${widget.item!.detail!.item!.length} barang)",
                                style: const TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Rp. ${widget.item!.detail!.total}",
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
                                "Total Belanja (${widget.item!.detail!.item!.length} barang)",
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Rp. ${widget.item!.detail!.total}",
                                style: const TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
