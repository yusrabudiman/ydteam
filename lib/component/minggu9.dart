import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class minggu9 extends StatefulWidget {
  const minggu9({super.key});

  @override
  State<minggu9> createState() => _minggu9State();
}

class _minggu9State extends State<minggu9> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Pertemuan09Provider()),
      ],
      child: Consumer<Pertemuan09Provider>(
        builder: (context, prov, _) => MaterialApp(
          theme: prov.enableDarkMode == true ? prov.dark : prov.light,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: Text('Navigation bar'),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              automaticallyImplyLeading: true,
            ),
            body: Pertemuan09Screen(),
          ),
        ),
      ),
    );
  }
}

class Pertemuan09Screen extends StatefulWidget {
  const Pertemuan09Screen({super.key});

  @override
  State<Pertemuan09Screen> createState() => _Pertemuan09ScreenState();
}

class _Pertemuan09ScreenState extends State<Pertemuan09Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, //set tab bar view
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pertemuan 09'),
          bottom: TabBar(isScrollable: true, tabs: [
            Tab(
              child: Text('User'),
            ),
            Tab(
              child: Text('Favorite'),
            ),
            // Tab(
            //   child: Text('Saved'),
            // ),
          ]),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(color: Colors.purple),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Image.asset('assets/twitter logo.jpg'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dani',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'dani@gmail.com',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Settings()));
                },
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeList(),
            Favorite(),
          ],
        ),
      ),
    );
  }
}

//Favorite
class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final provider = Pertemuan09Provider.of(context);
    final items = provider.item;
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(items[index]),
            trailing: IconButton(
              onPressed: () {
                provider.toggleFavorite(item);
                Clipboard.setData(ClipboardData(text: item[index]));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('User Telah Dihapus'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              icon: provider.isExist(item)
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(Icons.favorite_border),
            ),
          );
        },
      ),
    );
  }
}

//HomeList
class HomeList extends StatefulWidget {
  HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'https://png.pngtree.com/element_our/png/20181129/vector-illustration-of-fresh-red-apple-with-single-leaf-png_248312.jpg',
      'https://i.ytimg.com/vi/dRC7XDGlrO4/frame0.jpg',
      'https://png.pngtree.com/thumb_back/fh260/background/20191120/pngtree-sunset-nature-landscape-with-big-tree-image_322506.jpg',
      'https://i0.wp.com/www.teahub.io/photos/full/301-3019765_pemandangan.jpg'
    ];
    final List<String> items = [
      'Rivaldi Master of Ceremony',
      'budi Veteran player',
      'Non Character Player',
      'whatsapp'
    ];
    final List<String> subitems = [
      'Super active player',
      'Player Genshin impact',
      'silent forever at university or school',
      'wa.me/settings'
    ];

    final provider = Pertemuan09Provider.of(context);

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imageList[index]),
          ),
          title: Text(items[index]),
          subtitle: Text(subitems[index]),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
          onTap: () {
            showBottomSheet(
                enableDrag: true,
                context: context,
                builder: (context) {
                  final theme = Theme.of(context);
                  return Wrap(
                    children: [
                      ListTile(
                        title: Text(
                          'Select Action',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                        tileColor: theme.colorScheme.primary,
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            )),
                      ),
                      ListTile(
                        title: Text('Send Name'),
                        trailing: IconButton(
                            onPressed: () {
                              Share.share(items[index]);
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.perm_identity_outlined,
                            )),
                      ),
                      ListTile(
                        title: Text('Copy Status'),
                        trailing: IconButton(
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: subitems[index]));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text(subitems[index] + ' Telah Disalin'),
                                  duration: Duration(seconds: 3),
                                  action: SnackBarAction(
                                      label: 'Dismiss', onPressed: () {}),
                                ),
                              );
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.copy,
                            )),
                      ),
                      ListTile(
                        title: Text('Favorite'),
                        trailing: IconButton(
                            onPressed: () {
                              provider.toggleFavorite(item);
                              Clipboard.setData(
                                  ClipboardData(text: items[index]));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Favorite ' + items[index]),
                                  duration: Duration(seconds: 2),
                                  action: SnackBarAction(
                                      label: 'Dismiss', onPressed: () {}),
                                ),
                              );
                              Navigator.pop(context);
                            },
                            icon: provider.isExist(item)
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(Icons.favorite_border)),
                      ),
                    ],
                  );
                });
          },
        );
      },
    );
  }
}

//Settings
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan09Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Darkmode mode theme'),
                Switch(
                    value: prov.enableDarkMode,
                    activeColor: Colors.purple,
                    onChanged: (val) {
                      prov.setBrightness = val;
                    })
              ],
            ),
            // TextButton(
            //   onPressed: () {
            //     print('Settings');
            //   },
            //   child: Text('Settings'),
            // ),
          ],
        ),
      ),
    );
  }
}

class Pertemuan09Provider extends ChangeNotifier {
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

  bool _isDropdownVisible = false;

  bool get isDropdownShow => _isDropdownVisible;

  set isDropdownShow(value) {
    _isDropdownVisible = value;
    notifyListeners();
  }

  //Add favorite remove
  List<String> _items = [];
  List<String> get item => _items;

  void toggleFavorite(String item) {
    final isExist = _items.contains(item);
    if (isExist) {
      _items.remove(item);
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  bool isExist(String item) {
    final isExist = _items.contains(item);
    return isExist;
  }

  void clearFavorite() {
    _items = [];
    notifyListeners();
  }

  static Pertemuan09Provider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<Pertemuan09Provider>(
      context,
      listen: listen,
    );
  }
}
