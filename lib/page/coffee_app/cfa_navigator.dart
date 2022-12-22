import 'package:coffee_shops_santuy/bloc/navmenu_cubit.dart';
import 'package:coffee_shops_santuy/page/coffee_app/cfa_home.dart';
import 'package:coffee_shops_santuy/page/coffee_app/cfa_product_management.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CfaNavigator extends StatefulWidget {
  const CfaNavigator({super.key});

  @override
  State<CfaNavigator> createState() => _CfaNavigatorState();
}

class _CfaNavigatorState extends State<CfaNavigator> {
  List item = [
    {"id": 0, "icon": FontAwesomeIcons.house},
    {"id": 1, "icon": FontAwesomeIcons.bookmark},
    {"id": 2, "icon": FontAwesomeIcons.bagShopping},
    {"id": 3, "icon": FontAwesomeIcons.file},
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    NavmenuCubit status = context.read<NavmenuCubit>();
    debugPrint("dibuilt ulang");
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<NavmenuCubit, bool>(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            size: 24.0.h,
                            color: Colors.orange,
                          ),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            status.activator();
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.gear,
                            size: 24.0.h,
                            color: Colors.grey,
                          ),
                        ),
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
                                        Navigator.pop(context);
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
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    // width: (state) ? 300 : MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                    ),
                    child: IndexedStack(
                      index: selected,
                      children: [
                        const CfaHomePage(),
                        const CfaProductManagement(),
                        Container(
                          color: Colors.purple[100],
                        ),
                        Container(
                          color: Colors.blue[100],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
