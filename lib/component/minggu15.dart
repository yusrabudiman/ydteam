import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:ydteam/component/access/pertemuan15_provider.dart';
import 'package:ydteam/component/access/pertemuan15_screen.dart';
import 'package:ydteam/component/minggu6.dart';

class minggu15 extends StatefulWidget {
  const minggu15({super.key});

  @override
  State<minggu15> createState() => _minggu15State();
}

class _minggu15State extends State<minggu15> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Pertemuan15Provider()),
      ],
      child: Consumer<Pertemuan15Provider>(
        builder: (context, prov, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: Text('Pertemuan 15 Carousel'),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              automaticallyImplyLeading: true,
            ),
            body: Pertemuan15Screen(),
          ),
        ),
      ),
    );
  }
}
