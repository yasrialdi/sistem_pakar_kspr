import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'ModelDataDiri.dart';

class RepositoryDatadiri {

  final UrlGetDataDiri = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_diri.php';
  final UrlGetDataKehamilan = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_kehamilan.php';
  final UrlPostDataDiri = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/tambah_data_diri.php';
  final UrlUpdateDataDiri = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/update_data_diri.php';
  final UrlPostDataKehamilan = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/tambah_data_kehamilan.php';
  final UrlUpdateDataKehamilan = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/update_data_kehamilan.php';

  Future getDataDiri() async {
    try {
      final response = await http.get(Uri.parse(UrlGetDataDiri));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<DataDiri> datadiri = it.map((e) => DataDiri.fromJson(e)).toList();
        return datadiri;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getDataKehamilan() async {
    try {
      final response = await http.get(Uri.parse(UrlGetDataKehamilan));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<DataDiri> datadiri = it.map((e) => DataDiri.fromJson(e)).toList();
        return datadiri;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postDataDiri(
      String id_pengguna, String nama_lengkap, String tgl_lahir,  String alamat,
      String pekerjaan, String pendidikan, String nama_suami, String usia_suami,
      String pekerjaan_suami, String agama, String no_telp) async {
    try {
      final response = await http.post(Uri.parse(UrlPostDataDiri), body: {

        "id_pengguna": id_pengguna,
        "nama_lengkap": nama_lengkap,
        "tgl_lahir": tgl_lahir,
        "alamat": alamat,
        "pekerjaan": pekerjaan,
        "pendidikan": pendidikan,
        "nama_suami": nama_suami,
        "usia_suami": usia_suami,
        "pekerjaan_suami": pekerjaan_suami,
        "agama": agama,
        "no_telp": no_telp,

      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future UpdateDataDiri(
      String id_datadiri, id_pengguna, String nama_lengkap, String tgl_lahir,  String alamat,
      String pekerjaan, String pendidikan, String nama_suami, String usia_suami,
      String pekerjaan_suami, String agama, String no_telp) async {
    try {
      final response = await http.post(Uri.parse(UrlUpdateDataDiri), body: {

        "id_datadiri": id_datadiri,
        "id_pengguna": id_pengguna,
        "nama_lengkap": nama_lengkap,
        "tgl_lahir": tgl_lahir,
        "alamat": alamat,
        "pekerjaan": pekerjaan,
        "pendidikan": pendidikan,
        "nama_suami": nama_suami,
        "usia_suami": usia_suami,
        "pekerjaan_suami": pekerjaan_suami,
        "agama": agama,
        "no_telp": no_telp,

      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future postDataKehamilan(
      String id_pengguna,String gravid, String partus, String abortus, String anak_hidup) async {
    try {
      final response = await http.post(Uri.parse(UrlPostDataKehamilan), body: {
        "id_pengguna": id_pengguna,
        "gravid": gravid,
        "partus": partus,
        "abortus": abortus,
        "anak_hidup": anak_hidup,

      });

      if (response != '0') {
        Fluttertoast.showToast(
            msg: "Data kehamilan berhasil ditambahkan",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Data kehamilan tidak berhasil ditambahkan",
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

  Future UpdateDataKehamilan(
      String id_datakehamilan, id_pengguna,String gravid, String partus, String abortus, String anak_hidup) async {
    try {
      final response = await http.post(Uri.parse(UrlUpdateDataKehamilan), body: {
        "id_datakehamilan": id_datakehamilan,
        "id_pengguna": id_pengguna,
        "gravid": gravid,
        "partus": partus,
        "abortus": abortus,
        "anak_hidup": anak_hidup,

      });
    } catch (e) {
      print(e.toString());
    }
  }
}
