// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'dart:math';
import 'package:coffee_shops_santuy/bloc/product/product_bloc.dart';
import 'package:coffee_shops_santuy/page/coffee_app/widget/cfa_textfield.dart';
import 'package:coffee_shops_santuy/services/product_model.dart';
import 'package:coffee_shops_santuy/shared/widget/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CfaAddProduct extends StatefulWidget {
  const CfaAddProduct({Key? key}) : super(key: key);

  @override
  State<CfaAddProduct> createState() => _CfaAddProductState();
}

class _CfaAddProductState extends State<CfaAddProduct> {
  //   required this.id,
  //   required this.imageUrl,
  //   required this.name,
  //   required this.price,
  //   required this.descripton,
  //   required this.subMenu,
  //   required this.isFavorite,

  TextEditingController nameC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  String categorySelected = "";
  final _formKey = GlobalKey<FormState>();
  List<String> list = <String>['Coffee', 'Tea', 'Snack'];
  String? imgUrl;

  @override
  Widget build(BuildContext context) {
    ProductBloc productB = context.read<ProductBloc>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Product"),
          actions: const [],
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                CfaTextfield(
                  label: "Nama Product",
                  hintText: "Name Product",
                  textC: nameC,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama product tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                QimagePicker(
                    onChanged: (value) {
                      imgUrl = value;
                    },
                    label: "Image Product",
                    id: "image"),
                const SizedBox(
                  height: 20.0,
                ),
                CfaTextfield(
                  label: "Price Product",
                  hintText: "Price",
                  textC: priceC,
                  textInputType: TextInputType.number,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Price product tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CfaTextfield(
                  label: "Description Product",
                  hintText: "Descripsi",
                  textC: descriptionC,
                  maxline: 3,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi product tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Category Product",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  child: DropdownButtonFormField<String>(
                    validator: (value) =>
                        value == null ? 'Silahkan pilih category' : null,
                    hint: Text(
                      'Pilih Category',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        borderSide:
                            BorderSide(width: 2.0, color: Color(0xffE5E5E5)),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        borderSide:
                            BorderSide(width: 2.0, color: Color(0xffE5E5E5)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        borderSide:
                            BorderSide(width: 2.0, color: Color(0xffE5E5E5)),
                      ),
                    ),
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      categorySelected = value!;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        int id = Random().nextInt(999);
                        debugPrint("id: $id");
                        debugPrint("img: $imgUrl");
                        debugPrint("Name: ${nameC.text}");
                        debugPrint("price: ${priceC.text}");
                        debugPrint("decription: ${descriptionC.text}");
                        debugPrint("category: $categorySelected");
                        if (imgUrl == "" || imgUrl == null) {
                          const snackBar = SnackBar(
                            content: Text('Image belum di masukan!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }

                        productB.add(
                          AddProductEvent(
                            ProductModel(
                              id: id,
                              name: nameC.text,
                              price: priceC.text,
                              imageUrl: imgUrl!,
                              isFavorite: false,
                              subMenu: categorySelected,
                              descripton: descriptionC.text,
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Simpan"),
                  ),
                ),
              ],
            )));
  }
}
