import 'package:flutter/material.dart';

class minggu3 extends StatefulWidget {
  const minggu3({super.key});

  @override
  State<minggu3> createState() => _minggu3State();
}

class _minggu3State extends State<minggu3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Three Millions'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: const [
                    SizedBox(
                      width: 40,
                      child: Icon(Icons.list_alt),
                    ),
                    Text('Nama Barang'),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Nama Barang",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    SizedBox(
                      width: 40,
                      child: Icon(Icons.subject),
                    ),
                    Text('Deskripsi Barang'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: TextField(
                        minLines: 3,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Tambah Keterangan Barang",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 40,
                          child: Icon(Icons.shopping_cart),
                        ),
                        Text('Jumlah Pemesanan'),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 40,
                          child: Icon(Icons.price_check),
                        ),
                        Text('Harga Barang'),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Jumlah Barang',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Masukkan harga',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'Batal',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue,
                      ),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'Simpan',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
