import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sistem_pakar_kspr/admin/home/diagnosa/ModelDiagnosa.dart';

class RepositoryDiagnosa {
  final UrlGetDataDiagnosa = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_diagnosa.php';
  final UrlGetDataDiagnosaa = 'http://192.168.172.187/proyekakhir/get_data_diagnosa.php';
  final UrlGetDetailDiagnosa = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_diagnosa_detail.php';
  final UrlGetDetailDiagnosaa = 'http://192.168.172.187/proyekakhir/get_data_diagnosa_detail.php';
  final UrlDeleteDiagnosa = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/delete_diagnosa.php';
  final UrlDeleteDiagnosaa = 'http://192.168.172.187/proyekakhir/delete_diagnosa.php';
  final UrlUpdateDiagnosa = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/update_diagnosa.php';
  final UrlUpdateDiagnosaa = 'http://192.168.172.187/proyekakhir/update_diagnosa.php';
  final UrlTambahDiagnosa = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/tambah_data_diagnosa.php';
  final UrlTambahDiagnosaa = 'http://192.168.172.187/proyekakhir/tambah_data_diagnosa.php';

  Future getDataDiagnosa() async {
    try {
      final response = await http.get(Uri.parse(UrlGetDataDiagnosa));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<DataDiagnosa> dataDiagnosa = it.map((e) => DataDiagnosa.fromJson(e)).toList();
        return dataDiagnosa;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getDetailDiagnosaaaa() async {
    try {
      final response = await http.get(Uri.parse(UrlGetDetailDiagnosa));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<DataDiagnosa> dataDiagnosa = it.map((e) => DataDiagnosa.fromJson(e)).toList();
        return dataDiagnosa;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> deletediagnosa(String id) async {
    try {
      final response = await http
          .post(Uri.parse(UrlDeleteDiagnosa), body: {'id_diagnosa': id});

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString(), name: 'deletediagnosa');
    }
    return false;
  }

  Future<bool> updatediagnosa(
      String id ,String kode, String namadiag, String deskripsi, String solusi) async {
    try {
      final response = await http
          .post(Uri.parse(UrlUpdateDiagnosa), body: {
        "id_diagnosa": id,
        "kode_diagnosa": kode,
        "nama_diagnosa": namadiag,
        "deskripsi": deskripsi,
        "solusi": solusi,
      });

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Update Data Gejala Berhasil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Update Data Gejala Gagal",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future postDataTambahDiagnosa(
      String kode, String namadiag, String deskripsi, String solusi) async {
    try {
      final response = await http.post(Uri.parse(UrlTambahDiagnosa), body: {

        "kode_diagnosa": kode,
        "nama_diagnosa": namadiag,
        "deskripsi": deskripsi,
        "solusi": solusi

      });

      if (response != '0') {
        Fluttertoast.showToast(
            msg: "Tambah Data Diagnosa Berhasil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Tambah Data Diagnosa Gagal",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future PostGetDetailDiagnosa(
      String id_diagnosa) async {
    try {
      final response = await http.post(Uri.parse(UrlGetDetailDiagnosa),
          headers: {"Content-Type": "application/json"},
          body: json.encode({

            "id_diagnosa": id_diagnosa,

          }));

      return json.decode(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
}
