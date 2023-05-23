import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class minggu4 extends StatefulWidget {
  const minggu4({Key? key}) : super(key: key);

  @override
  _minggu4State createState() => _minggu4State();
}

class _minggu4State extends State<minggu4> {
  final List listKegiatan = [];
  final List listKeterangan = [];
  final List listTglMulai = [];
  final List listTglSelesai = [];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Pertemuan04Provider(
            listKegiatan: listKegiatan,
            listKeterangan: listKeterangan,
            listTglMulai: listTglMulai,
            listTglSelesai: listTglSelesai,
          ),
        ),
      ],
      child: Consumer<Pertemuan04Provider>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Pertemuan 04 provider'),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
              automaticallyImplyLeading: true,
            ),
            body: const MyWidget(
              listKeterangan: [],
              listKegiatan: [],
              listTglMulai: [],
              listTglSelesai: [],
            ), // Replace with your desired body widget
          ),
        ),
      ),
    );
  }
}

class Pertemuan04Provider extends ChangeNotifier {
  final List listKegiatan;
  final List listKeterangan;
  final List listTglMulai;
  final List listTglSelesai;

  Pertemuan04Provider({
    required this.listKegiatan,
    required this.listKeterangan,
    required this.listTglMulai,
    required this.listTglSelesai,
  });
}

class MyWidget extends StatefulWidget {
  const MyWidget(
      {super.key,
      required this.listKegiatan,
      required this.listKeterangan,
      required this.listTglMulai,
      required this.listTglSelesai});

  final List listKegiatan;
  final List listKeterangan;
  final List listTglMulai;
  final List listTglSelesai;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: listKegiatan.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, right: 15.0, left: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Stack(children: [
                            Center(
                              child: Icon(
                                Icons.circle,
                                size: 50,
                                color: Colors.purple[700],
                              ),
                            ),
                            Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listKegiatan[index],
                              style: const TextStyle(
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              listKeterangan[index],
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blue,
                              ),
                              child: const Text(
                                'Work',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              listTglMulai[index],
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              listTglSelesai[index],
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LatihanM3()));
        },
        tooltip: 'Buat Data Baru disini',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LatihanM3 extends StatefulWidget {
  const LatihanM3({super.key});

  @override
  State<LatihanM3> createState() => _LatihanM3State();
}

//global declaration
List listKegiatan = [];
List listKeterangan = [];
List listTglMulai = [];
List listTglSelesai = [];

class _LatihanM3State extends State<LatihanM3> {
  String itemSelected = 'Work';
  List items = <String>[
    'Routine',
    'Work',
    'Sleep',
  ];

  TextEditingController kegiatan = TextEditingController();
  TextEditingController keterangan = TextEditingController();
  TextEditingController tglSelesai = TextEditingController();

  String now = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();

  bool? isKegiatanEmpty;
  bool? isKeteranganEmpty;
  bool? isTglSelesaiEmpty;

  void TambahkanTugas(
      valueKegiatan, valueKeterangan, valueTglMulai, valueTglSelesai) {
    listKegiatan.add(valueKegiatan);
    listKeterangan.add(valueKeterangan);
    listTglMulai.add(valueTglMulai);
    listTglSelesai.add(valueTglSelesai);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos Add Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Row(children: const [
                        Icon(Icons.list_alt),
                        Padding(padding: EdgeInsets.only(right: 7)),
                        Text(
                          'Kegiatan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ])),
                  Expanded(
                    flex: 6,
                    child: TextFormField(
                      controller: kegiatan,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Judul Kegiatan',
                          errorText: isKegiatanEmpty == true
                              ? 'Judul Kegiatan Harus Diisi'
                              : null),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.sort),
                        Padding(padding: EdgeInsets.only(right: 7)),
                        Text(
                          'Keterangan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: TextFormField(
                        controller: keterangan,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Tambah Keterangan',
                            errorText: isKeteranganEmpty == true
                                ? 'Keterangan Harus Diisi'
                                : null),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                    children: const [
                      Icon(Icons.calendar_month),
                      Padding(padding: EdgeInsets.only(right: 7)),
                      Text(
                        'Tanggal Mulai',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Row(
                    children: const [
                      Icon(Icons.calendar_month_outlined),
                      Padding(padding: EdgeInsets.only(right: 7)),
                      Text(
                        'Tanggal Selesai',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 30),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          labelText: '20-03-2022',
                          labelStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 30),
                      child: TextFormField(
                        controller: tglSelesai,
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: now,
                            labelStyle: const TextStyle(fontSize: 14),
                            errorText: isTglSelesaiEmpty == true
                                ? 'Tanggal Selesai Harus Diisi'
                                : null),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.category),
                      const Text(
                        'Kategori',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DropdownButton(
                            items: items.map((item) {
                              return DropdownMenuItem(
                                child: Text(item),
                                value: item,
                              );
                            }).toList(),
                            value: itemSelected,
                            onChanged: (val) {
                              setState(() {
                                itemSelected = val as String;
                              });
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Batal'),
                  )),
                  const Padding(padding: EdgeInsets.all(5)),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      if (kegiatan.text.isEmpty) {
                        setState(() {
                          isKegiatanEmpty = true;
                        });
                      }

                      if (keterangan.text.isEmpty) {
                        setState(() {
                          isKeteranganEmpty = true;
                        });
                      }

                      if (tglSelesai.text.isEmpty) {
                        setState(() {
                          isTglSelesaiEmpty = true;
                        });
                      } else {
                        setState(() {
                          isKegiatanEmpty = false;
                          isKeteranganEmpty = false;
                          isTglSelesaiEmpty = false;
                          TambahkanTugas(
                              kegiatan.text,
                              keterangan.text,
                              "${DateFormat('dd-MM-yyyy').format(DateTime.now())} s/d",
                              "${tglSelesai.text} s/d");
                        });

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyWidget(
                            listKegiatan: listKegiatan,
                            listKeterangan: listKeterangan,
                            listTglMulai: listTglMulai,
                            listTglSelesai: listTglSelesai,
                          );
                        }));
                      }
                    },
                    child: const Text(
                      'Simpan',
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
