import 'package:flutter/material.dart';
import 'db_manager.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final dbHelper = DatabaseHelper.instance;
  List<dynamic> allTicketData = [];

  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _query();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Ticket Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            for (var item in allTicketData)
              Card(
                margin: EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Name: Pengguna ${item['nama_penumpang']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Stasiun Awal: ${item['stasiun_asal']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Stasiun Akhir: ${item['stasiun_tujuan']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Jam Keberangkatan: ${item['waktu_berangkat']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Harga: ${item['total_pembayaran']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              _update(item);
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              _delete(item);
                            },
                            icon: Icon(Icons.delete_outline),
                          ),
                        ],
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

  void _query() async {
    await dbHelper.ambilData();
    setState(() {
      allTicketData = dbHelper.getPesanan();
    });
    print(allTicketData);
  }

  void _update(item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Ticket'),
          content: SingleChildScrollView(
            child: Form(
              key: formGlobalKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: item['nama_penumpang'],
                    decoration: InputDecoration(labelText: 'Nama'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    initialValue: item['stasiun_asal'],
                    decoration: InputDecoration(labelText: 'Stasiun Awal'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Stasiun Awal tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    initialValue: item['stasiun_tujuan'],
                    decoration: InputDecoration(labelText: 'Stasiun Akhir'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Stasiun Akhir tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    initialValue: item['waktu_berangkat'],
                    decoration: InputDecoration(labelText: 'Jam Keberangkatan'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Jam Keberangkatan tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Simpan'),
              onPressed: () {
                if (formGlobalKey.currentState?.validate() ?? false) {
                  _updateTicket(item);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _updateTicket(item) async {
    var updatedData = {
      'nama_penumpang': 'Updated Name', // Gantilah ini dengan nilai yang benar
      'stasiun_asal': 'Updated Start Station',
      'stasiun_tujuan': 'Updated End Station',
      'waktu_berangkat': 'Updated Departure Time',
    };

    await dbHelper.updateTicket(item['id'], updatedData);
    _query(); // Perbarui daftar tiket setelah pembaruan berhasil
  }

  void _delete(item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus Ticket'),
          content: Text('Apakah Anda yakin ingin menghapus tiket ini?'),
          actions: <Widget>[
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Hapus'),
              onPressed: () {
                _performTicketDelete(item);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _performTicketDelete(item) async {
    await dbHelper.deleteTicket(item['id']);
    _query(); // Perbarui daftar tiket setelah penghapusan berhasil
  }
}
