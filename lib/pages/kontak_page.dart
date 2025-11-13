import 'package:flutter/material.dart';

class KontakPage extends StatefulWidget {
  const KontakPage({Key? key}) : super(key: key);

  @override
  State<KontakPage> createState() => _KontakPageState();
}

class _KontakPageState extends State<KontakPage> {
  final List<Map<String, String>> kontakList = List.generate(15, (index) {
    return {
      'nama': 'Kontak ${index + 1}',
      'telepon': '0812-3456-78${index.toString().padLeft(2, '0')}',
      'gambar': 'assets/images/person.png',
    };
  });

  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Fade in efek halus
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _opacity = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6D28D9), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _opacity,
            curve: Curves.easeInOut,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: kontakList.length,
              itemBuilder: (context, index) {
                final kontak = kontakList[index];

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: const Color(0xFFEDE9FE),
                      backgroundImage: AssetImage(kontak['gambar']!),
                    ),
                    title: Text(
                      kontak['nama']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      kontak['telepon']!,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF6D28D9).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.phone,
                        color: Color(0xFF6D28D9),
                        size: 22,
                      ),
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.indigo.shade700,
                          content:
                          Text('Menghubungi ${kontak['nama']}...'),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
