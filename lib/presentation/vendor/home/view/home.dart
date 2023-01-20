import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:coffee_shops_santuy/bloc/product/product_bloc.dart';
import 'package:coffee_shops_santuy/bloc/visible/visible_cubit.dart';
import 'package:coffee_shops_santuy/data/model/product.dart';
import 'package:coffee_shops_santuy/presentation/vendor/cart_product/view/cart_product.dart';
import 'package:coffee_shops_santuy/presentation/vendor/detail_product/view/detail_product.dart';
import 'package:coffee_shops_santuy/presentation/vendor/select_product/view/select_product.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var foodMenu = [
    {
      "icon": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "name": "Signitre",
      "category": "Drink"
    },
    {
      "icon": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "name": "Iced Coffee",
      "category": "Drink"
    },
    {
      "icon": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "name": "Hot Coffee",
      "category": "Drink"
    },
    {
      "icon": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "name": "Chocolate",
      "category": "Drink"
    },
    {
      "icon": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "name": "Signatured",
      "category": "Food"
    },
    {
      "icon": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "name": "Salad",
      "category": "Food"
    },
    {
      "icon": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "name": "Bakery",
      "category": "Food"
    },
    {
      "icon": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "name": "Yogurt",
      "category": "Food"
    },
  ];
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProductBloc productB = context.read<ProductBloc>();
    VisibleCubit status = context.read<VisibleCubit>();
    return SafeArea(
      child: Scaffold(
          floatingActionButton: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartProduct()),
              );
            },
            child: SizedBox(
              height: 50,
              width: 50,
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  BlocBuilder<ProductBloc, ProductState>(
                    bloc: productB,
                    builder: (context, state) {
                      if (state.listCart.isEmpty) {
                        return Container();
                      }

                      return CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text("${state.listCart.length}"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Good Morning",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                status.changeVisible();
              },
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  if (await ConnectivityWrapper.instance.isConnected) {
                    const snackBar = SnackBar(
                      content: Text('Fitur ini belum tersedia!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    await showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text('Peringatan'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  SizedBox(
                                      width: 250,
                                      height: 250,
                                      child: Lottie.asset(
                                          "assets/lottie/no-internet.json")),
                                  const Text(
                                    'Hubungkan dengan koneksi internet untuk mengakses menu ini!',
                                    textAlign: TextAlign.center,
                                  ),
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
                                child: const Text("Oke"),
                              ),
                            ]);
                      },
                    );
                  }
                },
                icon: const Icon(
                  Icons.qr_code,
                  size: 24.0,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 200.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/coffee-banner-design-template-dd828adfb2bb4cc0a06627cacc229805_screen.jpg?ts=1611914878",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: const [
                      Text(
                        "Drinks",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                      childAspectRatio: 1 / 0.3),
                  itemCount: foodMenu
                      .where((element) => element['category'] == "Drink")
                      .toList()
                      .length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = foodMenu
                        .where((element) => element['category'] == "Drink")
                        .toList()[index];
                    return InkWell(
                      onTap: () async {
                        productB.add(SelectProductEvent(item['name']!));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectProduct(
                                    category: item['name'],
                                  )),
                        );

                        // productB.add(DelectSelectEvent());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.garage_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Text(
                                  "${item["name"]}",
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: const [
                      Text(
                        "Foods",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1 / 0.3),
                  itemCount: foodMenu
                      .where((element) => element['category'] == "Food")
                      .toList()
                      .length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = foodMenu
                        .where((element) => element['category'] == "Food")
                        .toList()[index];
                    return InkWell(
                      onTap: () {
                        productB.add(SelectProductEvent(item['name']!));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectProduct(
                                    category: item['name'],
                                  )),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.garage_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Text(
                                  "${item["name"]}",
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<ProductBloc, ProductState>(
                  bloc: productB,
                  builder: (context, state) {
                    if (state.listData.isEmpty) {
                      return SizedBox(
                        height: 300,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                width: 250,
                                height: 250,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                                child: Lottie.asset(
                                    "assets/lottie/foot_order.json"),
                              ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 6,
                              crossAxisSpacing: 6,
                              childAspectRatio: 1 / 1.5),
                      itemCount: state.listData.length,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        Product item = state.listData[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailProduct(
                                        item: item,
                                      )),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: CachedNetworkImage(
                                    imageUrl: item.image,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        Center(
                                            child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress)),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 30.0,
                                          width: 70,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                15.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Rp. ${item.price}",
                                              style: const TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4.0),
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        item.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          )),
    );
  }
}
