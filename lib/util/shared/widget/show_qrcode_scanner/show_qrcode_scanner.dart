// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

String? qrCode;
showQrcodeScanner(BuildContext context) async {
  qrCode = null;
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const QrCodeScannerView()),
  );

  // (const QrCodeScannerView());
  return qrCode;
}

class QrCodeScannerView extends StatefulWidget {
  const QrCodeScannerView({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerView> createState() => _QrCodeScannerViewState();
}

class _QrCodeScannerViewState extends State<QrCodeScannerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner')),
      body: MobileScanner(
        allowDuplicates: false,
        onDetect: (barcode, args) {
          qrCode = barcode.rawValue;
          if (qrCode != null) {
            // print("YOUR QR CODE is $qrCode");
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
