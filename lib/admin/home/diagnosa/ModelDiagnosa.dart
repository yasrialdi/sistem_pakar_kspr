class DataDiagnosa {
  final String id_diagnosa;
  final String kode_diagnosa;
  final String nama_diagnosa;
  final String deskripsi;
  final String solusi;

  DataDiagnosa({
    required this.id_diagnosa,
    required this.kode_diagnosa,
    required this.nama_diagnosa,
    required this.deskripsi,
    required this.solusi,
  });

  factory DataDiagnosa.fromJson(Map<String, dynamic> json) {
    return DataDiagnosa(
      id_diagnosa: json['id_diagnosa'],
      kode_diagnosa: json['kode_diagnosa'],
      nama_diagnosa: json['nama_diagnosa'],
      deskripsi: json['deskripsi'],
      solusi: json['solusi'],
    );
  }
}

