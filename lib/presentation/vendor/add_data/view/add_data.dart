import 'dart:math';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testing_local_storage/bloc/product/product_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_local_storage/data/model/product.dart';
import 'package:testing_local_storage/presentation/vendor/add_data/widget/heading_text.dart';
import 'package:testing_local_storage/util/shared/widget/image_picker.dart';

class AddData extends StatefulWidget {
  Product? item;
  AddData({this.item, Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  var isEdit = false;

  //text editing controller
  final _formKey = GlobalKey<FormState>();
  var nameC = TextEditingController();
  var priceC = TextEditingController();
  var descC = TextEditingController();

  //mengatur menu category
  List category = ["Food", "Drink"];
  String? categorySelected;
  List foodSubMenu = ["Signature food", "Bakery", "Salad", "Yogurt"];
  List drinkSubMenu = [
    "Signatured drink",
    "Iced Coffee",
    "Hot Coffee",
    "Chocolate"
  ];
  String? subMenuSelected;
  bool isSubMenuFood = false;
  bool isSubMenuDrink = false;

  String? image;

  void doSubSelected(String data) {
    if (isSubMenuDrink == true || isSubMenuFood == false) {
      isSubMenuDrink = false;
      isSubMenuFood = true;
      setState(() {});
      // print("status food true");
    } else if (isSubMenuDrink == false || isSubMenuFood == true) {
      isSubMenuDrink = true;
      isSubMenuFood = false;
      setState(() {});
      // print("status drink true");
    }
  }

  List<Product> product = [
    Product(
        id: "1",
        name: "Capuccino ",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        price: "30000",
        favorite: "false",
        image: "https://i.ibb.co/Pt4h4zj/capucino.jpg",
        submenu: "Iced Coffee",
        category: "Drink"),
    Product(
        id: "2",
        name: "irish Coffe",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        price: "25000",
        favorite: "false",
        image: "https://i.ibb.co/ww8wYNC/irish-Coffe.jpg",
        submenu: "Iced Coffee",
        category: "Drink"),
    Product(
        id: "3",
        name: "Risretto",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        price: "22000",
        favorite: "false",
        image: "https://i.ibb.co/wsbF4Z5/Risretto.jpg",
        submenu: "Hot Coffee",
        category: "Drink"),
    Product(
        id: "4",
        name: "Dalagona",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        price: "22000",
        favorite: "false",
        image: "https://i.ibb.co/4svZprW/Dalagona.webp",
        submenu: "Hot Coffee",
        category: "Drink"),
    Product(
        id: "5",
        name: "Affogato",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        price: "24000",
        favorite: "false",
        image: "https://i.ibb.co/XLJCkJj/Affogato.jpg",
        submenu: "Hot Coffee",
        category: "Drink"),
    Product(
      id: "6",
      name: "Freddo",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      price: "24000",
      favorite: "false",
      image: "https://i.ibb.co/Dz9C9Kj/Freddo.jpg",
      submenu: "Hot Coffee",
      category: "Drink",
    ),
    Product(
      id: "7",
      name: "Ice Chocolate with Wasabi",
      description:
          "Jepang di dalam minuman! Perpaduan Coklat & Wasabi akan mengantar kalian ke negeri Sakura!",
      price: "25000",
      favorite: "false",
      image:
          "https://i.ibb.co/dBTYBQN/menueditor-item-a1af60cab2fe4688befbb3edf1264ee9-1644579822293609445.webp",
      submenu: "Chocolate",
      category: "Drink",
    ),
    Product(
      id: "8",
      name: "Ice Chocolate Mango",
      description:
          "Coklat Mangga ditambah choco cookies crumble? Ga mungkin kalau ga bikin nagih!",
      price: "22500",
      favorite: "false",
      image:
          "https://i.ibb.co/hmy3PC6/menueditor-item-398e73c11a374c7084978f7a48c52188-1644580317338268925.webp",
      submenu: "Chocolate",
      category: "Drink",
    ),
    Product(
      id: "9",
      name: "Ice Chocolate Strawberry",
      description:
          "Si Pinky cantik, bakal bikin kamu ketagihan deh! Perpaduan Strawberry dan Premium Chocolate yang bakal bikin harimu semanis warnanya.",
      price: "22500",
      favorite: "false",
      image:
          "https://i.ibb.co/MsDJTn8/menueditor-item-b86689871e064e73889cf41a096c7f9e-1644580254774376188.webp",
      submenu: "Chocolate",
      category: "Drink",
    ),
    Product(
      id: "10",
      name: "Ice Chocolate Caramel with Choco Cookies",
      description:
          "Coba bayangin perpaduan Coklat Premium, Caramel dan Choco Cookies Crumble waktu meleleh di mulut kamu. Wuih banget rasanya..!",
      price: "22500",
      favorite: "false",
      image:
          "https://i.ibb.co/JkHkv03/menueditor-item-e68497d7000d408586026fdf6c3f0416-1644580153500076666.webp",
      submenu: "Chocolate",
      category: "Drink",
    ),
    Product(
      id: "11",
      name: "Ice chocolate Milk with Coffee",
      description:
          "Memanggil para penggemar kopi dan coklat! Rasakan kelezatan dari perpaduan yang pas antara kopi & coklatnya!",
      price: "22500",
      favorite: "false",
      image:
          "https://i.ibb.co/31nJw35/menueditor-item-659eaf78397f4686bbf56bfaee83e18d-1644580039177195759.webp",
      submenu: "Chocolate",
      category: "Drink",
    ),
  ];

  doDummy(ProductBloc productB) {
    // debugPrint("id: $id");
    debugPrint("nameC: ${nameC.text}");
    debugPrint("image: $image");
    debugPrint("priceC: ${priceC.text}");
    debugPrint("description: ${descC.text}");
    debugPrint("sub menu: $subMenuSelected");
    debugPrint("category: $categorySelected");

    for (var i = 0; i < product.length; i++) {
      var item = product[i];
      String id = Random().nextInt(999).toString();

      productB.add(AddProductEvent(Product(
          id: item.id,
          name: item.name,
          image: item.image,
          price: item.price,
          description: item.description,
          category: item.category,
          favorite: item.favorite,
          submenu: item.submenu)));
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      isEdit = true;
      nameC.text = widget.item!.name;
      priceC.text = widget.item!.price;
      descC.text = widget.item!.description;
      image = widget.item!.image;

      if (widget.item!.category == "Drink") {
        isSubMenuDrink = true;
        categorySelected = widget.item!.category;
        subMenuSelected = widget.item!.submenu;
      } else if (widget.item!.category == "Food") {
        isSubMenuFood = true;
        categorySelected = widget.item!.category;
        subMenuSelected = widget.item!.submenu;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductBloc productB = context.read<ProductBloc>();
    return ConnectivityWidgetWrapper(
      disableInteraction: true,
      offlineWidget: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 250,
                  height: 250,
                  child: Lottie.asset("assets/lottie/no-internet.json")),
              const Text(
                'Hubungkan dengan koneksi internet untuk menggunakan menu ini!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              (widget.item != null) ? "Edit data menu" : "Tambah data menu"),
          actions: [
            IconButton(
              onPressed: () {
                doDummy(productB);
              },
              icon: const Icon(
                Icons.toys,
                size: 24.0,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadingText(
                    label: "Name",
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(),
                    child: TextFormField(
                      controller: nameC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Masukan nama';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey)),
                        hintText: 'Name',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  const HeadingText(
                    label: "Image",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: QimagePicker(
                        onChanged: (value) {
                          image = value;
                        },
                        label: "image",
                        value: image,
                        id: "image"),
                  ),
                  const HeadingText(
                    label: "Price",
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Masukan harga';
                        }
                        return null;
                      },
                      controller: priceC,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey)),
                        hintText: 'Price',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const HeadingText(
                    label: "Category",
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: 50.0,
                      child: ListView.builder(
                        itemCount: category.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var item = category[index];
                          return InkWell(
                            onTap: () {
                              categorySelected = item;
                              doSubSelected(item);
                              setState(() {});
                            },
                            child: Container(
                              width: 100.0,
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                  color: (categorySelected == item)
                                      ? Colors.blue[400]
                                      : Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  border: (categorySelected != item)
                                      ? Border.all(
                                          width: 1.0,
                                          color: Colors.grey,
                                        )
                                      : const Border()),
                              child: Center(
                                child: Text(
                                  "$item",
                                  style: TextStyle(
                                    color: (categorySelected == item)
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Visibility(
                    visible: (isSubMenuDrink || isSubMenuFood),
                    child: const HeadingText(
                      label: "Sub Menu",
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Visibility(
                    visible: isSubMenuFood,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: 50.0,
                        child: ListView.builder(
                          itemCount: foodSubMenu.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var item = foodSubMenu[index];
                            return InkWell(
                              onTap: () {
                                subMenuSelected = item;
                                setState(() {});
                              },
                              child: Container(
                                // width: 100.0,
                                padding: const EdgeInsets.all(10.0),
                                margin: const EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                    color: (subMenuSelected == item)
                                        ? Colors.blue[400]
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    border: (subMenuSelected != item)
                                        ? Border.all(
                                            width: 1.0,
                                            color: Colors.grey,
                                          )
                                        : const Border()),
                                child: Center(
                                  child: Text(
                                    "$item",
                                    style: TextStyle(
                                      color: (subMenuSelected == item)
                                          ? Colors.white
                                          : Colors.grey,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isSubMenuDrink,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: 50.0,
                        child: ListView.builder(
                          itemCount: drinkSubMenu.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var item = drinkSubMenu[index];
                            return InkWell(
                              onTap: () {
                                subMenuSelected = item;
                                setState(() {});
                              },
                              child: Container(
                                // width: 100.0,
                                padding: const EdgeInsets.all(10.0),
                                margin: const EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                    color: (subMenuSelected == item)
                                        ? Colors.blue[400]
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    border: (subMenuSelected != item)
                                        ? Border.all(
                                            width: 1.0,
                                            color: Colors.grey,
                                          )
                                        : const Border()),
                                child: Center(
                                  child: Text(
                                    "$item",
                                    style: TextStyle(
                                      color: (subMenuSelected == item)
                                          ? Colors.white
                                          : Colors.grey,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const HeadingText(
                    label: "Description",
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(),
                    child: TextFormField(
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Masukan Description';
                        }
                        return null;
                      },
                      controller: descC,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey)),
                        hintText: 'Description',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: SizedBox(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(16), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (subMenuSelected == "" ||
                                subMenuSelected == null) {
                              const snackBar = SnackBar(
                                content: Text('Sub menu belum di pilih!'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }
                            if (categorySelected == "" ||
                                categorySelected == null) {
                              const snackBar = SnackBar(
                                content: Text('Category di pilih!'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }
                            if (image == "" || image == null) {
                              const snackBar = SnackBar(
                                content: Text('image belum di masukan!'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }

                            if (isEdit) {
                              // debugPrint("id: ${widget.item!.id}");
                              // debugPrint("nameC: ${nameC.text}");
                              // debugPrint("image: $image");
                              // debugPrint("priceC: ${priceC.text}");
                              // debugPrint("description: ${descC.text}");
                              // debugPrint("category: $categorySelected");
                              // debugPrint("sub menu: $subMenuSelected");
                              print("Mode : $isEdit");

                              productB.add(
                                UpdateProductEvent(
                                  product: Product(
                                      id: widget.item!.id,
                                      name: nameC.text,
                                      image: image!,
                                      price: priceC.text,
                                      description: descC.text,
                                      category: categorySelected!,
                                      favorite: widget.item!.favorite,
                                      submenu: subMenuSelected!),
                                ),
                              );
                            } else {
                              String id = Random().nextInt(999).toString();
                              debugPrint("id: $id");
                              debugPrint("nameC: ${nameC.text}");
                              debugPrint("image: $image");
                              debugPrint("priceC: ${priceC.text}");
                              debugPrint("description: ${descC.text}");
                              debugPrint("sub menu: $subMenuSelected");
                              debugPrint("category: $categorySelected");

                              productB.add(AddProductEvent(Product(
                                  id: id,
                                  name: nameC.text,
                                  image: image!,
                                  price: priceC.text,
                                  description: descC.text,
                                  category: categorySelected!,
                                  favorite: "false",
                                  submenu: subMenuSelected!)));
                            }
                            Navigator.pop(context);
                          }
                        },
                        child: Text((isEdit) ? "Edit" : "Simpan"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
