import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:coffee_shops_santuy/data/model/checkout_model.dart';
import 'package:coffee_shops_santuy/data/model/user_model.dart';
import 'package:coffee_shops_santuy/data/provider/user_service.dart';
import 'package:coffee_shops_santuy/presentation/member/history/view/history_member.dart';
import 'package:coffee_shops_santuy/presentation/member/profile_user/view/profile_user.dart';
import 'package:coffee_shops_santuy/util/color/color_util.dart';
import 'package:coffee_shops_santuy/util/shared/widget/show_qrcode_scanner/show_qrcode_scanner.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          height: 150.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/image/user_background.png",
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              "Coffe Santuy",
              style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 20.0,
            ),
            StreamBuilder<DocumentSnapshot<Object?>>(
              stream: userCollection.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return const Text("Error");
                if (!snapshot.hasData) return const Text("No Data");
                Map<String, dynamic> item =
                    (snapshot.data!.data() as Map<String, dynamic>);
                item["id"] = snapshot.data!.id;
                var userItem = UserModel.fromMap(item);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: darkCoffee,
                      radius: 31,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 28.0,
                        backgroundImage: NetworkImage(
                          "${userItem.photo}",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${userItem.name}",
                          style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${userItem.email}",
                          style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16.0,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100.0,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                            28.0,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50.0,
                                width: 150,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    StreamBuilder<DocumentSnapshot<Object?>>(
                                      stream: userCollection.snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          return const Text("Error");
                                        }
                                        if (!snapshot.hasData) {
                                          return const Text("No Data");
                                        }
                                        Map<String, dynamic> item =
                                            (snapshot.data!.data()
                                                as Map<String, dynamic>);
                                        item["id"] = snapshot.data!.id;
                                        UserModel useritem =
                                            UserModel.fromMap(item);
                                        return Text(
                                          "${useritem.point}",
                                          style: GoogleFonts.montserrat(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        );
                                      },
                                    ),
                                    Text(
                                      "Total Point",
                                      style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 50.0,
                                width: 150,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection("transaction")
                                          .where("id_costumer",
                                              isEqualTo: FirebaseAuth
                                                  .instance.currentUser!.uid)
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          return const Text("Error");
                                        }
                                        if (snapshot.data == null) {
                                          return Container();
                                        }
                                        if (snapshot.data!.docs.isEmpty) {
                                          return Text(
                                            "0",
                                            style: GoogleFonts.montserrat(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          );
                                        }
                                        final data = snapshot.data!;

                                        return Text(
                                          "${data.docs.length}",
                                          style: GoogleFonts.montserrat(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        );
                                      },
                                    ),
                                    Text(
                                      "Jumlah Transaksi",
                                      style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: darkCoffee,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(
                            28.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 400.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            28.0,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 70.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HistoryMember()),
                                        );
                                      },
                                      child: Container(
                                        height: 100.0,
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: darkCoffee,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              16.0,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            "assets/image/clock.png",
                                            width: 70.0,
                                            height: 70.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "History Transaksi",
                                      style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProfileUser()),
                                        );
                                      },
                                      child: Container(
                                        height: 100.0,
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: darkCoffee,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              16.0,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            "assets/image/resume.png",
                                            width: 70.0,
                                            height: 70.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Profile",
                                      style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.symmetric(horizontal: 20.0),
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "Last Order",
                          //         style: GoogleFonts.montserrat(
                          //           textStyle:
                          //               Theme.of(context).textTheme.headline4,
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 20.0,
                          // ),
                          // Container(
                          //   padding:
                          //       const EdgeInsets.symmetric(horizontal: 20.0),
                          //   height: 130.0,
                          //   width: MediaQuery.of(context).size.width,
                          //   child: StreamBuilder<QuerySnapshot>(
                          //     stream: FirebaseFirestore.instance
                          //         .collection("transaction")
                          //         .where("id_costumer",
                          //             isEqualTo: FirebaseAuth
                          //                 .instance.currentUser!.uid)
                          //         .snapshots(),
                          //     builder: (context, snapshot) {
                          //       if (snapshot.hasError) {
                          //         return const Text("Error");
                          //       }
                          //       if (snapshot.data == null) return Container();
                          //       if (snapshot.data!.docs.isEmpty) {
                          //         return Center(
                          //           child: Container(
                          //             width: MediaQuery.of(context).size.width,
                          //             height:
                          //                 MediaQuery.of(context).size.height /
                          //                     2,
                          //             decoration: const BoxDecoration(
                          //               borderRadius: BorderRadius.all(
                          //                 Radius.circular(
                          //                   16.0,
                          //                 ),
                          //               ),
                          //             ),
                          //             child: Column(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.center,
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.center,
                          //               children: [
                          //                 SizedBox(
                          //                     width: 110,
                          //                     height: 110,
                          //                     child: Lottie.asset(
                          //                         "assets/lottie/empty-data-bottol.json")),
                          //                 Text(
                          //                   "Belum ada data transaksi",
                          //                   style: GoogleFonts.lato(
                          //                     textStyle: Theme.of(context)
                          //                         .textTheme
                          //                         .headline4,
                          //                     fontSize: 12,
                          //                     fontWeight: FontWeight.bold,
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         );
                          //       }
                          //       final data = snapshot.data!;

                          //       return ListView.builder(
                          //         itemCount: data.docs.length,
                          //         scrollDirection: Axis.horizontal,
                          //         itemBuilder: (context, index) {
                          //           Map<String, dynamic> item =
                          //               (data.docs[index].data()
                          //                   as Map<String, dynamic>);
                          //           item["id"] = data.docs[index].id;
                          //           TransactionUser itemT =
                          //               TransactionUser.fromJson(item);
                          //           var menu = itemT.detail!.item!.first;
                          //           return SizedBox(
                          //             height: 130,
                          //             child: Column(
                          //               children: [
                          //                 Container(
                          //                   width: 100.0,
                          //                   height: 100,
                          //                   margin: const EdgeInsets.symmetric(
                          //                       horizontal: 10.0),
                          //                   decoration: BoxDecoration(
                          //                     image: DecorationImage(
                          //                       image: NetworkImage(
                          //                         "${menu!.imageUrl}",
                          //                       ),
                          //                       fit: BoxFit.cover,
                          //                     ),
                          //                     borderRadius:
                          //                         const BorderRadius.all(
                          //                       Radius.circular(16.0),
                          //                     ),
                          //                     color: Colors.blue[400],
                          //                   ),
                          //                 ),
                          //                 const SizedBox(
                          //                   height: 10.0,
                          //                 ),
                          //                 Text(
                          //                   "${menu.name}",
                          //                   style: GoogleFonts.montserrat(
                          //                     textStyle: Theme.of(context)
                          //                         .textTheme
                          //                         .headline4,
                          //                     fontSize: 10,
                          //                     fontWeight: FontWeight.bold,
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           );
                          //         },
                          //       );
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 150,
                    right: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            String qrCode;
                            qrCode = await showQrcodeScanner(context);
                            // print("Code data: $qrCode");
                            var data = Checkout.fromJson(jsonDecode(qrCode));
                            // print("data hasil $data");
                            await FirebaseFirestore.instance
                                .collection("transaction")
                                .add({
                              "detail": data.toJson(),
                              "id_costumer":
                                  FirebaseAuth.instance.currentUser!.uid,
                              "name_costumer": FirebaseAuth
                                  .instance.currentUser!.displayName,
                              "create_at": DateTime.now()
                            });
                            int newPoint = data.point!;
                            // double inputPoint = newPoint.toDouble();
                            UserService.updatePoint(point: newPoint);
                          },
                          child: Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  16.0,
                                ),
                              ),
                              image: const DecorationImage(
                                image: AssetImage(
                                  "assets/image/qr-code.png",
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                              border: Border.all(
                                width: 2.0,
                                color: darkCoffee,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Scan QR",
                          style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
