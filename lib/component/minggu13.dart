import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class minggu13 extends StatefulWidget {
  const minggu13({super.key});

  @override
  State<minggu13> createState() => _minggu13State();
}

class _minggu13State extends State<minggu13> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Pertemuan13Provider()),
      ],
      child: Consumer<Pertemuan13Provider>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: Text('Pertemuan 13 custom generate screen'),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
            ),
            body: Pertemuan13Screen(),
          ),
        ),
      ),
    );
  }
}

//screen
class Pertemuan13Screen extends StatefulWidget {
  const Pertemuan13Screen({super.key});

  @override
  State<Pertemuan13Screen> createState() => _Pertemuan13ScreenState();
}

class _Pertemuan13ScreenState extends State<Pertemuan13Screen> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan13Provider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Duransi Memanggang: ${prov.sliderValue.round().toString()}'),
            const SlideWidget(),
            const Align(
              child: ProgressIndicatorWidget(),
              alignment: Alignment.bottomRight,
            ),
            SizedBox(height: 100),
            const ContentWidget()
          ],
        ),
      ),
    );
  }
}

//progress indicator
class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan13Provider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: Size(100, 90)),
      onPressed: () {
        if (prov.sliderValue.round() == 0) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Peringatan'),
                content: const Text('Durasi tidak boleh 0'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        } else {
          prov.mulaiMemanggang(prov.sliderValue.round());
        }
      },
      child: prov.sedangMemanggang == true
          ? TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(seconds: prov.sliderValue.round()),
              builder: (context, double value, _) => CircularProgressIndicator(
                value: value,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : const Text('Panggang'),
    );
  }
}

//Slidewidget
class SlideWidget extends StatelessWidget {
  const SlideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan13Provider>(context);
    return Tooltip(
      message: prov.sliderValue.round().toString(),
      child: Slider(
        value: prov.sliderValue,
        min: 0,
        max: 10,
        onChanged: (value) {
          prov.setSliderValue = value;
        },
      ),
    );
  }
}

//content widget
class ContentWidget extends StatelessWidget {
  const ContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan13Provider>(context);
    return Center(
        child: Container(
      child: prov.sedangMemanggang == true
          ? SizedBox(
              width: 100,
              child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: prov.sliderValue.round()),
                  builder: (context, double value, _) =>
                      LinearProgressIndicator(
                        value: value,
                      )),
            )
          : prov.selesaiMasak == true
              ? Tooltip(
                  message: 'Ayam Panggang',
                  child: Image.network(
                    'https://awsimages.detik.net.id/community/media/visual/2021/09/19/resep-sayap-ayam-panggang-bumbu-kecap-pedas-1_43.jpeg?w=1200',
                    width: 300,
                  ),
                )
              : Container(),
    ));
  }
}

//provider
class Pertemuan13Provider extends ChangeNotifier {
  double _sliderValue = 0;
  double get sliderValue => _sliderValue;

  set setSliderValue(val) {
    _sliderValue = val;
    notifyListeners();
  }

  bool _sedangMemanggang = false;
  bool get sedangMemanggang => _sedangMemanggang;
  set setSedangMemanggang(val) {
    _sedangMemanggang = val;
    notifyListeners();
  }

  bool _selesaiMasak = false;
  bool get selesaiMasak => _selesaiMasak;
  set setSelesaiMasak(val) {
    _selesaiMasak = val;
    notifyListeners();
  }

  mulaiMemanggang(int val) async {
    setSedangMemanggang = true;
    Future.delayed(Duration(seconds: val), () {
      setSedangMemanggang = false;
      setSelesaiMasak = true;
    });
  }
}
