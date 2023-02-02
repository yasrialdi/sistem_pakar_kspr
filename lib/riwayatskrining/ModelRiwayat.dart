class DataRiwayat {
  final String id_pengguna;
  final String nama_diagnosa;
  final String tanggal;
  final String metode;
  final String nilai;
  final String deskripsi_diagnosa;
  final String solusi;
  final String nama;


  final String id_diagnosa;
  final String persentaseCF;
  final String persentaseFC;

  final String jumlah_register;
  final String jumlah_1;
  final String orang;

  DataRiwayat({
    required this.id_pengguna,
    required this.nama_diagnosa,
    required this.tanggal,
    required this.metode,
    required this.nilai,
    required this.deskripsi_diagnosa,
    required this.solusi,
    required this.nama,

    required this.id_diagnosa,
    required this.persentaseCF,
    required this.persentaseFC,

    required this.jumlah_register,
    required this.jumlah_1,
    required this.orang,
  });

  factory DataRiwayat.fromJson(Map<String, dynamic> json) {
    return DataRiwayat(

      id_pengguna: json['id_pengguna'],
      nama_diagnosa: json['nama_diagnosa'],
      tanggal: json['tanggal'],
      metode: json['metode'],
      nilai: json['nilai'],
      deskripsi_diagnosa: json['deskripsi'],
      solusi: json['solusi'],
      nama: json['nama_lengkap'],

      id_diagnosa: json['id_diagnosa'],
      persentaseCF: json['persentase'],
      persentaseFC: json['persentase'],

      jumlah_register: json['jumlah_register'],
      jumlah_1: json['diagnosacf'],
      orang: json['orang'],
    );
  }
}

