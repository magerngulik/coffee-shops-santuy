import 'package:flutter/material.dart';

class CfaListProductManagement extends StatefulWidget {
  const CfaListProductManagement({super.key});

  @override
  State<CfaListProductManagement> createState() =>
      _CfaListProductManagementState();
}

class _CfaListProductManagementState extends State<CfaListProductManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: Padding(
          padding: const EdgeInsets.only(
            bottom: 80,
          ),
          child: Container()

          //  GridView.builder(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 8,
          //     mainAxisSpacing: 8,
          //     childAspectRatio: 0.7,
          //   ),
          //   itemBuilder: (context, index) {
          //     return ProductCart(
          //       cake: listProduct1[index],
          //     );
          //   },
          //   itemCount: listProduct1.length,
          // ),
          ),
    );
  }
}
