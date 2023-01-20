// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:coffee_shops_santuy/bloc/user/user_bloc.dart';
import 'package:coffee_shops_santuy/data/model/user_model.dart';
import 'package:coffee_shops_santuy/presentation/vendor/add_data/widget/heading_text.dart';
import 'package:coffee_shops_santuy/util/shared/widget/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUser extends StatefulWidget {
  UserModel? user;
  EditUser({this.user, Key? key}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _formKey = GlobalKey<FormState>();
  var nameC = TextEditingController();
  var emailC = TextEditingController();
  String? image;
  @override
  void initState() {
    super.initState();
    nameC.text = widget.user!.name!;
    emailC.text = widget.user!.email!;
    image = widget.user!.photo!;
  }

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit User"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              const HeadingText(
                label: "Nama",
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
              const SizedBox(
                height: 10.0,
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
                    value: image,
                    label: "image",
                    id: "image"),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const HeadingText(
                label: "Email",
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: emailC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukan nama';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey)),
                    hintText: 'Email',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32), // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        userBloc.add(UpdateUserEvent(
                            user: widget.user!.copyWith(
                                email: emailC.text,
                                name: nameC.text,
                                photo: image)));

                        Navigator.pop(context);
                      },
                      child: const Text("Edit data"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
