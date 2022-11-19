class DataGejala {
  final String id_gejala;
  final String kode_gejala;
  final String nama_gejala;
  final String nilai_cf;
  final String deskripsi_gejala;

  DataGejala({
    required this.id_gejala,
    required this.kode_gejala,
    required this.nama_gejala,
    required this.nilai_cf,
    required this.deskripsi_gejala,
  });

  factory DataGejala.fromJson(Map<String, dynamic> json) {
    return DataGejala(
      id_gejala: json['id_gejala'],
      kode_gejala: json['kode_gejala'],
      nama_gejala: json['nama_gejala'],
      nilai_cf: json['nilai_cf'],
      deskripsi_gejala: json['deskripsi_gejala'],
    );
  }
}
