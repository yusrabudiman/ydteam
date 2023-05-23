import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ydteam/component/minggu10.dart';

class minggu11 extends StatefulWidget {
  const minggu11({super.key});

  @override
  State<minggu11> createState() => _minggu11State();
}

class _minggu11State extends State<minggu11> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Pertemuan11Provider()),
      ],
      child: Consumer<Pertemuan11Provider>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text('M 11 menus'),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              automaticallyImplyLeading: true,
            ),
            body: Pertemuan11Screen(),
          ),
        ),
      ),
    );
  }
}

//screen
class Pertemuan11Screen extends StatefulWidget {
  const Pertemuan11Screen({super.key});

  @override
  State<Pertemuan11Screen> createState() => _Pertemuan11ScreenState();
}

class _Pertemuan11ScreenState extends State<Pertemuan11Screen> {
  bool bodyState = false;

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<Pertemuan11Provider>(context, listen: false).initialData();
    });
    super.initState();
  }

  body(context) {
    final prov = Provider.of<Pertemuan11Provider>(context);
    if (prov.data == null) {
      return const CircularProgressIndicator();
    } else {
      return ListView(
        children: List.generate(
          prov.data['data']!.length,
          (index) {
            var item = prov.data['data']![index];
            return Column(
              children: [
                ListTile(
                  leading:
                      CircleAvatar(backgroundImage: NetworkImage(item['img'])),
                  title: Text(item['model']),
                  subtitle: Row(
                    children: [
                      Text('Onwer: ' + item['developer']),
                      Text(', Price: ' + item['price']),
                      Text(', Rating: ' + item['rating'])
                    ],
                  ),
                ),
                const Divider(),
              ],
            );
          },
        ),
      );
    }
  }

  menuList(BuildContext context) {
    final prov = Provider.of<Pertemuan11Provider>(context);

    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: ListTile(
              onTap: () {
                prov.ubahList('hp');
                bodyState = false;
              },
              leading: const Icon(Icons.phone),
              title: const Text('HP'),
            ),
          ),
          PopupMenuItem(
              child: ListTile(
            onTap: () {
              prov.ubahList('laptop');
              bodyState = false;
            },
            leading: const Icon(Icons.laptop),
            title: const Text('Laptop'),
          )),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              onTap: () {
                setState(() {
                  prov.data['data']!.length = 0;
                  bodyState = true;
                });
              },
              leading: Icon(Icons.recycling_outlined),
              title: Text('Clear'),
            ),
          ),
        ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [menuList(context)],
      ),
      body: bodyState
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Data tidak ditemukan',
                    style: TextStyle(fontSize: 21),
                  )
                ],
              ),
            )
          : body(context),
    );
  }
}

//provider
class Pertemuan11Provider extends ChangeNotifier {
  initialData() async {
    setData = hp;
  }

  final hp = {
    "data": [
      {
        "model": "Samsung Galaxy",
        "img":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/I7500_with_screen_protector.jpg/220px-I7500_with_screen_protector.jpg",
        "developer": "Samsung Electronics",
        "price": "2.500.000",
        "rating": "4.5"
      },
      {
        "model": "Sony Xperia Z",
        "img":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Sony_Xperia_Z.JPG/200px-Sony_Xperia_Z.JPG",
        "developer": "Sony Mobile",
        "price": "1.500.000",
        "rating": "4.1"
      },
    ]
  };
  final laptop = {
    "data": [
      {
        "model": "Lenovo Legionel",
        "img":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Lenovo_Legion_Y520_%281%29.jpg/220px-Lenovo_Legion_Y520_%281%29.jpg",
        "developer": "Lenovo",
        "price": "12.500.000",
        "rating": "4"
      },
      {
        "model": "HP EliteBook",
        "img":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/HP_Elitebook_820_G4.png/250px-HP_Elitebook_820_G4.png",
        "developer": "HP",
        "price": "2.500.000",
        "rating": "4.8"
      },
    ]
  };

  dynamic _data;
  dynamic get data => _data;
  set setData(val) {
    var tmp = json.encode(val);
    _data = json.decode(tmp);

    notifyListeners();
  }

  ubahList(val) {
    if (val == 'hp') {
      setData = hp;
    } else {
      setData = laptop;
    }
  }
}
