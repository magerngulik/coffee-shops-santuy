// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CfaTextfield extends StatefulWidget {
  String label;
  String hintText;
  TextEditingController textC;
  int? maxline;
  TextInputType? textInputType;
  Function(String value) onChanged;
  String? Function(String? value)? validator;

  CfaTextfield(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.textC,
      required this.onChanged,
      this.maxline,
      this.textInputType,
      required this.validator})
      : super(key: key);

  @override
  State<CfaTextfield> createState() => _CfaTextfieldState();
}

class _CfaTextfieldState extends State<CfaTextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          child: TextFormField(
            validator: widget.validator,
            maxLines: widget.maxline ?? 1,
            controller: widget.textC,
            keyboardType: widget.textInputType ?? TextInputType.text,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(24.0),
                ),
              ),
              labelStyle: const TextStyle(
                color: Colors.blueGrey,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(24.0),
                ),
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                ),
              ),
            ),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
