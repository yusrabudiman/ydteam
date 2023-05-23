import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class minggu7 extends StatefulWidget {
  const minggu7({Key? key}) : super(key: key);

  @override
  _minggu7State createState() => _minggu7State();
}

class _minggu7State extends State<minggu7> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Pertemuan07Provider()),
      ],
      child: Consumer<Pertemuan07Provider>(
        builder: (context, prov, _) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: prov.enableDarkMode == true ? prov.dark : prov.light,
          home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text('Button navigation'),
              centerTitle: true,
            ),
            body: Pertemuan07Screen(),
          ),
        ),
      ),
    );
  }
}

class Pertemuan07Screen extends StatefulWidget {
  const Pertemuan07Screen({super.key});

  @override
  State<Pertemuan07Screen> createState() => _Pertemuan07ScreenState();
}

class _Pertemuan07ScreenState extends State<Pertemuan07Screen> {
  // String title = "Home";
  bool _isVisible = true;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan07Provider>(context);

    List<Widget> _widgeditem = prov.item
        .map(
          (e) => MyList(text: e),
        )
        .toList();

    Widget _body() {
      if (_currentIndex == 0) {
        return HomeCard();
      } else if (_currentIndex == 1) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: _widgeditem,
          ),
        );
      } else if (_currentIndex == 2) {
        return AboutCard();
      } else {
        return Container();
      }
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      //   centerTitle: true,
      // ),
      body: _body(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: new Visibility(
        visible: _isVisible,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              prov.additem();
            });
          },
          child: Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Exercise", icon: Icon(Icons.work)),
          BottomNavigationBarItem(label: "About", icon: Icon(Icons.people))
        ],
        onTap: (value) {
          if (value == 0) {
            _isVisible = false;
            // title = "Home";
          }
          ;
          if (value == 1) {
            _isVisible = true;
            // title = "Exercise";
          }
          ;
          if (value == 2) {
            _isVisible = false;
            // title = "About";
          }
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}

class MyList extends StatelessWidget {
  String text = "";
  MyList({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.assignment),
      title: Text(text),
      trailing: Container(
        decoration: BoxDecoration(color: Colors.green),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Text(
          "Todo list Complete",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

//About navigation
class AboutCard extends StatefulWidget {
  const AboutCard({super.key});

  @override
  State<AboutCard> createState() => _AboutCardState();
}

class _AboutCardState extends State<AboutCard> {
  //list cita cita
  String itemCitaCita = 'Pilih Cita Cita';
  List itemFavorit = <String>[
    'Pilih Cita Cita',
    'Menjadi desainer',
    'Menjadi Programmer',
    'Menjadi Penulis Blog',
    'Membangun Perusahaan',
    'Menjadi Customer'
  ];

  //List rincian cita cita
  final Map<String, String> _rincianCitaCita = {
    'Pilih Cita Cita': 'Silahkan memilih cita cita',
    'Menjadi desainer':
        'Saya ingin menjadi sponsor Brand app yang terletak di jakarta',
    'Menjadi Programmer':
        'Saya ingin menjadi programmer karena bisa melakukan banyak eksperiment',
    'Menjadi Penulis Blog':
        'Saya ingin menjadi penulis blogger professional kemudian dapat dimengerti oleh Ai',
    'Membangun Perusahaan':
        'Saya ingin membangun perusahaan bisnis layanan internet publik wifi autopilot',
    'Menjadi Customer':
        'Saya ingin menjadi customer service untuk membantu pengguna mengatasi masalah penggunaan teknologi aplikasi'
  };

  //Gambar sesuai cita cita

  final Map<String, String> _rincianGambarCitaCita = {
    'Pilih Cita Cita':
        'https://thumbs.dreamstime.com/z/expectations-human-mind-pictured-as-word-inside-head-to-symbolize-relation-psyche-d-illustration-172337080.jpg',
    'Menjadi desainer':
        'https://stickearn.com/storage/app/uploads/public/642/fa6/6b6/642fa66b6d62c286811334.jpg',
    'Menjadi Programmer':
        'https://2.bp.blogspot.com/-Z1yZ88JNGMY/WXmpsT99yjI/AAAAAAAAHQs/cqxT-PZRcXgpOVtE8PmABsUZjT0NaLK8ACLcBGAs/s1600/php%2Band%2Bcoffe.jpg',
    'Menjadi Penulis Blog':
        'https://only-print.com/wp-content/uploads/2020/09/pexels-photo-1448709-1024x681.jpeg',
    'Membangun Perusahaan':
        'https://qubisastorage.blob.core.windows.net/files/articles/galleries/2930/images/img/2930-20221004181453437.jpg',
    'Menjadi Customer':
        'https://idcloudhost.com/wp-content/uploads/2022/03/idch-covers-582-1280x720.jpg'
  };

  String _pilihGambarUrl = '';

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan07Provider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Darkmode mode theme'),
                Switch(
                    value: prov.enableDarkMode,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      prov.setBrightness = val;
                    })
              ],
            ),
            Consumer<Pertemuan07Provider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Show Checked Dropdown'),
                        Switch(
                            value: prov.isDropdownShow,
                            activeColor: Colors.blue,
                            onChanged: (val) {
                              prov.isDropdownShow = val;
                            })
                      ],
                    ),
                    Visibility(
                      visible: prov.isDropdownShow,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                  'Cita Cita Jika mengambil jurusan teknik informatika'),
                              DropdownButton(
                                  items: itemFavorit.map((itemcheck) {
                                    return DropdownMenuItem(
                                      child: Text(itemcheck),
                                      value: itemcheck,
                                    );
                                  }).toList(),
                                  value: itemCitaCita,
                                  onChanged: (val) {
                                    setState(() {
                                      itemCitaCita = val as String;
                                      _pilihGambarUrl =
                                          _rincianGambarCitaCita[val] as String;
                                    });
                                  })
                            ],
                          ),
                          Row(
                            children: [Text('Cita Cita: $itemCitaCita')],
                          ),
                          Row(
                            children: [
                              Text('Rincian Cita Cita: '),
                              Flexible(
                                child: Text(
                                    _rincianCitaCita[itemCitaCita] ?? "Any"),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _pilihGambarUrl.isNotEmpty
                                  ? Flexible(
                                      child: Image.network(
                                        _pilihGambarUrl,
                                        height: 250,
                                        width: 500,
                                      ),
                                    )
                                  : Container(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//Home Navigation
class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  String _yourName = 'none';
  String _yourAge = 'none';
  String _address = 'none';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (name) {
                setState(() {
                  _yourName = name;
                });
              },
              decoration: InputDecoration(
                labelText: 'Your Name',
                prefixIcon: Icon(Icons.perm_identity_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (age) {
                setState(() {
                  _yourAge = age;
                });
              },
              decoration: InputDecoration(
                labelText: 'Your Age',
                prefixIcon: Icon(Icons.agriculture_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (alamat) {
                setState(() {
                  _address = alamat;
                });
              },
              decoration: InputDecoration(
                labelText: 'Your Address',
                prefixIcon: Icon(Icons.home_filled),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Name: $_yourName'),
                const SizedBox(
                  height: 15,
                ),
                Text('Your Age: $_yourAge'),
                const SizedBox(
                  height: 15,
                ),
                Text('Address: $_address')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Pertemuan07Provider extends ChangeNotifier {
  List<String> _item = [
    "Tugas M01",
    "Tugas M02",
    "Tugas M03",
  ];

  List<String> get item => _item;

  set setitem(val) {
    _item = val;
    ChangeNotifier();
  }

  void additem() {
    _item.add("Tugas M0" + (_item.length + 1).toString());
    ChangeNotifier();
  }

  var light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.purple,
  );

  var dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.purple,
  );

  bool _enableDarkMode = false;

  bool get enableDarkMode => _enableDarkMode;

  set setBrightness(val) {
    _enableDarkMode = val;
    notifyListeners();
  }

  //show and hide
  bool _isDropdownVisible = false;

  bool get isDropdownShow => _isDropdownVisible;

  set isDropdownShow(value) {
    _isDropdownVisible = value;
    notifyListeners();
  }
}
