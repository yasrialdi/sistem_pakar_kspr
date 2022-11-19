import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sistem_pakar_kspr/admin/home/aturanforwardchaining/ModelAturan.dart';

class RepositoryAturan {
  final UrlGetDataAturan = 'http://spkspr.infinityfreeapp.com/get_daftar_aturan.php';
  final UrlGetDataAturann = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_daftar_aturan.php';
  final UrlUpdateDataAturann = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/update_aturan.php';
  // final UrlGetDetailAturan = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_aturan.php';

  Future getDataAturan() async {
    try {
      final response = await http.get(Uri.parse(UrlGetDataAturann));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['aturan'];
        List<DataAturan> dataDiagnosa = it.map((e) => DataAturan.fromJson(e)).toList();
        return dataDiagnosa;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postUpdateAturan(
      String id_diagnosa, String daftar_gejala) async {
    try {
      final response = await http.post(Uri.parse(UrlUpdateDataAturann),
          headers: {"Content-Type": "application/json"},
          body: json.encode({

            "id_diagnosa": id_diagnosa,
            "daftar_gejala": daftar_gejala,

          }));
      print(response.request);
      if (response != '0') {
        Fluttertoast.showToast(
            msg: "Update Data Aturan Berhasil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Update Data Aturan Gagal",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      }
      return json.decode(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  // Future getDetailAturan() async {
  //   try {
  //     final response = await http.get(Uri.parse(UrlGetDetailAturan));
  //
  //     if (response.statusCode == 200) {
  //       Iterable it = jsonDecode(response.body);
  //       List<DataAturan> dataDiagnosa = it.map((e) => DataAturan.fromJson(e)).toList();
  //       return dataDiagnosa;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
