class DataRiwayat {
  final String nama_diagnosa;
  final String tanggal;
  final String metode;
  final String nilai;
  final String deskripsi_diagnosa;
  final String solusi;

  DataRiwayat({
    required this.nama_diagnosa,
    required this.tanggal,
    required this.metode,
    required this.nilai,
    required this.deskripsi_diagnosa,
    required this.solusi,
  });

  factory DataRiwayat.fromJson(Map<String, dynamic> json) {
    return DataRiwayat(

      nama_diagnosa: json['nama_diagnosa'],
      tanggal: json['tanggal'],
      metode: json['metode'],
      nilai: json['nilai'],
      deskripsi_diagnosa: json['deskripsi'],
      solusi: json['solusi'],
    );
  }
}

