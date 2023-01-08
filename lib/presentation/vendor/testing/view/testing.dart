// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_local_storage/bloc/product/product_bloc.dart';
import 'package:testing_local_storage/data/model/product.dart';
import 'package:testing_local_storage/presentation/vendor/add_data/view/add_data.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({Key? key}) : super(key: key);

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  @override
  Widget build(BuildContext context) {
    ProductBloc productB = context.read<ProductBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddData()),
              );
            },
            icon: const Icon(
              Icons.add,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              bloc: productB,
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.listData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Product item = state.listData[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          backgroundImage: NetworkImage(
                            item.image,
                          ),
                        ),
                        title: Text(item.submenu),
                        subtitle: Text(item.category),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
