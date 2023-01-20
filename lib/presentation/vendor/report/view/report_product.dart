import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:coffee_shops_santuy/bloc/visible/visible_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_shops_santuy/data/model/transaction_model.dart';
import 'package:coffee_shops_santuy/data/model/user_model.dart';
import 'package:coffee_shops_santuy/util/shared/util/rupiahFormater.dart';

class ReportProduct extends StatefulWidget {
  const ReportProduct({Key? key}) : super(key: key);

  @override
  State<ReportProduct> createState() => _ReportProductState();
}

class _ReportProductState extends State<ReportProduct> {
  @override
  Widget build(BuildContext context) {
    VisibleCubit status = context.read<VisibleCubit>();
    return ConnectivityWidgetWrapper(
      offlineWidget: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 250,
                  height: 250,
                  child: Lottie.asset(
                    "assets/lottie/no-internet.json",
                  )),
              const Text(
                'Hubungkan dengan koneksi internet untuk mengakses menu ini!',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              status.changeVisible();
            },
          ),
          title: const Text(
            "Report Menu",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("transaction")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return const Text("Error");
                        if (snapshot.data == null) return Container();
                        if (snapshot.data!.docs.isEmpty) {
                          return const Text("No Data");
                        }

                        final data = snapshot.data!;
                        List<TransactionUser> transactionUser = [];
                        for (var i = 0; i < data.docs.length; i++) {
                          Map<String, dynamic> item =
                              (data.docs[i].data() as Map<String, dynamic>);
                          item["id"] = data.docs[i].id;
                          transactionUser.add(TransactionUser.fromJson(item));
                        }
                        return Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Orders",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${transactionUser.length}",
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.list,
                                    size: 24.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return const Text("Error");
                        if (snapshot.data == null) return Container();
                        if (snapshot.data!.docs.isEmpty) {
                          return const Text("No Data");
                        }

                        final data = snapshot.data!;
                        List<UserModel> userModel = [];
                        for (var i = 0; i < data.docs.length; i++) {
                          Map<String, dynamic> item =
                              (data.docs[i].data() as Map<String, dynamic>);
                          item["id"] = data.docs[i].id;
                          userModel.add(UserModel.fromMap(item));
                        }

                        return Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Customers",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${userModel.length}",
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.people,
                                    size: 24.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("transaction")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return const Text("Error");
                        if (snapshot.data == null) return Container();
                        if (snapshot.data!.docs.isEmpty) {
                          return const Text("No Data");
                        }

                        final data = snapshot.data!;
                        List<TransactionUser> transactionUser = [];
                        TransactionUser singleData;
                        int total = 0;
                        for (var i = 0; i < data.docs.length; i++) {
                          Map<String, dynamic> item =
                              (data.docs[i].data() as Map<String, dynamic>);
                          item["id"] = data.docs[i].id;
                          transactionUser.add(TransactionUser.fromJson(item));
                          singleData = TransactionUser.fromJson(item);
                          total = total + singleData.detail!.total!;
                        }
                        return Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Your balance",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            CurrencyFormat.convertToIdr(
                                                total, 2),
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.wallet,
                                    size: 24.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "All Transaction",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          12.0,
                        ),
                      ),
                    ),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("transaction")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return const Text("Error");
                        if (snapshot.data == null) return Container();
                        if (snapshot.data!.docs.isEmpty) {
                          return const Text("No Data");
                        }
                        final data = snapshot.data!;
                        List<TransactionUser> transactionUser = [];
                        TransactionUser singleData;
                        int total = 0;
                        for (var i = 0; i < data.docs.length; i++) {
                          Map<String, dynamic> item =
                              (data.docs[i].data() as Map<String, dynamic>);
                          item["id"] = data.docs[i].id;
                          transactionUser.add(TransactionUser.fromJson(item));
                          singleData = TransactionUser.fromJson(item);
                          total = total + singleData.detail!.total!;
                        }
                        return Container();

                        // return ExpansionPanelList(
                        //     children: transactionUser
                        //         .map((item) => ExpansionPanel(
                        //               headerBuilder: (context, isExpanded) {
                        //                 return ListTile(
                        //                     title: Text(
                        //                   "${item.createAt}",
                        //                   style: const TextStyle(
                        //                     fontSize: 20.0,
                        //                   ),
                        //                 ));
                        //               },
                        //               body: const ListTile(
                        //                 title: Text(
                        //                   "text",
                        //                   style: TextStyle(
                        //                     fontSize: 20.0,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ))
                        //         .toList());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
