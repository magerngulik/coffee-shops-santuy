import 'package:coffee_shops_santuy/page/coffee_app/cfa_product_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_shops_santuy/cubit/navmenu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CfaHomePage extends StatefulWidget {
  const CfaHomePage({super.key});

  @override
  State<CfaHomePage> createState() => _CfaHomePageState();
}

class _CfaHomePageState extends State<CfaHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    NavmenuCubit status = context.read<NavmenuCubit>();

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome, Rahma",
                            style: GoogleFonts.montserrat(
                                fontSize: 24.0, fontWeight: FontWeight.bold)),
                        Text(
                            "menemukan apa pun yang Anda butuhkan dengan mudah",
                            style: GoogleFonts.montserrat(
                              fontSize: 10.0,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ),
                  BlocBuilder<NavmenuCubit, bool>(
                    bloc: status,
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          status.activator();
                        },
                        icon: Icon(
                          (state) ? Icons.arrow_back : Icons.arrow_forward,
                          size: 24.0,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.orange,
                  labelColor: Colors.orange,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(right: 24),
                  unselectedLabelColor: const Color(0xFFCDCDCD),
                  tabs: [
                    Tab(
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20.0,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.coffee,
                              size: 24.0,
                            ),
                            Text("Coffee"),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20.0,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.folder_open_sharp,
                              size: 24.0,
                            ),
                            Text("Tea"),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20.0,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.breakfast_dining,
                              size: 24.0,
                            ),
                            Text("Break Fast"),
                          ],
                        ),
                      ),
                    ),
                  ]),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 160.0,
                width: double.infinity,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const CfaProductPage(),
                    Container(
                      color: Colors.green[100],
                    ),
                    Container(
                      color: Colors.blue[100],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
