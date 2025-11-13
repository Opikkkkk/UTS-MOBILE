import 'package:flutter/material.dart';
import 'biodata_page.dart';
import 'kontak_page.dart';
import 'kalkulator_page.dart';
import 'cuaca_page.dart';
import 'berita_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    BiodataPage(),
    KontakPage(),
    KalkulatorPage(),
    CuacaPage(),
    BeritaPage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // ✅ agar efek melayang lebih halus
      backgroundColor: const Color(0xFFF5F4FB),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8F7FF), Color(0xFFE8E6F8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 8),

              // ✅ Konten utama berbentuk rounded floating card
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: Container(
                    key: ValueKey(_selectedIndex),
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: _pages[_selectedIndex],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ✅ Floating rounded BottomNavigationBar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Colors.white.withOpacity(0.95),
            elevation: 10,
            selectedItemColor: Colors.indigo.shade600,
            unselectedItemColor: Colors.grey.shade500,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: "Biodata",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contacts_rounded),
                label: "Kontak",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate_rounded),
                label: "Kalkulator",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.cloud_rounded),
                label: "Cuaca",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.article_rounded),
                label: "Berita",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
