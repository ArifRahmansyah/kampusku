class MataKuliah {
  final String nama;
  final String hari;
  final String jam;
  final String? kode;
  final int? sks;
  final String? ruang;

  const MataKuliah({
    required this.nama,
    required this.hari,
    required this.jam,
    this.kode,
    this.sks,
    this.ruang,
  });
}