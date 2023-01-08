// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testing_local_storage/bloc/product/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_local_storage/data/model/product.dart';
import 'package:testing_local_storage/presentation/vendor/detail_product/view/detail_product.dart';

class SelectProduct extends StatefulWidget {
  String? category;
  SelectProduct({
    Key? key,
    this.category,
  }) : super(key: key);

  @override
  State<SelectProduct> createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductBloc productBloc = context.read<ProductBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.category}"),
        leading: IconButton(
          onPressed: () {
            productBloc.add(DelectSelectEvent());
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 24.0,
          ),
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: productBloc,
        builder: (context, state) {
          if (state.listSelected.isEmpty) {
            return SizedBox(
              height: 300,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        ),
                      ),
                      child: Lottie.asset("assets/lottie/foot_order.json"),
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            itemCount: state.listSelected.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Product item = state.listSelected[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  width: 300.0,
                  child: Row(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              item.image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.name,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailProduct(
                                                  item: item,
                                                )),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.shopping_cart,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                "Rp. ${item.price}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                item.submenu,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
