import 'package:flutter/material.dart';
import 'package:testing/admin/laporan_user.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Menu',
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 4; // Default index for the Profile page

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the respective screen based on the index
    if (index == 0) {
      // Navigate to HomePage (implement this)
    } else if (index == 1) {
      // Navigate to MutasiPage (implement this)
    } else if (index == 2) {
      // Navigate to QR Code Page (implement this)
    } else if (index == 3) {
      // Navigate to InfoPage (implement this)
    } else if (index == 4) {
      // Stay on Profile page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context, 0);
          },
        ),
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/logo.png'),
            ),
          ),
        ],
      ),

      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            _buildMenuItem(Icons.person, 'Biodata', context),
            _buildMenuItem(Icons.report, 'Laporan User', context),
            _buildMenuItem(Icons.chat, 'Chat', context),
            _buildMenuItem(Icons.info, 'Tentang Kami', context),
            _buildMenuItem(Icons.logout, 'Keluar', context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[400],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
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
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      onTap: () {
        // Add navigation or functionality here
        if (title == 'Biodata') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BiodataPage()),
          );
        } else if (title == 'Laporan User') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LaporanUser()),
          );
        } else if (title == 'Chat') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatPage()),
          );
        } else if (title == 'Tentang Kami') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TentangKamiPage()),
          );
        } else if (title == 'Keluar') {
          // Handle logout logic (if any)
        }
      },
    );
  }
}


  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      onTap: () {
        // Add navigation or functionality here
      },
    );
  }

class BiodataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Biodata')),
      body: Center(child: Text('Biodata Page Content')),
    );
  }
}


class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Center(child: Text('Chat Page Content')),
    );
  }
}

class TentangKamiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tentang Kami')),
      body: Center(child: Text('Tentang Kami Page Content')),
    );
  }
}
