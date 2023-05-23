
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ydteam/component/access/components/webview_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int selectedIndex = 0;
  List<String> imageList = [
    'https://picsum.photos/1',
    'https://picsum.photos/2',
    'https://picsum.photos/3',
    'https://picsum.photos/4',
    'https://picsum.photos/5'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 300,
      child: CarouselSlider(
        options: CarouselOptions(height: 400.0, onPageChanged: onPageChanged),
        items: imageList.map((imageUrl) {
          int index = imageList.indexOf(imageUrl);
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewWidget(
                      url: 'https://mikroskil.ac.id/pengumuman/354${index + 1}',
                    ),
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Text ${index + 1}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      selectedIndex = index;
    });
  }
}
