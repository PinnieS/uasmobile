import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uts3mobile/traintiket.dart';
import 'db_manager.dart';

class TrainJadwal extends StatefulWidget {
  const TrainJadwal({Key? key}) : super(key: key);

  @override
  _PesanTiket createState() => _PesanTiket();
}

class _PesanTiket extends State<TrainJadwal> {
  final dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> allCategoryData = [];
  final TextEditingController stasiunAwalController = TextEditingController();
  final TextEditingController stasiunAkhirController = TextEditingController();
  final TextEditingController jamKeberangkatanController =
      TextEditingController();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Stasiun Awal',
              style: TextStyle(fontSize: 18.0),
            ),
            TextFormField(
              controller: stasiunAwalController,
              decoration: InputDecoration(
                hintText: 'Masukkan Stasiun Awal',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Stasiun Akhir',
              style: TextStyle(fontSize: 18.0),
            ),
            TextFormField(
              controller: stasiunAkhirController,
              decoration: InputDecoration(
                hintText: 'Masukkan Stasiun Akhir',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Jam Keberangkatan',
              style: TextStyle(fontSize: 18.0),
            ),
            TextFormField(
              controller: jamKeberangkatanController,
              decoration: InputDecoration(
                hintText: 'Masukkan Jam keberangkatan',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                {
                  if (stasiunAwalController.text.isEmpty ||
                      stasiunAkhirController.text.isEmpty ||
                      jamKeberangkatanController.text.isEmpty) {
                    // Menampilkan dialog error jika ada input yang kosong.
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Harap Diisi Terlebih Dahulu'),
                          actions: [
                            TextButton(
                              child: Text('Tutup'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    _insert();
                    // Menampilkan Snackbar.
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
              },
              child: Text('Pesan Tiket'),
            ),
          ],
        ),
      ),
    );
  }

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnStart: stasiunAwalController.text,
      DatabaseHelper.columnEnd: stasiunAkhirController.text,
      DatabaseHelper.columnDate: jamKeberangkatanController.text,
    };
    print('insert stRT');

    final id = await dbHelper.insert(row);
    if (kDebugMode) {
      print('inserted row id: $id');
    }
    _query();
    Navigator.push(context, MaterialPageRoute(builder: (_) => TicketPage()));
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    if (kDebugMode) {
      print('query all rows:');
    }
    for (var element in allRows) {
      allCategoryData.add(element["name"]);
    }
    setState(() {});
  }
}
