import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: const [],
        ),
        body: Column(
          children: [LottieBuilder.asset("assets/lottie/error.json")],
        ));
  }
}
