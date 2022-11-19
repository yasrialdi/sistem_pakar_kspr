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

  // Future getDataUsiaKandungan() async {
  //   try {
  //     final response = await http.get(Uri.parse(baseUrl));
  //
  //     if (response.statusCode == 200) {
  //       Iterable it = jsonDecode(response.body);
  //       List<DataUsiaKan> datausia = it.map((e) => DataUsiaKan.fromJson(e)).toList();
  //       return datausia;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<bool> deletegejala(String id) async {
  //   try {
  //     final response = await http
  //         .post(Uri.parse(UrlDeleteGejala), body: {'id_gejala': id});
  //
  //     if (response.statusCode == 200) {
  //       return true;
  //     }
  //   } catch (e) {
  //     log(e.toString(), name: 'deletegejala');
  //   }
  //   return false;
  // }

  // Future<bool> updateuser(
  //     String id ,String kode, String namagjl, String nilaicf) async {
  //   try {
  //     final response = await http
  //         .post(Uri.parse(UrlUpdateGejala), body: {
  //       "id_gejala": id,
  //       "kode_gejala": kode,
  //       "nama_gejala": namagjl,
  //       "nilai_cf": nilaicf,
  //     });
  //
  //     if (response.statusCode == 200) {
  //       Fluttertoast.showToast(
  //           msg: "Update Data Gejala Berhasil",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 3,
  //           backgroundColor: Colors.white,
  //           textColor: Colors.black,
  //           fontSize: 16
  //       );
  //     } else {
  //       Fluttertoast.showToast(
  //           msg: "Update Data Gejala Gagal",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 3,
  //           backgroundColor: Colors.white,
  //           textColor: Colors.black,
  //           fontSize: 16
  //       );
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   return false;
  // }

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
