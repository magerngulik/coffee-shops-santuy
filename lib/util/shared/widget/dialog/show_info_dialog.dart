import 'package:flutter/material.dart';

Future showInfoDialog(String message, BuildContext globalContext) async {
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Info'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Ok"),
          ),
        ],
      );
    },
  );
}
