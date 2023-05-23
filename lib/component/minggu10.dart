import 'package:flutter/material.dart';
// import 'package:backend_flutter/provider10.dart';
// import 'package:backend_flutter/screen10.dart';
import 'package:provider/provider.dart';

// import 'fullscreen_dialog.dart';

class minggu10 extends StatefulWidget {
  const minggu10({Key? key});

  @override
  _minggu10State createState() => _minggu10State();
}

class _minggu10State extends State<minggu10> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Pertemuan10Provider()),
      ],
      child: Consumer<Pertemuan10Provider>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: Text('M 10 Banner'),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              automaticallyImplyLeading: true,
            ),
            body: Pertemuan10Screen(),
          ),
        ),
      ),
    );
  }
}

class Pertemuan10Screen extends StatefulWidget {
  const Pertemuan10Screen({super.key});

  @override
  State<Pertemuan10Screen> createState() => Pertemuan10ScreenState();
}

class Pertemuan10ScreenState extends State<Pertemuan10Screen> {
  List<String> ringtones = [
    'None',
    'None',
    'None',
    'None',
    'None',
    'None',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          MaterialBanner(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Banner',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('Text.')
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => ScaffoldMessenger.of(context)
                  ..removeCurrentMaterialBanner()
                  ..showMaterialBanner(showBanner(context, '')),
                child: const Text('Show Banner'),
              ),
            ],
          ),
          MaterialBanner(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Dialogs',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('Pertemuan 10')
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => showPeringatan(context),
                ),
                child: const Text('Alert'),
              ),
              // TextButton(
              //   onPressed: () => showRingtoneDialog(context),
              //   child: const Text('Simple Dialog'),
              // ),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: ((context) => const FullScreenDialog()))),
                  child: const Text('Fullscreen Dialog'))
            ],
          ),
          MaterialBanner(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Snackbars',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                    'Snackbars provide brief messages about app processes at the bottom of the screen.'),
              ],
            ),
            actions: [
              TextButton(
                  child: const Text('Snackbar'),
                  onPressed: () => ScaffoldMessenger.of(context)
                      .showSnackBar((showSnackBar10(context, '')))),
            ],
          ),
        ],
      ),
    );
  }

  showBanner(BuildContext context, info) {
    return MaterialBanner(
      content: Text('Ringtone telah diubah $info'),
      leading: const Icon(
        Icons.info,
        color: Colors.blue,
      ),
      actions: [
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(showSnackBar10(context, info));
          },
          child: const Text('Update'),
        ),
        TextButton(
          onPressed: () =>
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
          child: const Text('Dismiss'),
        ),
      ],
    );
  }

  showPeringatan(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset settings?'),
      content: const Text(
          'This will reset your device to its default factory settings.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('ACCEPT'),
        ),
      ],
    );
  }

  showSnackBar10(BuildContext context, info) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 6),
      content: Text('Ringtone $info telah diterapkan'),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () => ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..removeCurrentMaterialBanner(),
      ),
    );
  }

  // showRingtoneDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext peringatan) {
  //       final provider = Provider.of<Pertemuan10Provider>(peringatan);
  //       return AlertDialog(
  //         title: const Text('Select Ringtone'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             for (var ringtone in provider.ringtones)
  //               RadioListTile(
  //                 title: Text(ringtone),
  //                 value: ringtone,
  //                 groupValue: provider.selectedRingtone,
  //                 onChanged: (value) {
  //                   provider.selectedRingtone = value.toString();
  //                 },
  //               ),
  //             // Add more radio list tiles for each ringtone
  //           ],
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('Cancel'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               ScaffoldMessenger.of(context).showMaterialBanner(
  //                   showBanner(context, provider.selectedRingtone));
  //               print('Selected Ringtone: ${provider.selectedRingtone}');
  //               Navigator.of(peringatan).pop();
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}

//fullscreendialog
class FullScreenDialog extends StatelessWidget {
  const FullScreenDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Dialog'),
      ),
      body: const Center(
        child: Text('Full Screen Dialog'),
      ),
    );
  }
}

//pertemuan10provider
class Pertemuan10Provider extends ChangeNotifier {
  String _selectedRingtone = 'Ringtone 1';
  String get selectedRingtone => _selectedRingtone;

  set selectedRingtone(val) {
    _selectedRingtone = val;
    notifyListeners();
  }

  final List ringtones = [
    'None',
    'Callisto',
    'Ganymede',
    'Luna',
    'Oberon',
    'Phobos',
    'Dione',
  ];
}
