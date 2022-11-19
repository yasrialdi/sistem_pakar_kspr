import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sistem_pakar_kspr/certaintyfactor/gejalaModel.dart';

class RepositoryGejalaDiagnosa {
  final baseUrlll = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_gejala.php';
  final UrlDiagnosaCFF = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_hasil_cf.php';
  final UrlDiagnosaFCC = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_hasil_fc.php';

  Future postDataTambahCF(
      String id_pengguna, String hasil) async {
    try {
      final response = await http.post(Uri.parse(UrlDiagnosaCFF),
          headers: {"Content-Type": "application/json"},
          body: json.encode({

            "id_pengguna": id_pengguna,
            "hasil": hasil,

          }));
      print(response.request);
      if (response != '0') {
        Fluttertoast.showToast(
            msg: "Skrining Berhasil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Skrining Gagal",
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

  Future postDataTambahFC(
      String id_pengguna, String hasil) async {
    try {
      final response = await http.post(Uri.parse(UrlDiagnosaFCC),
          headers: {"Content-Type": "application/json"},
          body: json.encode({

            "id_pengguna": id_pengguna,
            "hasil": hasil,

          }));
      return json.decode(response.body);
    } catch (e) {
      print(e.toString());
    }
  }


  Future getDataCF() async {
    try {
      final response = await http.get(Uri.parse(baseUrlll));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Gejala> datagejala = it.map((e) => Gejala.fromJson(e)).toList();
        return datagejala;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Future getHasilCF() async {
  //   try {
  //     final response = await http.get(Uri.parse(UrlHasilCF));
  //
  //     if (response.statusCode == 200) {
  //       Iterable it = jsonDecode(response.body);
  //       List<Gejala> datatbj = it.map((e) => Gejala.fromJson(e)).toList();
  //       return datatbj;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<List<Gejala>?> getGejalaDiagnosa() async {
  //   final response = await http.get(Uri.parse(baseUrll));
  //   if (response.statusCode == 200) {
  //     return gejalaFromJson(response.body);
  //   } else {
  //     return null;
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

  // Future postDataTambahGejala(
  //     String kode, String namagjl, String nilaicf) async {
  //   try {
  //     final response = await http.post(Uri.parse(UrlTambahGejala), body: {
  //
  //       "kode_gejala": kode,
  //       "nama_gejala": namagjl,
  //       "nilai_cf": nilaicf,
  //
  //     });
  //
  //     if (response != '0') {
  //       Fluttertoast.showToast(
  //           msg: "Tambah Data Gejala Berhasil",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 3,
  //           backgroundColor: Colors.white,
  //           textColor: Colors.black,
  //           fontSize: 16
  //       );
  //     } else {
  //       Fluttertoast.showToast(
  //           msg: "Tambah Data GEjala Gagal",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 3,
  //           backgroundColor: Colors.white,
  //           textColor: Colors.black,
  //           fontSize: 16
  //       );
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
