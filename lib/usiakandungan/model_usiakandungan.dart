class DataUsiaKan {
  final String id_usiakandungan;
  final String id_pengguna;
  final String tgl_pengecekan;
  final String tgl_hpht;
  final String usia_kandungan;
  final String tgl_kelahiran;

  DataUsiaKan({
    required this.id_usiakandungan,
    required this.id_pengguna,
    required this.tgl_pengecekan,
    required this.tgl_hpht,
    required this.usia_kandungan,
    required this.tgl_kelahiran,
  });

  factory DataUsiaKan.fromJson(Map<String, dynamic> json) {
    return DataUsiaKan(
    id_usiakandungan: json['id_usiakandungan'],
    id_pengguna: json['id_pengguna'],
    tgl_pengecekan: json['tgl_pengecekan'],
    tgl_hpht: json['tgl_hpht'],
    usia_kandungan: json['usia_kandungan'],
    tgl_kelahiran: json['tgl_kelahiran'],
    );
  }
}
