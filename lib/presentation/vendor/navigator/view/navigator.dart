import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:testing_local_storage/bloc/auth/auth_bloc.dart';
import 'package:testing_local_storage/bloc/visible/visible_cubit.dart';
import 'package:testing_local_storage/presentation/auth/auth_user.dart';
import 'package:testing_local_storage/presentation/vendor/home/view/home.dart';
import 'package:testing_local_storage/presentation/vendor/menu_management/view/menu_management.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  List item = [
    {"id": 0, "icon": FontAwesomeIcons.bowlFood},
    {"id": 1, "icon": FontAwesomeIcons.bars},
    // {"id": 2, "icon": FontAwesomeIcons.file},
    // {"id": 3, "icon": FontAwesomeIcons.user},
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    VisibleCubit status = context.read<VisibleCubit>();
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
          body: BlocBuilder<VisibleCubit, bool>(
            bloc: status,
            builder: (context, state) {
              return Row(
                children: [
                  Visibility(
                    visible: state,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 24,
                            offset: Offset(0, 11),
                          ),
                        ],
                      ),
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: FaIcon(
                          //     FontAwesomeIcons.google,
                          //     size: 24.0.h,
                          //     color: Colors.orange,
                          //   ),
                          // ),
                          Column(
                            children: [
                              Container(
                                height: 55,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/image/logo.png",
                                    ),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(item.length, (index) {
                              var items = item[index];

                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          selected = items['id'];
                                          setState(() {});
                                        },
                                        icon: FaIcon(
                                          items['icon'],
                                          size: 24.0.h,
                                          color: (selected == items['id'])
                                              ? Colors.orange
                                              : Colors.grey,
                                        ),
                                      ),
                                      const Spacer(),
                                      (selected != items['id'])
                                          ? Container()
                                          : Container(
                                              height: 40.0,
                                              width: 2,
                                              decoration: BoxDecoration(
                                                color: (selected == items['id'])
                                                    ? Colors.orange
                                                    : Colors.grey,
                                              ),
                                            ),
                                    ]),
                              );
                            }),
                          ),
                          // IconButton(
                          //   onPressed: () {
                          //     status.changeVisible();
                          //   },
                          //   icon: FaIcon(
                          //     FontAwesomeIcons.gear,
                          //     size: 24.0.h,
                          //     color: Colors.grey,
                          //   ),
                          // ),
                          const SizedBox(
                            height: 10.0,
                          ),
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
                                          Text(
                                              'Apakah anda yakin ingin keluar?'),
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
                            icon: FaIcon(
                              FontAwesomeIcons.rightFromBracket,
                              size: 24.0.h,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                      ),
                      child: IndexedStack(
                        index: selected,
                        children: [
                          HomePage(),
                          const MenuManagement(),
                          // const ReportProduct(),
                          // const TestingPage()
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
