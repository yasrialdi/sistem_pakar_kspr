class DataDiri {

  final String id_pengguna;
  final String id_datadiri;
  final String id_datakehamilan;
  final String nama_lengkap;
  final String tgl_lahir;
  final String alamat;
  final String pekerjaan;
  final String pendidikan;
  final String nama_suami;
  final String usia_suami;
  final String pekerjaan_suami;
  final String agama;
  final String no_telp;
  final String gravid;
  final String partus;
  final String abortus;
  final String anak_hidup;

  DataDiri({
    required this.id_pengguna,
    required this.id_datadiri,
    required this.id_datakehamilan,
    required this.nama_lengkap,
    required this.tgl_lahir,
    required this.alamat,
    required this.pekerjaan,
    required this.pendidikan,
    required this.nama_suami,
    required this.usia_suami,
    required this.pekerjaan_suami,
    required this.agama,
    required this.no_telp,
    required this.gravid,
    required this.partus,
    required this.abortus,
    required this.anak_hidup,
  });

  factory DataDiri.fromJson(Map<String, dynamic> json) {
    return DataDiri(

      id_pengguna: json['id_pengguna'],
      id_datadiri: json['id_datadiri'],
      id_datakehamilan: json['id_datakehamilan'],
      nama_lengkap: json['nama_lengkap'],
      tgl_lahir: json['tgl_lahir'],
      alamat: json['alamat'],
      pekerjaan: json['pekerjaan'],
      pendidikan: json['pendidikan'],
      nama_suami: json['nama_suami'],
      usia_suami: json['usia_suami'],
      pekerjaan_suami: json['pekerjaan_suami'],
      agama: json['agama'],
      no_telp: json['no_telp'],
      gravid: json['gravid'],
      partus: json['partus'],
      abortus: json['abortus'],
      anak_hidup: json['anak_hidup']

    );
  }
}

