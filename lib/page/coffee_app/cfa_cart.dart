// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:coffee_shops_santuy/bloc/checkout/checkout_bloc.dart';
import 'package:coffee_shops_santuy/services/checkout_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        appBar: AppBar(
          title: const Text("Cart Product"),
          actions: const [],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                BlocBuilder<CheckoutBloc, CheckoutState>(
                  bloc: checkoutB,
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.listCheckout.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        CheckoutModel items = state.listCheckout[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              backgroundImage: NetworkImage(
                                "${items.itemChekout?.first.imageUrl}" ??
                                    "https://i.ibb.co/S32HNjD/no-image.jpg",
                              ),
                            ),
                            title: Text("${items.itemChekout?.first.name}"),
                            subtitle:
                                Text("Rp. ${items.itemChekout?.first.price}"),
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
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 9.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.blueGrey,
                                    radius: 12.0,
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {},
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
