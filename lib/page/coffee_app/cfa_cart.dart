// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:coffee_shops_santuy/bloc/checkout/checkout_bloc.dart';
import 'package:coffee_shops_santuy/services/checkout_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CfaCard extends StatefulWidget {
  const CfaCard({Key? key}) : super(key: key);

  @override
  State<CfaCard> createState() => _CfaCardState();
}

class _CfaCardState extends State<CfaCard> {
  @override
  Widget build(BuildContext context) {
    CheckoutBloc checkoutB = context.read<CheckoutBloc>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("Cart Product"),
          actions: const [],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
                BlocBuilder<CheckoutBloc, CheckoutState>(
                  bloc: checkoutB,
                  builder: (context, state) {
                    if (state.listCheckout.isEmpty) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                  "assets/lottie/no_data_checout.json"),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                "Belum ada data",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: state.listCheckout.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        CheckoutModel items = state.listCheckout[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              backgroundImage: NetworkImage(
                                "${items.itemChekout!.imageUrl}" ??
                                    "https://i.ibb.co/S32HNjD/no-image.jpg",
                              ),
                            ),
                            title: Text("${items.itemChekout!.name}"),
                            subtitle: Text("Rp. ${items.itemChekout!.price}"),
                            trailing: SizedBox(
                              width: 120.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blueGrey,
                                    radius: 12.0,
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {
                                          checkoutB.add(removeQuantityEvent(
                                              checkout: items));
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 9.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${items.jumlah}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.blueGrey,
                                    radius: 12.0,
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {
                                          checkoutB.add(AddQuantityEvent(
                                              checkout: items));
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 9.0,
                                        ),
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
          ],
        ));
  }
}
