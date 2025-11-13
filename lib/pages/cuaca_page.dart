import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CuacaPage extends StatefulWidget {
  const CuacaPage({Key? key}) : super(key: key);

  @override
  State<CuacaPage> createState() => _CuacaPageState();
}

class _CuacaPageState extends State<CuacaPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  // Daftar data cuaca (bisa ditambah lebih banyak kota atau kondisi)
  final List<Map<String, dynamic>> dataCuacaList = [
    {
      'kota': 'Bandung',
      'suhu': 28,
      'kelembapan': 65,
      'kecepatanAngin': 10,
      'kondisi': 'Cerah Berawan',
      'gambar': 'assets/lottie/sunny.json',
    },
    {
      'kota': 'Jakarta',
      'suhu': 25,
      'kelembapan': 80,
      'kecepatanAngin': 8,
      'kondisi': 'Hujan Ringan',
      'gambar': 'assets/lottie/hujan.json', // ini file lottie hujan.json
    },
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _gantiCuaca() {
    setState(() {
      currentIndex = (currentIndex + 1) % dataCuacaList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataCuaca = dataCuacaList[currentIndex];

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEDE7F6), Color(0xFFF8F4FF), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.65),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(
                        color: Colors.white.withOpacity(0.4),
                        width: 1.2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dataCuaca['kota'],
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 160,
                            child: Lottie.asset(
                              dataCuaca['gambar'],
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            dataCuaca['kondisi'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.thermostat,
                                      color: Colors.deepPurple),
                                  title: const Text('Suhu'),
                                  trailing: Text(
                                    '${dataCuaca['suhu']}°C',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87),
                                  ),
                                ),
                                const Divider(height: 0),
                                ListTile(
                                  leading: const Icon(Icons.water_drop,
                                      color: Colors.indigo),
                                  title: const Text('Kelembapan'),
                                  trailing: Text(
                                    '${dataCuaca['kelembapan']}%',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87),
                                  ),
                                ),
                                const Divider(height: 0),
                                ListTile(
                                  leading: const Icon(Icons.air,
                                      color: Colors.purple),
                                  title: const Text('Kecepatan Angin'),
                                  trailing: Text(
                                    '${dataCuaca['kecepatanAngin']} km/jam',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: _gantiCuaca,
                            icon: const Icon(Icons.sync),
                            label: const Text('Ganti Cuaca'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple.shade300,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
