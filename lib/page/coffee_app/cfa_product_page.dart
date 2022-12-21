import 'package:coffee_shops_santuy/bloc/product/product_bloc.dart';
import 'package:coffee_shops_santuy/core.dart';
import 'package:coffee_shops_santuy/page/coffee_app/widget/cfa_product_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CfaProductPage extends StatefulWidget {
  const CfaProductPage({super.key});

  @override
  State<CfaProductPage> createState() => _CfaProductPageState();
}

class _CfaProductPageState extends State<CfaProductPage> {
  @override
  Widget build(BuildContext context) {
    ProductBloc productB = context.read<ProductBloc>();

    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 80,
        ),
        child: BlocBuilder<ProductBloc, ProductState>(
          bloc: productB,
          builder: (context, state) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                var items = state.listProductMenu[index];
                return ProductCart(
                  cake: items,
                );
              },
              itemCount: state.listProductMenu.length,
            );
          },
        ),
      ),
    );
  }
}
