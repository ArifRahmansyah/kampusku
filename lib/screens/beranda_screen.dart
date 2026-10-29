import 'package:flutter/material.dart';
import '../models/mata_kuliah.dart';
import '../utils/format_tanggal.dart';
import '../widgets/kartu_mata_kuliah.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  static const _urutanHari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat'];

  static const _jadwal = [
    // Selasa
    MataKuliah(nama: 'Keamanan Informasi', hari: 'Selasa', jam: '15.00 - 17.00'),
    // Rabu
    MataKuliah(nama: 'Sistem Informasi Enterprise', hari: 'Rabu', jam: '10.00 - 12.00'),
    MataKuliah(nama: 'Keamanan Jaringan', hari: 'Rabu', jam: '13.00 - 15.00'),
    MataKuliah(nama: 'Pemrograman Web 1', hari: 'Rabu', jam: '15.00 - 17.00'),
    // Kamis
    MataKuliah(nama: 'Pemrograman Mobile II', hari: 'Kamis', jam: '10.00 - 12.00'),
    MataKuliah(nama: 'B. Indo', hari: 'Kamis', jam: '13.00 - 14.20'),
    MataKuliah(nama: 'Sistem Mikroprosesor', hari: 'Kamis', jam: '16.00 - 18.00'),
    // Jumat
    MataKuliah(nama: 'Pengembangan Diri', hari: 'Jumat', jam: '14.00 - 15.20'),
  ];

  @override
  Widget build(BuildContext context) {
    final sekarang = DateTime.now();
    final hariIni = namaHari(sekarang);
    final kuliahHariIni = _jadwal.where((mk) => mk.hari == hariIni).toList();

    final warna = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('KampusKu')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Kartu tanggal
              Card(
                color: warna.primary,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hariIni,
                          style: teks.titleMedium?.copyWith(color: warna.onPrimary)),
                      Text(formatTanggal(sekarang),
                          style: teks.headlineMedium?.copyWith(
                              color: warna.onPrimary, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(
                        '${kuliahHariIni.length} kuliah hari ini · ${_jadwal.length} mata kuliah per minggu',
                        style: teks.bodyMedium?.copyWith(color: warna.onPrimary),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Kuliah hari ini
              Text('Kuliah hari ini',
                  style: teks.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              if (kuliahHariIni.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('Tidak ada kuliah hari ini.'),
                )
              else
                for (final mk in kuliahHariIni) KartuMataKuliah(mk: mk, sorot: true),
              const SizedBox(height: 16),

              // Jadwal seminggu
              Text('Jadwal minggu ini',
                  style: teks.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              for (final hari in _urutanHari) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 4),
                  child: Text(hari,
                      style: teks.titleSmall?.copyWith(color: warna.primary)),
                ),
                if (_jadwal.every((m) => m.hari != hari))
                  const Padding(
                    padding: EdgeInsets.only(left: 4, bottom: 4),
                    child: Text('Tidak ada kuliah'),
                  )
                else
                  for (final mk in _jadwal.where((m) => m.hari == hari))
                    KartuMataKuliah(mk: mk),
              ],
            ],
          ),
        ),
      ),
    );
  }
}