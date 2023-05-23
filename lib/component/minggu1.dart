import 'package:flutter/material.dart';

class minggu1 extends StatefulWidget {
  const minggu1({super.key});

  @override
  State<minggu1> createState() => _minggu1State();
}

class _minggu1State extends State<minggu1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tim kelompok 9 YdTeam'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Nama : Yusra Budiman Hasibuan'),
            Text('Nim : 211110993'),
            Text("Nama : David Bate'e"),
            Text('Nim : 211111930')
          ],
        ),
      ),
    );
  }
}
