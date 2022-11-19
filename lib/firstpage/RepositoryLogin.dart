import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class RepositoryLogin {
  final ReqUrlXAMPP = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/register.php';

  Future postDataPengguna(
      String username, String password) async {
    try {
      final response = await http.post(Uri.parse(ReqUrlXAMPP),
          headers: {"Content-Type": "application/json"},
          body: json.encode({

            "username": username,
            "password": password,

          }));

      // if (response != '0') {
      //   Fluttertoast.showToast(
      //       msg: "Register Berhasil",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 3,
      //       backgroundColor: Colors.white,
      //       textColor: Colors.black,
      //       fontSize: 16
      //   );
      // } else {
      //   Fluttertoast.showToast(
      //       msg: "Skrining Gagal",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 3,
      //       backgroundColor: Colors.white,
      //       textColor: Colors.black,
      //       fontSize: 16
      //   );
      // }
      return json.decode(response.body);
    } catch (e) {
      print(e.toString());
    }
  }


  Future postDataReg(
      String username,  String password) async {
    try {
      final response = await http.post(Uri.parse(ReqUrlXAMPP), body: {

        "username": username,
        "password": password,

      });

      if (response != '0') {
        Fluttertoast.showToast(
            msg: "User Berhasil Ditambahkan",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Tambah User Gagal",
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

  // Future postDataTambah(
  //     String nama, String username, String email, String divisi, String password, String level) async {
  //   try {
  //     final response = await http.post(Uri.parse(UrlAddUser), body: {
  //
  //       "nama": nama,
  //       "username": username,
  //       "email": email,
  //       "divisi": divisi,
  //       "password": password,
  //       "level": level,
  //
  //     });
  //
  //     if (response != '0') {
  //       Fluttertoast.showToast(
  //           msg: "Register Succes",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 3,
  //           backgroundColor: Colors.white,
  //           textColor: Colors.black,
  //           fontSize: 16
  //       );
  //     } else {
  //       Fluttertoast.showToast(
  //           msg: "Register Not Succes",
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
