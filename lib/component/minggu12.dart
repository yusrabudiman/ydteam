import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class minggu12 extends StatefulWidget {
  const minggu12({super.key});

  @override
  State<minggu12> createState() => _minggu12State();
}

class _minggu12State extends State<minggu12> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Pertemuan12Provider()),
      ],
      child: Consumer<Pertemuan12Provider>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: Scaffold(
            appBar: AppBar(
              title: Text('M12 Provider detail screen'),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              automaticallyImplyLeading: true,
            ),
            body: Pertemuan12Screen(),
          ),
        ),
      ),
    );
  }
}

//detailscreen
class DetailScreen extends StatefulWidget {
  final Map model;

  const DetailScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail screen'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Row(
                  children: [
                    Image.network(
                      widget.model['img'],
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.5,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model['model'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.model['developer']),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.model['desc']),
                          SizedBox(height: 10),
                          Text(
                            'Rp. ${widget.model['price']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Rating ${widget.model['rating']}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//pertemuan12screen
class Pertemuan12Screen extends StatefulWidget {
  const Pertemuan12Screen({super.key});

  @override
  State<Pertemuan12Screen> createState() => _Pertemuan12ScreenState();
}

class _Pertemuan12ScreenState extends State<Pertemuan12Screen> {
  bool bodyState = false;

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<Pertemuan12Provider>(context, listen: false).initialData();
    });
    super.initState();
  }

  //body content
  body(BuildContext context) {
    final prov = Provider.of<Pertemuan12Provider>(context);
    if (prov.data == null) {
      return const CircularProgressIndicator();
    } else {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
        ),
        itemCount: prov.data['data']!.length,
        itemBuilder: (context, index) {
          var item = prov.data['data']![index];
          return SizedBox(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(item['img']),
                      ),
                      title: Text(item['model']),
                      subtitle: Text(
                        item['developer'],
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        item["desc"].toString().length >= 100
                            ? item["desc"].toString().substring(0, 100) +
                                "...read more"
                            : item["desc"],
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Rp. ${item['price'].toString()},-',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Rating ${item['rating'].toString()}'),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.thumb_up),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.share),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                onTap: () {
                  // _showDialog(text: 'Index: ');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(model: item),
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    }
  }

  //bar menu right
  menuList(BuildContext context) {
    final prov = Provider.of<Pertemuan12Provider>(context);
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
                  ]),
            )
          : body(context),
    );
  }
}

//provider
class Pertemuan12Provider extends ChangeNotifier {
  initialData() async {
    setData = hp;
  }

  final hp = {
    "data": [
      {
        "model": "Samsung Galaxy",
        "img":
            "https://images.samsung.com/id/smartphones/galaxy-z-flip4/images/galaxy-z-flip4_highlights_kv.jpg",
        "desc":
            "Samsung Galaxy adalah seri perangkat telepon pintar berbasis Android yang dirancang, diproduksi dan dipasarkan oleh Samsung Electronics.",
        "developer": "Samsung Electronics",
        "price": 2500000,
        "rating": 4.5
      },
      {
        "model": "Sony Xperia Z",
        "img":
            "https://th.bing.com/th/id/R.ae2b6f4c9f0d46038cbbd42bf5f07240?rik=1uE6dolvs7wPng&riu=http%3a%2f%2fi-cdn.phonearena.com%2fimages%2fphones%2f41612-xlarge%2fSony-Xperia-Z-Ultra-2.jpg&ehk=zKsiBcMueNkQnD2zE%2bbSVlyz2urJbfOGMP%2bghGPEGek%3d&risl=&pid=ImgRaw&r=0",
        "desc":
            "Sony Xperia Z merupakan handphone HP dengan kapasitas 2330mAh dan layar 5 yang dilengkapi dengan kamera belakang 13.1MP dengan tingkat densitas piksel sebesar 441ppi dan tampilan resolusi sebesar 1080 x 1920pixels. Dengan berat sebesar 146g, handphone HP ini memiliki prosesor Quad Core. Tanggal rilis untuk Sony Xperia Z: September 2013",
        "developer": "Sony Mobile",
        "price": 1500000,
        "rating": 4.1
      },
    ]
  };

  final laptop = {
    "data": [
      {
        "model": "Lenovo Legion",
        "img":
            "https://www.bhphotovideo.com/images/images1000x1000/lenovo_80wk00fcus_15_6_ips_fhd_1920x1080_1328142.jpg",
        "desc":
            "Conquer the eSports arena with Legion 5 Pro devices, complete with the worlds first 16 WQXGA displays on gaming laptops. Slay in style with the newly designed Legion 5 devices, featuring alluring aluminum and magnesium blended bodies",
        "developer": "Lenovo",
        "price": 12500000,
        "rating": 4
      },
      {
        "model": "HP EliteBook",
        "img":
            "https://th.bing.com/th/id/OIP.bFLodr-RiNVMf-JgmysyWQHaFb?pid=ImgDet&rs=1",
        "desc":
            "HP EliteBook is a line of business-oriented high-end notebooks and mobile workstations made by Hewlett-Packard (HP Inc.). The EliteBook series, which fits above the lower-end ProBook series, was introduced in August 2008 as a replacement of the HP Compaq high end line of notebooks.",
        "developer": "HP",
        "price": 2500000,
        "rating": 4.8
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
    print('val');
    if (val == 'hp') {
      setData = hp;
    } else {
      setData = laptop;
    }
  }
}
