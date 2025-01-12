// lib/pages/home.dart

import 'package:flutter/material.dart';
import '../widgets/floatingButton.dart'; // Import MultiFloatingButtons
import 'profile.dart';
import 'daftarDoorsmeer.dart'; // Import HalamanDaftarDoorsmeer

class HalamanHome extends StatefulWidget {
  const HalamanHome({Key? key}) : super(key: key);

  @override
  _HalamanHomeState createState() => _HalamanHomeState();
}

class _HalamanHomeState extends State<HalamanHome> {
  // Definisikan GlobalKey untuk Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Callback untuk membuka Drawer
  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  // Callback untuk navigasi ke Home (halaman ini sendiri)
  void _navigateHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  // Callback untuk navigasi ke Profile
  void _navigateProfile() {
    Navigator.pushNamed(context, '/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign GlobalKey ke Scaffold
      appBar: AppBar(
        title: const Text('WASHLAB'),
        backgroundColor: const Color(0xFF174A7C),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF144B74),
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_car_wash),
              title: const Text('Daftar Doorsmeer'),
              onTap: () {
                Navigator.pushNamed(context, '/daftarDoorsmeer');
              },
            ),
            // Tambahkan item menu lainnya di sini
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background dengan gambar
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/air_2-removebg-preview1.png'), // Path gambar background
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Column(
            children: [
              // Header dengan background biru
              Container(
                padding: const EdgeInsets.only(top: 40, bottom: 16),
                color: const Color(0xFF174A7C), // Warna biru untuk header
                alignment: Alignment.center,
                child: const Text(
                  'WASHLAB',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              // Profile pengguna
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      // Foto profil
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color.fromARGB(255, 16, 67, 109),
                        child: const Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Nama dan detail pengguna
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Gojo Satoru',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            'Sp. Ardat',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // Button customer
                      ElevatedButton(
                        onPressed: () {
                          // Logika untuk tombol 'Customer' jika diperlukan
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5085A5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Customer',
                          style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Garis pemisah
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 16),
              // Tulisan selamat datang dengan gradasi
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: const Text(
                        'Selamat Datang! di aplikasi WASHLAB',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Temukan layanan cuci kendaraan yang bisa kamu pesan sesuai jadwalmu! Tidak perlu antre panjang atau menunggu lama.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Gambar mobil di bagian bawah dekat menu
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Center(
                  child: Image.asset(
                    'assets/images/slider.png', // Path gambar mobil
                    width: 400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: MultiFloatingButtons(
        onSidebarPressed: _openDrawer,
        onHomePressed: _navigateHome,
        onProfilePressed: _navigateProfile,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Posisi FAB
    );
  }
}
