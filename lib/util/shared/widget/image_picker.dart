import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testing_local_storage/util/shared/util/input.dart';

class QimagePicker extends StatefulWidget {
  final String id;
  final String? value;
  final Function(String value) onChanged;
  final String? label;

  const QimagePicker({
    Key? key,
    this.value,
    required this.onChanged,
    required this.label,
    required this.id,
  }) : super(key: key);

  @override
  State<QimagePicker> createState() => _QimagePickerState();
}

class _QimagePickerState extends State<QimagePicker>
    implements InputControllerState {
  String? imageUrl;

  @override
  setValue(value) {
    imageUrl = value;
    setState(() {});
  }

  @override
  getValue() {
    return imageUrl;
  }

  @override
  void dispose() {
    super.dispose();
    inputControllers.remove(widget.id);
  }

  @override
  void initState() {
    super.initState();
    imageUrl = widget.value;
    inputControllers[widget.id] = this;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        //get image gallery
        // dio upload

        XFile? image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 40,
        );
        String? filePath = image?.path;

        if (filePath == null) return;

        final formData = FormData.fromMap({
          'image': MultipartFile.fromBytes(
            File(filePath).readAsBytesSync(),
            filename: "upload.jpg",
          ),
        });

        var res = await Dio().post(
          'https://api.imgbb.com/1/upload?key=1d847d0f51d4dc4435a32ef8a24d227e',
          data: formData,
        );

        var data = res.data["data"];
        var url = data["url"];

        imageUrl = url;
        setState(() {});
        widget.onChanged(imageUrl!);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5.0,
            ),
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl ?? "https://i.ibb.co/S32HNjD/no-image.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
