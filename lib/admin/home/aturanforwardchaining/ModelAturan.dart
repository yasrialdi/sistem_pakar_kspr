import 'dart:convert';

import 'dart:developer';

import 'package:sistem_pakar_kspr/certaintyfactor/gejalaModel.dart';

class DataAturan {

  final String id_diagnosa;
  final String nama_diagnosa;
  final List<Gejala> daftar_gejala;

  DataAturan({
    required this.id_diagnosa,
    required this.nama_diagnosa,
    required this.daftar_gejala,
  });

  factory DataAturan.fromJson(Map<String, dynamic> map) {
    return DataAturan(
      id_diagnosa: map['id_diagnosa'],
      nama_diagnosa: map['nama_diagnosa'],
      daftar_gejala:( map['daftar_gejala'] as List).map((e) => Gejala.fromJson(e)).toList(),
    );
  }

}

