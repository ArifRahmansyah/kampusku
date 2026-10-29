import 'package:flutter/material.dart';
import '../models/mata_kuliah.dart';

class KartuMataKuliah extends StatelessWidget {
  const KartuMataKuliah({super.key, required this.mk, this.sorot = false});

  final MataKuliah mk;
  final bool sorot;

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    final info = [
      mk.jam,
      if (mk.ruang != null) mk.ruang!,
      if (mk.kode != null) mk.kode!,
    ].join(' · ');

    return Card(
      color: sorot ? warna.primaryContainer : null,
      child: ListTile(
        leading: const Icon(Icons.class_),
        title: Text(mk.nama),
        subtitle: Text(info),
        trailing: mk.sks != null ? Text('${mk.sks} SKS') : null,
      ),
    );
  }
} 