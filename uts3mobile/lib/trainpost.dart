import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: TrainPost(),
  ));
}

class TrainPost extends StatefulWidget {
  @override
  _TrainPostState createState() => _TrainPostState();
}

class _TrainPostState extends State<TrainPost> {
  bool isButtonPressed = false;
  String? selectedStasiun; // Menyimpan stasiun yang dipilih dari DropdownButton

  List<String> stasiunList = [
    "Stasiun Bogor",
    "Stasiun Cisauk",
    "Stasiun Tanah Abang",
    "Stasiun Matraman",
    "Stasiun Serpong",
    "Stasiun Rawa Buntu",
    "Stasiun Palmerah",
    "Stasiun Rangkasbitung",
  ];

  String generateRandomTime() {
    //membuat randomtime
    Random random = Random();
    int hour = random.nextInt(24);
    int minute = random.nextInt(60);

    return '$hour:${minute.toString().padLeft(2, '0')}';
  }

  String generateRandomNominal(List<String> nominalValues) {
    //membuat random nominal
    Random random = Random();
    int randomIndex = random.nextInt(nominalValues.length);
    return nominalValues[randomIndex];
  }

  String generateRandomText(List<String> textOptions) {
    //membuat random text
    Random random = Random();
    int randomIndex = random.nextInt(textOptions.length);
    return textOptions[randomIndex];
  }

  void _showReminderSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Anda belum memilih stasiun!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text('Lokasi Kereta', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Stasiun Tujuan',
                  style: TextStyle(fontSize: 18.0),
                ),
                DropdownButton<String>(
                  value: selectedStasiun,
                  onChanged: (value) {
                    setState(() {
                      selectedStasiun = value;
                    });
                  },
                  items: stasiunList.map((String stasiun) {
                    return DropdownMenuItem<String>(
                      value: stasiun,
                      child: Text(stasiun),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedStasiun == null) {
                        // Tampilkan Snackbar jika stasiun belum dipilih
                        _showReminderSnackbar(context);
                      } else {
                        setState(() {
                          isButtonPressed = true;
                        });
                      }
                    },
                    child: Text(
                      'Cek Posisi',
                    ),
                  ),
                ),
                // Tampilkan elemen berdasarkan isButtonPressed
                if (isButtonPressed)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.0),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.train,
                              size: 30,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedStasiun ?? 'Belum Memilih Stasiun',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  generateRandomNominal(
                                      ['SF10', 'SF20', 'SF30']),
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  generateRandomText([
                                    'Sedang Dalam Perjalanan', //menambahkan status kereta
                                    'Tiba di Stasiun'
                                  ]),
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                    'Waktu Tiba: ${generateRandomTime()}'), // menambahkan waktu tiba
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                    ],
                  ),
                if (isButtonPressed)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.0),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.train,
                              size: 30,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedStasiun ?? 'Belum Memilih Stasiun',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  generateRandomNominal(
                                      ['SF10', 'SF20', 'SF30']),
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  generateRandomText([
                                    'Sedang Dalam Perjalanan', //menambahkan status kereta
                                    'Tiba di Stasiun'
                                  ]),
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                    'Waktu Tiba: ${generateRandomTime()}'), // menambahkan waktu tiba
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                    ],
                  ),
                if (isButtonPressed)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.0),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.train,
                              size: 30,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedStasiun ?? 'Belum Memilih Stasiun',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  generateRandomNominal(
                                      ['SF10', 'SF20', 'SF30']),
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  generateRandomText([
                                    'Sedang Dalam Perjalanan', //menambahkan status kereta
                                    'Tiba di Stasiun'
                                  ]),
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                    'Waktu Tiba: ${generateRandomTime()}'), // menambahkan waktu tiba
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                    ],
                  ),
                if (isButtonPressed)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.0),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.train,
                              size: 30,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedStasiun ?? 'Belum Memilih Stasiun',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  generateRandomNominal(
                                      ['SF10', 'SF20', 'SF30']),
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  generateRandomText([
                                    'Sedang Dalam Perjalanan', //menambahkan status kereta
                                    'Tiba di Stasiun'
                                  ]),
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                    'Waktu Tiba: ${generateRandomTime()}'), // menambahkan waktu tiba
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                    ],
                  ),
                if (isButtonPressed)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.0),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.train,
                              size: 30,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedStasiun ?? 'Belum Memilih Stasiun',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  generateRandomNominal(
                                      ['SF10', 'SF20', 'SF30']),
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  generateRandomText([
                                    'Sedang Dalam Perjalanan', //menambahkan status kereta
                                    'Tiba di Stasiun'
                                  ]),
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                    'Waktu Tiba: ${generateRandomTime()}'), // menambahkan waktu tiba
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                    ],
                  ),
                if (isButtonPressed)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.0),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.train,
                              size: 30,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedStasiun ?? 'Belum Memilih Stasiun',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  generateRandomNominal(
                                      ['SF10', 'SF20', 'SF30']),
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  generateRandomText([
                                    'Sedang Dalam Perjalanan', //menambahkan status kereta
                                    'Tiba di Stasiun'
                                  ]),
                                  style: TextStyle(fontSize: 16.0),
                                ),

                                Text(
                                    'Waktu Tiba: ${generateRandomTime()}'), // menambahkan waktu tiba
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
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
