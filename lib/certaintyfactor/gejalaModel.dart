import 'dart:convert';

class Gejala {
  final String id_gejala;
  final String kode_gejala;
  final String nama_gejala;
  final String nilai_cf;
  final String deskripsi_gejala;
  final String nama_diagnosa;
  final String nilai;


  Gejala({
    required this.id_gejala,
    required this.kode_gejala,
    required this.nama_gejala,
    required this.nilai_cf,
    required this.deskripsi_gejala,
    required this.nama_diagnosa,
    required this.nilai,
  });

  factory Gejala.fromJson(Map<String, dynamic> map) {
    return Gejala(
      id_gejala: map['id_gejala'],
      kode_gejala: map['kode_gejala'],
      nama_gejala: map['nama_gejala'],
      nilai_cf: map['nilai_cf'],
      deskripsi_gejala: map['deskripsi_gejala'],
      nama_diagnosa: map['nama_diagnosa'],
      nilai: map['nilai'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_gejala": id_gejala,
      "kode_gejala": kode_gejala,
      "nama_gejala": nama_gejala,
      "nilai_cf": nilai_cf};
  }
}

List<Gejala> gejalaFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Gejala>.from(data.map((item) => Gejala.fromJson(item)));
}

String gejalaToJson(Gejala data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
