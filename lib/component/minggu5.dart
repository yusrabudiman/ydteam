import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class minggu5 extends StatefulWidget {
  const minggu5({Key? key}) : super(key: key);

  @override
  _minggu5State createState() => _minggu5State();
}

class _minggu5State extends State<minggu5> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Pertemuan05Provider()),
        ],
        child: Consumer<Pertemuan05Provider>(
          builder: (context, value, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('M05 title check box'),
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                automaticallyImplyLeading: true,
              ),
              body: Pertemuan05Screen(),
            ),
          ),
        ));
  }
}

class Pertemuan05Screen extends StatefulWidget {
  const Pertemuan05Screen({super.key});

  @override
  State<Pertemuan05Screen> createState() => _Pertemuan05ScreenState();
}

class _Pertemuan05ScreenState extends State<Pertemuan05Screen> {
  //status soal1
  bool? soal1a = false;
  bool? soal1b = false;

  //soal 2
  String soal2 = 'answ';

  //pilih kelas
  bool kelasPagi = false;
  bool kelasSiang = false;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan05Provider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //soal menggunakan checkbox
              const Text(
                  '1. Memori yang berfungsi untuk tempat penyimpanan data sementara disebut..'),
              Row(
                children: [
                  Text('a.'),
                  SizedBox(width: 5),
                  Checkbox(
                    value: soal1a,
                    onChanged: (val) {
                      setState(() {
                        soal1a = val;
                      });
                    },
                  ),
                  Text('RAM'),
                ],
              ),
              Row(
                children: [
                  Text('b.'),
                  SizedBox(width: 5),
                  Checkbox(
                    value: soal1b,
                    onChanged: (val) {
                      setState(() {
                        soal1b = val;
                      });
                    },
                  ),
                  Text('Random Access Memory'),
                ],
              ),

              //respon jawaban soal 1
              if (soal1a == false && soal1b == false)
                Container()
              else if (soal1a == true && soal1b == true)
                const Text(
                  'Benar!',
                  style: TextStyle(color: Colors.green),
                )
              else
                const Text(
                  'Jawaban Masih salah, coba lagi',
                  style: TextStyle(color: Colors.red),
                ),

              const Divider(),
              //soal 2 checkbox
              const Text('2.Skema desain pengembangan jaringan disebut..'),
              Row(
                children: [
                  Text('a.'),
                  SizedBox(width: 5),
                  Radio(
                    value: 'topologi',
                    groupValue: soal2,
                    onChanged: (val) {
                      setState(() {
                        soal2 = 'topologi';
                      });
                    },
                  ),
                  Text('Topologi'),
                ],
              ),
              Row(
                children: [
                  Text('b.'),
                  SizedBox(width: 5),
                  Radio(
                    value: 'desain jaringan',
                    groupValue: soal2,
                    onChanged: (val) {
                      setState(() {
                        soal2 = 'desain jaringan';
                      });
                    },
                  ),
                  Text('Desain Jaringan'),
                ],
              ),
              //cek jawaban
              if (soal2 == 'answ')
                Container()
              else if (soal2 == 'topologi')
                const Text(
                  'benar!',
                  style: TextStyle(color: Colors.green),
                )
              else
                const Text(
                  'Jawaban masih salah, coba lagi',
                  style: TextStyle(color: Colors.red),
                ),

              //Choice Chip
              const Divider(),
              const Text(
                'Feedback soal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Kelas'),
              Row(
                children: [
                  ChoiceChip(
                    label: Text('Pagi'),
                    selected: kelasPagi,
                    selectedColor: Colors.blue[200],
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          kelasPagi = val;
                          kelasSiang = !val;
                        } else {
                          kelasPagi = false;
                          kelasSiang = false;
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 5),
                  ChoiceChip(
                    label: Text('Siang'),
                    selected: kelasSiang,
                    selectedColor: Colors.blue[200],
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          kelasSiang = val;
                          kelasPagi = !val;
                        } else {
                          kelasPagi = false;
                          kelasSiang = false;
                        }
                      });
                    },
                  )
                ],
              ),
              const Text('Soal di atas telah di pelajari saat ?..'),
              Row(
                children: [
                  FilterChip(
                    label: Text('Sekolah'),
                    selectedColor: Colors.blue[200],
                    selected: prov.statusSekolah,
                    onSelected: (val) {
                      prov.setSekolah = val;
                    },
                  ),
                  const SizedBox(width: 5),
                  FilterChip(
                    label: Text('Praktikum'),
                    selectedColor: Colors.blue[200],
                    selected: prov.statusPraktik,
                    onSelected: (val) {
                      prov.setPraktik = val;
                    },
                  ),
                  const SizedBox(width: 5),
                  FilterChip(
                    label: Text('Kursus'),
                    selectedColor: Colors.blue[200],
                    selected: prov.statusKursus,
                    onSelected: (val) {
                      prov.setKursus = val;
                    },
                  ),
                ],
              ),

              //InputChips
              const Text('Perminatan saat sekolah?'),
              Consumer<Pertemuan05Provider>(
                builder: (context, prov, child) {
                  List<Widget> InputChips = [];

                  if (prov.statusjurusanTkj) {
                    InputChips.add(Chip(
                      label: Text('TKJ'),
                      backgroundColor: Colors.blue,
                    ));
                  } else if (prov.statusjurusanRpl) {
                    InputChips.add(Chip(
                      label: Text('RPL'),
                      backgroundColor: Colors.blue,
                    ));
                  } else if (prov.statusjurusanSma) {
                    InputChips.add(Chip(
                      label: Text('SMA'),
                      backgroundColor: Colors.blue,
                    ));
                  }

                  return Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [...InputChips],
                        ),
                      )
                    ],
                  );
                },
              ),
              Row(
                children: [
                  InputChip(
                    label: Text('TKJ'),
                    selected: prov.statusjurusanTkj,
                    selectedColor: Colors.blue[200],
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          prov.setTkj = val;
                          prov.setRpl = !val;
                          prov.setSma = !val;
                        } else {
                          prov.setTkj = false;
                          prov.setRpl = false;
                          prov.setSma = false;
                        }
                      });
                    },
                  ),
                  SizedBox(width: 5),
                  InputChip(
                    label: Text('RPL'),
                    selected: prov.statusjurusanRpl,
                    selectedColor: Colors.blue[200],
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          prov.setTkj = !val;
                          prov.setRpl = val;
                          prov.setSma = !val;
                        } else {
                          prov.setTkj = false;
                          prov.setRpl = false;
                          prov.setSma = false;
                        }
                      });
                    },
                  ),
                  SizedBox(width: 5),
                  InputChip(
                    label: Text('SMA'),
                    selected: prov.statusjurusanSma,
                    selectedColor: Colors.blue[200],
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          prov.setTkj = !val;
                          prov.setRpl = !val;
                          prov.setSma = val;
                        } else {
                          prov.setTkj = false;
                          prov.setRpl = false;
                          prov.setSma = false;
                        }
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//provider
class Pertemuan05Provider extends ChangeNotifier {
  // status sekolah telah dipelajari saat

  //inisialisasi nilai awal
  bool _diSekolah = false;
  bool _diPraktik = true;
  bool _diKursus = false;

  //ini akan return dari sekolah, di praktik, mengguanakan konsep OOP setter || getter
  bool get statusSekolah => _diSekolah;
  bool get statusPraktik => _diPraktik;
  bool get statusKursus => _diKursus;

  //perubahan state, menggunakan konsep listen stateManajemen
  set setSekolah(val) {
    _diSekolah = val;
    notifyListeners();
  }

  set setPraktik(val) {
    _diPraktik = val;
    notifyListeners();
  }

  set setKursus(val) {
    _diKursus = val;
    notifyListeners();
  }

  //Exercise
  //Perminatan sekolah
  bool _disekolahTkj = false;
  bool _disekolahRpl = true;
  bool _disekolahSma = false;

  //callback using prov from final prov.statusjurusanTkj
  bool get statusjurusanTkj => _disekolahTkj;
  bool get statusjurusanRpl => _disekolahRpl;
  bool get statusjurusanSma => _disekolahSma;

  set setTkj(val) {
    _disekolahTkj = val;
    notifyListeners();
  }

  set setRpl(val) {
    _disekolahRpl = val;
    notifyListeners();
  }

  set setSma(val) {
    _disekolahSma = val;
    notifyListeners();
  }
}
