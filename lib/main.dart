import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LuasPersegiPanjang(),
    );
  }
}

class LuasPersegiPanjang extends StatelessWidget {
  const LuasPersegiPanjang({super.key});

  @override
  Widget build(BuildContext context) {
    final panjangController = TextEditingController();
    final lebarController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FC),
      appBar: AppBar(
        title: const Text(
          'Kalkulator Luas',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF142D4E),
      ),
      body: StatefulBuilder(
        builder: (context, setState) {
          double luas = 0;
          bool sudahDihitung = false;

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withValues(alpha: 0.12),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.crop_square_rounded,
                      size: 65,
                      color: Color(0xFF244B7A),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'LUAS PERSEGI PANJANG',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF142D4E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Masukkan panjang dan lebar',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Panjang (cm)',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF142D4E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: panjangController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Masukkan panjang',
                        prefixIcon: const Icon(Icons.straighten),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Lebar (cm)',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF142D4E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: lebarController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Masukkan lebar',
                        prefixIcon: const Icon(Icons.height),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        final p = double.tryParse(
                          panjangController.text.replaceAll(',', '.'),
                        );
                        final l = double.tryParse(
                          lebarController.text.replaceAll(',', '.'),
                        );

                        if (p == null || l == null || p <= 0 || l <= 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Masukkan panjang dan lebar yang valid!',
                              ),
                            ),
                          );
                          return;
                        }

                        setState(() {
                          luas = p * l;
                          sudahDihitung = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF142D4E),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'HITUNG LUAS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: const Color(0xFF142D4E),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'HASIL PERHITUNGAN',
                            style: TextStyle(
                              color: Color(0xFFB9D5FF),
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            sudahDihitung
                                ? '${luas.toStringAsFixed(2).replaceAll(RegExp(r'\.?0+$'), '')} cm²'
                                : '0 cm²',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Rumus: L = panjang × lebar',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
