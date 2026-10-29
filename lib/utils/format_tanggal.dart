const _namaHari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
const _namaBulan = [
  'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
  'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
];

String namaHari(DateTime d) => _namaHari[d.weekday - 1];

String formatTanggal(DateTime d) => '${d.day} ${_namaBulan[d.month - 1]} ${d.year}';