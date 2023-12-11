import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uts3mobile/traintarif.dart';
// import 'package:uts3mobile/pesantiket.dart';
// import 'package:uts3mobile/trainpost.dart';

void main() {
  runApp(
    MaterialApp(
      // ThemeMode.light akan mengatur tema awal menjadi terang.
      themeMode: ThemeMode.light,
      // ThemeData untuk tema terang.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Ganti dengan warna yang sesuai.
      ),
      // ThemeData untuk tema gelap.
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    ),
  );
}
// masih ngasal

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("About Us"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Made by love from :"),
              Text(
                  "Bernardus Alvin Rig 202104560002, Pedro 20210456, Rafael 20210456", // Gantilah "Nama Kelompok" dengan nama kelompok yang sesuai
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Tutup"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SELAMAT DATANG',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white),
                            ),
                            Text(
                              'Monitoring Kereta Api',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/kai.png'),
                          radius: 25,
                        ),
                      ],
                    ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(vertical: 10),
                    //   padding: EdgeInsets.all(20.0),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.all(Radius.circular(30)),
                    //       color: Colors.white),
                    //   child: Row(
                    //     children: [Icon(Icons.search), Text('Pilih Tujuan')],
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Image.asset('assets/maps.jpg'),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'PELAYANAN KAMI',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/trainpost');
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3)),
                        margin: EdgeInsets.symmetric(vertical: 25),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'LOKASI KERETA',
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Melihat Location Kereta',
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.white))
                                ],
                              ),
                              Icon(
                                Icons.location_searching_outlined,
                                color: Colors.white,
                                size: 40,
                              )
                            ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/trainjadwal');
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3)),
                        margin: EdgeInsets.symmetric(vertical: 25),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'JADWAL KERETA',
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Pesan Tiket Disini',
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.white))
                                ],
                              ),
                              Icon(
                                Icons.book_online_outlined,
                                color: Colors.white,
                                size: 40,
                              )
                            ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrainTarif()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3)),
                        margin: EdgeInsets.symmetric(vertical: 25),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'TARIF',
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Informasi Tentang Stasiun',
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.white))
                                ],
                              ),
                              Icon(
                                Icons.train_outlined,
                                color: Colors.white,
                                size: 40,
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _showDialog(context); // manggil fungsi
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  '© 2023 Kelompok 3',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void ambilData() async {
    var url = 'https://pemrograman-pinnie.000webhostapp.com/user_list.php';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var body = response.body;
    var json = jsonDecode(body);
    setState(() {
      users = json['data']['users'];
    });
  }

   void insertData() async {
    var name = txtName.text;
    var email = txtEmail.text;
    var requestBody = {
      'name' : name,
      'email' : email
    };


    var url = 'https://pemrograman-pinnie.000webhostapp.com/user_add.php';
    var uri = Uri.parse(url);
    var response = await http.post(uri, body: requestBody);
    var body = response.body;
    var json = jsonDecode(body);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(json['message'])));
    if(json['success'] == 1){
      ambilData();
    }

   }