class DataAkun {
  final String id;
  final String nama;
  final String username;
  final String level;
  final String password;

  DataAkun({
    required this.id,
    required this.nama,
    required this.username,
    required this.level,
    required this.password,
  });

  factory DataAkun.fromJson(Map<String, dynamic> json) {
    return DataAkun(
      id: json['id_pengguna'],
      nama: json['nama_lengkap'],
      username: json['username'],
      level: json['level'],
      password: json['password']
    );
  }
}
