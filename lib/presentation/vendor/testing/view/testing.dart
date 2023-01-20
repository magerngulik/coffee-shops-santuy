import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shops_santuy/bloc/visible/visible_cubit.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:coffee_shops_santuy/data/model/transaction_model.dart';
import 'package:coffee_shops_santuy/data/model/user_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportPenjualan extends StatefulWidget {
  const ReportPenjualan({Key? key}) : super(key: key);

  @override
  State<ReportPenjualan> createState() => _ReportPenjualanState();
}

class _ReportPenjualanState extends State<ReportPenjualan> {
  @override
  Widget build(BuildContext context) {
    VisibleCubit status = context.read<VisibleCubit>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Report Penjualan",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            status.changeVisible();
          },
          icon: const Icon(
            Icons.menu,
            size: 24.0,
          ),
        ),
      ),
      body: ListView(
        children: [
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
            stream: FirebaseFirestore.instance.collection("users").snapshots(),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Semua Transaksi",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("transaction")
                  .orderBy("create_at", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return const Text("Error");
                if (snapshot.data == null) return Container();
                if (snapshot.data!.docs.isEmpty) {
                  return const Text("No Data");
                }
                final data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> item =
                        (data.docs[index].data() as Map<String, dynamic>);
                    item["id"] = data.docs[index].id;

                    TransactionUser itemT = TransactionUser.fromJson(item);
                    DateTime dataTime = itemT.createAt!.toDate();
                    String date = DateFormat.yMMMd().format(DateTime.now());

                    return ExpansionTile(
                      leading: Text(
                        "${index + 1}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      title: Text(
                        date,
                      ),
                      children: <Widget>[
                        Column(
                          children: List.generate(itemT.detail!.item!.length,
                              (index) {
                            var item = itemT.detail!.item![index];

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
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total Harga: ",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${itemT.detail!.total}",
                                style: const TextStyle(
                                  fontSize: 17.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
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
