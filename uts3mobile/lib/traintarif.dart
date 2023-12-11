import 'package:flutter/material.dart';

class TrainTarif extends StatefulWidget {
  const TrainTarif({Key? key}) : super(key: key);

  @override
  _TrainTarifState createState() => _TrainTarifState();
}

class _TrainTarifState extends State<TrainTarif> {
  String? selectedOption1;

  Map<String, double> jarakDanTarif = {
    'Bogor-Cisauk': 5000.0,
    'Bogor-Pondok Aren': 8000.0,
    'Bogor-Serpong': 7000.0,
    'Cisauk-Serpong': 3000.0,
    'Serpong-Pondok Aren': 4000.0
    // Menambahkan Tarif jarak
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Tarif Perjalanan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 300,
              padding: EdgeInsets.all(16),
              child: DropdownButton<String>(
                value: selectedOption1,
                items: jarakDanTarif.keys.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption1 = newValue;
                  });
                },
                hint: Text('Pilih Jarak'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //Tombol Hitung ditekan
                _handleHitungButtonPressed();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Container(
                width: 300,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.attach_money, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'HITUNG',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleHitungButtonPressed() {
    if (selectedOption1 != null) {
      // Hitung tarif berdasarkan jarak yang dipilih
      final double tarif = jarakDanTarif[selectedOption1] ?? 0.0;
      if (tarif > 0) {
        // Tampilkan hasil perhitungan dalam dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Hasil Perhitungan'),
              content: Text('Tarif perjalanan: $tarif'),
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
      }
    } else {
      // Jika dropdown jarak belum dipilih, tampilkan pesan kesalahan
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Harap pilih jarak perjalanan terlebih dahulu.'),
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
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: TrainTarif(),
  ));
}
