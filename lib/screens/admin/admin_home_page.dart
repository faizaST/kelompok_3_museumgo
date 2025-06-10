import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _selectedIndex = 0;

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi manual jika diperlukan
    switch (index) {
      case 0:
        // Tetap di halaman ini
        break;
      case 1:
        Navigator.pushNamed(context, '/admin_pemesanan');
        break;
      case 2:
        Navigator.pushNamed(context, '/admin_profil'); // pastikan route ini ada
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard Admin',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Datang, Admin!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Kelola data aplikasi MuseumGo di sini.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Grid menu
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuItem(
                    context,
                    icon: Icons.people,
                    label: 'Data Pengguna',
                    onTap: () {
                      Navigator.pushNamed(context, '/admin_pengguna');
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.receipt_long,
                    label: 'Data Pemesanan',
                    onTap: () {
                      Navigator.pushNamed(context, '/admin_pemesanan');
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.bar_chart,
                    label: 'Laporan',
                    onTap: () {
                      Navigator.pushNamed(context, '/admin_laporan');
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.logout,
                    label: 'Keluar',
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.grey[300],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Data Pemesanan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              const SizedBox(height: 12),
              Text(label, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
