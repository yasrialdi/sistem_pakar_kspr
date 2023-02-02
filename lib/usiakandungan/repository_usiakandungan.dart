import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sistem_pakar_kspr/admin/home/gejala/Model_Gejala.dart';
import 'package:sistem_pakar_kspr/beratjanin/model_tbj.dart';
import 'package:sistem_pakar_kspr/usiakandungan/model_usiakandungan.dart';

class RepositoryUsiaKandungan {

  final UrlTambahusiaa = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/tambah_data_usia.php';
  final baseUrl = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_usia_kandungan.php';

  Future getDataUsiaKandungan() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['aturan'];
        List<DataUsiaKan> dataUsia = it.map((e) => DataUsiaKan.fromJson(e)).toList();
        return dataUsia;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postDataTambahUsiaKandungan(
      String id_pengguna, String tgl_hpht) async {
    try {
      final response = await http.post(Uri.parse(UrlTambahusiaa),
          headers: {"Content-Type": "application/json"},
          body: json.encode({
        "id_pengguna": id_pengguna,
        "tgl_hpht": tgl_hpht,

      }));
      return json.decode(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
}
