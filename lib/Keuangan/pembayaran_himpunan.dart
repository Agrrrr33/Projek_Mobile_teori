import 'package:flutter/material.dart';
// ini bagian homenya
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[400],
        scaffoldBackgroundColor: Colors.white,
      ),
      home: KeuanganScreen(),
    );
  }
}
// ini bagian homenya

class KeuanganScreen extends StatefulWidget {
  @override
  _KeuanganScreenState createState() => _KeuanganScreenState();
}

class _KeuanganScreenState extends State<KeuanganScreen> {
  List<Map<String, dynamic>> payments = [
    {'name': 'Iuran Bulanan', 'amount': 'Rp. 20.000', 'status': 'BL'},
    {'name': 'Iuran Kegiatan', 'amount': 'Rp. 100.000', 'status': 'BL'},
  ];

  void _handlePayment(int index) {
    setState(() {
      payments[index]['status'] = 'L';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () { //untuk kembali ke halaman sebelumnya
            // Handle back button press
          },
        ),
        title: Text('Keuangan', style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/logo.png'), // Ensure the logo is added in assets
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Text(
              'Pembayaran Himpunan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(1.3),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(2.1), // Additional column for button
            },
            border: TableBorder.symmetric(inside: BorderSide(color: Colors.grey)),
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.grey[200]),
                children: ['Pembayaran', 'Tagihan', 'Status', '']
                    .map((header) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      header,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                })
                    .toList(),
              ),
              ...payments.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> payment = entry.value;
                return TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(payment['name']),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(payment['amount']),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        payment['status'],
                        style: TextStyle(
                          color: payment['status'] == 'L' ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text('Bayar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: payment['status'] == 'L'
                              ? Colors.grey
                              : Colors.green, // Disable if already paid
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // Rectangular button
                          ),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: payment['status'] == 'L'
                            ? null
                            : () => _handlePayment(index), // Pay action
                      ),
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[400],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Mutasi'),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.qr_code, color: Colors.black),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
