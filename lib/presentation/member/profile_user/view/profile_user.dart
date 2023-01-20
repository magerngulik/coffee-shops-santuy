import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:coffee_shops_santuy/bloc/auth/auth_bloc.dart';
import 'package:coffee_shops_santuy/data/model/user_model.dart';
import 'package:coffee_shops_santuy/data/provider/user_service.dart';
import 'package:coffee_shops_santuy/presentation/auth/auth_user.dart';
import 'package:coffee_shops_santuy/presentation/member/edit_user/view/edit_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({Key? key}) : super(key: key);

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = context.read<AuthBloc>();

    return SafeArea(
      child: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is UnAuthenticated) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const AuthUserFirebase()));
          }
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            title: const Text(
              "Profile User",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  await showDialog<void>(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Keluar'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text('Apakah anda yakin ingin keluar?'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Tidak"),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                            ),
                            onPressed: () {
                              authBloc.add(SignOutRequested());
                            },
                            child: const Text("Iya"),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.rightFromBracket,
                  size: 24.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              StreamBuilder<DocumentSnapshot<Object?>>(
                stream: userCollection.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (!snapshot.hasData) return const Text("No Data");
                  Map<String, dynamic> item =
                      (snapshot.data!.data() as Map<String, dynamic>);
                  item["id"] = snapshot.data!.id;
                  var userItem = UserModel.fromMap(item);
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/image/bg-coffee.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50.0,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                    "${userItem.photo}",
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 15,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EditUser(
                                                  user: userItem,
                                                )),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.edit_note_outlined,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "${userItem.name}",
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "${userItem.email}",
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              //menu
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.2,
              //   width: MediaQuery.of(context).size.width,
              //   margin: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Favorite Menu",
              //         style: GoogleFonts.lato(
              //           textStyle: Theme.of(context).textTheme.headline4,
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 10.0,
              //       ),
              //       SizedBox(
              //         height: 100.0,
              //         child: ListView.builder(
              //           itemCount: 3,
              //           scrollDirection: Axis.horizontal,
              //           itemBuilder: (context, index) {
              //             return Container(
              //               width: 100.0,
              //               height: 100,
              //               padding: const EdgeInsets.all(10.0),
              //               margin: const EdgeInsets.only(right: 10.0),
              //               decoration: BoxDecoration(
              //                 color: Colors.blue[400],
              //                 borderRadius: const BorderRadius.all(
              //                   Radius.circular(16.0),
              //                 ),
              //               ),
              //               child: Center(
              //                 child: Text(
              //                   "Sample Menu  ${index + 1}",
              //                   textAlign: TextAlign.center,
              //                   style: const TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 11.0,
              //                   ),
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.2,
              //   width: MediaQuery.of(context).size.width,
              //   margin: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Last Order",
              //         style: GoogleFonts.lato(
              //           textStyle: Theme.of(context).textTheme.headline4,
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 10.0,
              //       ),
              //       SizedBox(
              //         height: 100.0,
              //         child: ListView.builder(
              //           itemCount: 3,
              //           scrollDirection: Axis.horizontal,
              //           itemBuilder: (context, index) {
              //             return Container(
              //               width: 100.0,
              //               height: 100,
              //               padding: const EdgeInsets.all(10.0),
              //               margin: const EdgeInsets.only(right: 10.0),
              //               decoration: BoxDecoration(
              //                 color: Colors.blue[400],
              //                 borderRadius: const BorderRadius.all(
              //                   Radius.circular(16.0),
              //                 ),
              //               ),
              //               child: Center(
              //                 child: Text(
              //                   "Last Order  ${index + 1}",
              //                   textAlign: TextAlign.center,
              //                   style: const TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 11.0,
              //                   ),
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
