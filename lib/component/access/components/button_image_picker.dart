import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ydteam/component/access/pertemuan15_provider.dart';

class ButtonImagePicker extends StatelessWidget {
  final String title;
  final bool isGallery;
  const ButtonImagePicker(
      {Key? key, required this.isGallery, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan15Provider>(context);
    return ElevatedButton(
        onPressed: () async {
          await prov.pickImage(isGallery);
        },
        child: Text(title));
  }
}
