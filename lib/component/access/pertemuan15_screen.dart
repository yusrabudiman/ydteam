import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ydteam/component/access/components/button_image_picker.dart';
import 'package:ydteam/component/access/components/carousel_slider.dart';
import 'package:ydteam/component/access/pertemuan15_provider.dart';
import 'package:ydteam/component/access/video_demo.dart';

class Pertemuan15Screen extends StatefulWidget {
  const Pertemuan15Screen({super.key});

  @override
  State<Pertemuan15Screen> createState() => _Pertemuan15ScreenState();
}

class _Pertemuan15ScreenState extends State<Pertemuan15Screen> {
  List<XFile>? listImg;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan15Provider>(context);
    return Scaffold(
      body: ListView(
        children: [
          //carousel slider
          const CarouselSliderWidget(),
          //image picker
          prov.isImageLoaded == true
              ? Image.network(prov.img!.path)
              : Container(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonImagePicker(
                  isGallery: true,
                  title: 'Open Gallery',
                ),
                TextButton(
                  onPressed: () async {
                    var pilihGambar = ImagePicker();
                    var hasil = await pilihGambar.pickMultiImage();

                    if (hasil == null) {
                      print('tidak ada foto');
                    } else {
                      setState(() {
                        listImg = hasil;
                      });
                    }
                  },
                  child: Text('Multi Image'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => MyHomePage())));
                    },
                    child: Text('Video Open')),
                ButtonImagePicker(
                  isGallery: false,
                  title: 'Camera',
                ),
              ],
            ),
          ),

          Column(
            children: [
              listImg != null
                  ? Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 4,
                            children: listImg!.map((e) {
                              return Image.network(e.path);
                            }).toList(),
                          )))
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
