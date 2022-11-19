import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sistem_pakar_kspr/akun/Model_Akun.dart';

class RepositoryAkun {
  final baseUrl = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/get_data_user.php';
  final UrlDeleteUser = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/delete_user.php';
  final UrlUpdateUser = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/update_user.php';

  Future getDataAkun() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<DataAkun> dataAkun = it.map((e) => DataAkun.fromJson(e)).toList();
        return dataAkun;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> deleteuser(String id) async {
    try {
      final response = await http
          .post(Uri.parse(UrlDeleteUser), body: {'id_pengguna': id});

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString(), name: 'deleteuser');
    }
    return false;
  }

  Future<bool> updateuser(
      String id ,String nama, String username, String password, String level) async {
    try {
      final response = await http
          .post(Uri.parse(UrlUpdateUser), body: {
        "id_pengguna": id,
        "nama_lengkap": nama,
        "username": username,
        "password": password,
        "level": level,
      });

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Update Data User Berhasil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Update Data User Gagal",
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
}
