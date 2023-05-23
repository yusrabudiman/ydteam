import 'package:flutter/material.dart';

class minggu2 extends StatefulWidget {
  const minggu2({super.key});

  @override
  State<minggu2> createState() => _minggu2State();
}

class _minggu2State extends State<minggu2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second button'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            color: Color.fromARGB(255, 252, 252, 252),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 108, 108, 108),
                      width: 2,
                    ),
                  ),
                  child: Container(
                    child: const Center(
                      child: Text(
                        "Strawberry Pavlova",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 34, 34, 34),
                      width: 2,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: .3),
                    child: const Center(
                      child: Text(
                        "Pavlova is a meringue-based\ndessert named after the Russian\nballerine Anna Pavlora.\nPavlora featues a crisp crust and\nsoft, light inside, topped with fruit\nand whipped cream",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Color.fromARGB(255, 7, 7, 7)),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 34, 34, 34),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 73, 73, 73),
                        size: 20.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 73, 73, 73),
                        size: 20.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 73, 73, 73),
                        size: 20.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 73, 73, 73),
                        size: 20.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 73, 73, 73),
                        size: 20.0,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: .3),
                          child: const Center(
                            child: Text(
                              "170 Reviews",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color.fromARGB(255, 7, 7, 7),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 34, 34, 34),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.remove_red_eye_outlined,
                              size: 20, color: Color.fromARGB(255, 0, 0, 0)),
                          Text("VIEWS:"),
                          Text("16464"),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.add_circle_outline,
                              size: 20, color: Color.fromARGB(255, 0, 0, 0)),
                          Text("POST:"),
                          Text("138"),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.search_off_outlined,
                              size: 20, color: Color.fromARGB(255, 0, 0, 0)),
                          Text("SEARCH:"),
                          Text("2746"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Garden_strawberry_%28Fragaria_%C3%97_ananassa%29_single2.jpg/330px-Garden_strawberry_%28Fragaria_%C3%97_ananassa%29_single2.jpg',
                        width: 150),
                    Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Garden_strawberry_%28Fragaria_%C3%97_ananassa%29_single2.jpg/330px-Garden_strawberry_%28Fragaria_%C3%97_ananassa%29_single2.jpg',
                        width: 150),
                  ],
                ),
                Row(
                  children: [
                    Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Garden_strawberry_%28Fragaria_%C3%97_ananassa%29_single2.jpg/330px-Garden_strawberry_%28Fragaria_%C3%97_ananassa%29_single2.jpg',
                        width: 150),
                    Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Garden_strawberry_%28Fragaria_%C3%97_ananassa%29_single2.jpg/330px-Garden_strawberry_%28Fragaria_%C3%97_ananassa%29_single2.jpg',
                        width: 150),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
