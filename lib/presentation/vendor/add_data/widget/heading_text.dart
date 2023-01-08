import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore_for_file: camel_case_types

class HeadingText extends StatefulWidget {
  final String? label;

  const HeadingText({
    Key? key,
    this.label,
  }) : super(key: key);

  @override
  State<HeadingText> createState() => _HeadingTextState();
}

class _HeadingTextState extends State<HeadingText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${widget.label}",
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
