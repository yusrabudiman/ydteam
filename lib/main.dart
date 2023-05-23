import 'package:flutter/material.dart';
import 'package:ydteam/component/minggu10.dart';
import 'package:ydteam/component/minggu12.dart';
import 'package:ydteam/component/minggu13.dart';
import 'package:ydteam/component/minggu14.dart';
import 'package:ydteam/component/minggu15.dart';
import 'package:ydteam/component/minggu2.dart';
import 'package:ydteam/component/minggu3.dart';
import 'package:ydteam/component/minggu4.dart';
import 'package:ydteam/component/minggu5.dart';
import 'package:ydteam/component/minggu6.dart';
import 'package:ydteam/component/minggu7.dart';
import 'package:ydteam/component/minggu9.dart';

import 'component/minggu1.dart';
import 'component/minggu11.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelompok 9 YD-Tim'),
        centerTitle: true,
      ),
      body: GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        mainAxisSpacing: 10, // horizontal
        crossAxisSpacing: 15, // vertical
        crossAxisCount: 4, // size responsive
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu1())));
            },
            child: const Text('M01 Introduction'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu2())));
            },
            child: const Text('M02 Layout Gridview'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu3())));
            },
            child: const Text('M03 Button textfield'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu4())));
            },
            child: const Text('M04 Provider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu5())));
            },
            child: const Text('M05 Checkbox'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu6())));
            },
            child: Text('M06 Dropdown menu'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu7())));
            },
            child: Text('M07 Button Navigation'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu9())));
            },
            child: Text('M09 Drawer'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu10())));
            },
            child: Text('M10 Banner'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu11())));
            },
            child: Text('M11 menu list divider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu12())));
            },
            child: Text('M12 cards'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu13())));
            },
            child: Text('M13 Progress Indicator'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu14())));
            },
            child: Text('M14 Date Time Picker'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => minggu15())));
            },
            child: Text('M15 Carousel and select image'),
          ),
        ],
      ),
    );
  }
}
