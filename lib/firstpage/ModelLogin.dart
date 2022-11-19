class DataReg {
  final String id_pengguna;
  final String nama_lengkap;
  final String username;
  final String password;
  final String level;


  DataReg({
    required this.id_pengguna,
    required this.nama_lengkap,
    required this.username,
    required this.password,
    required this.level,
  });

  factory DataReg.fromJson(Map<String, dynamic> json) {
    return DataReg(

      nama_lengkap: json['nama_lengkap'],
      id_pengguna: json['id_pengguna'],
      username: json['username'],
      password: json['password'],
      level: json['level'],

    );
  }
}

