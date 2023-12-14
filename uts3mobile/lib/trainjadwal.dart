import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uts3mobile/traintiket.dart';
import 'db_manager.dart';
import 'package:http/http.dart' as http;

class TrainJadwal extends StatefulWidget {
  const TrainJadwal({Key? key}) : super(key: key);

  @override
  _PesanTiket createState() => _PesanTiket();
}

class _PesanTiket extends State<TrainJadwal> {
  final dbHelper = DatabaseHelper.instance;
  final TextEditingController stasiunAwalController = TextEditingController();
  final TextEditingController stasiunAkhirController = TextEditingController();
  final TextEditingController jamKeberangkatanController =
      TextEditingController();
  final TextEditingController namaController = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text('Pemesanan Tiket', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formGlobalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nama',
                style: TextStyle(fontSize: 18.0),
              ),
              TextFormField(
                controller: namaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Nama',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Stasiun Awal',
                style: TextStyle(fontSize: 18.0),
              ),
              TextFormField(
                controller: stasiunAwalController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Stasiun Awal tidak boleh kosong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Stasiun Awal',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Stasiun Akhir',
                style: TextStyle(fontSize: 18.0),
              ),
              TextFormField(
                controller: stasiunAkhirController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Stasiun Akhir tidak boleh kosong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Stasiun Akhir',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Jam Keberangkatan',
                style: TextStyle(fontSize: 18.0),
              ),
              TextFormField(
                controller: jamKeberangkatanController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Jam keberangkatan tidak boleh kosong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Jam keberangkatan',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    _insert();
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  textStyle: TextStyle(fontSize: 18.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                ),
                child: Text('Pesan Tiket'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _insert() async {
    var requestBody = {
      'nama': namaController.text,
      'stasiunAwal': stasiunAwalController.text,
      'stasiunAkhir': stasiunAkhirController.text,
      'jamKeberangkatan': jamKeberangkatanController.text,
    };

    print(requestBody);
    var url = 'https://pemrograman-pinnie.000webhostapp.com//kereta_add.php';
    var uri = Uri.parse(url);
    var response = await http.post(uri, body: requestBody);
    var body = response.body;
    var json = jsonDecode(body);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(json['message'])));
    if (json['success'] == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tiket berhasil dipesan!'),
        ),
      );

      // Berpindah ke halaman TicketPage setelah menunggu sebentar.
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TicketPage()),
        );
      });
    }
  }
}
