import 'package:flutter/material.dart';
import 'package:uts3mobile/homepage.dart';
import 'package:uts3mobile/trainjadwal.dart';
import 'package:uts3mobile/trainpost.dart';
import 'package:uts3mobile/traintarif.dart';
import 'package:uts3mobile/traintiket.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Ganti ini menjadi TrainPost
      // route here
      initialRoute: '/homepage',
      routes: {
        '/homepage': (context) {
          return HomePage();
        },
        '/trainjadwal': (context) {
          return TrainJadwal();
        },
        '/trainpost': (context) {
          return TrainPost();
        },
        '/traintarif': (context) {
          return TrainTarif();
        },
        '/traintiket': (context) {
          return TicketPage();
        },
      },

      title: 'Monitor Kereta API',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
