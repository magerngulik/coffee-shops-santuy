import 'package:coffee_shops_santuy/bloc/product/product_bloc.dart';
import 'package:coffee_shops_santuy/page/coffee_app/cfa_add_product.dart';
import 'package:coffee_shops_santuy/page/coffee_app/widget/cfa_product_proses.dart';
import 'package:coffee_shops_santuy/services/product_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_shops_santuy/bloc/navmenu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CfaProductManagement extends StatefulWidget {
  const CfaProductManagement({super.key});

  @override
  State<CfaProductManagement> createState() => _CfaProductManagementState();
}

class _CfaProductManagementState extends State<CfaProductManagement>
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
    ProductBloc productB = context.read<ProductBloc>();

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
                        Text("Management Product",
                            style: GoogleFonts.montserrat(
                                fontSize: 24.0, fontWeight: FontWeight.bold)),
                        Text("Tambah data, edit data dan delete data product",
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
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Tambah data"),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CfaAddProduct()),
                  );
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 160.0,
                width: double.infinity,
                child: Column(
                  children: [
                    BlocBuilder<ProductBloc, ProductState>(
                      bloc: productB,
                      builder: (context, state) {
                        if (state.listProductMenu.isEmpty) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height - 300.0,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset("assets/lottie/foot_order.json"),
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
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 6,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: state.listProductMenu.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            ProductModel item = state.listProductMenu[index];
                            return ProductCartProses(
                              cake: ProductModel(
                                  id: item.id,
                                  name: item.name,
                                  price: item.price,
                                  imageUrl: item.imageUrl,
                                  isFavorite: item.isFavorite,
                                  subMenu: item.subMenu,
                                  descripton: item.descripton),
                            );
                          },
                        );
                      },
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
