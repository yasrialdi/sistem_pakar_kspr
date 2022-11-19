import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistem_pakar_kspr/admin/home/aturanforwardchaining/list_aturan.dart';
import 'package:sistem_pakar_kspr/admin/home/pengguna/list_user.dart';
import 'package:sistem_pakar_kspr/beratjanin/cek_berat_janin.dart';
import 'package:sistem_pakar_kspr/certaintyfactor/diagnosaCF.dart';
import 'package:sistem_pakar_kspr/icon/MyIcon.dart';
import 'package:sistem_pakar_kspr/info/info_admin.dart';
import 'package:sistem_pakar_kspr/riwayatskrining/riwayat_skrining.dart';
import 'package:sistem_pakar_kspr/usiakandungan/cek_usia_kandungan.dart';

import 'diagnosa/list_diagnosa.dart';
import 'gejala/list_gejala.dart';

class PageHomeAdmin extends StatefulWidget {
  const PageHomeAdmin({Key? key}) : super(key: key);

  @override
  State<PageHomeAdmin> createState() => _PageHomeAdminState();
}

class _PageHomeAdminState extends State<PageHomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 65),
            Center(
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 1.5,
                      offset: Offset(0, 0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 38),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Column(children: [
                          FlatButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageListUser()))
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.person, size: 40),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Data Pengguna',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                        SizedBox(
                          width: 63,
                        ),
                        Column(children: [
                          FlatButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageListDataGejala()))
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.data_usage_rounded, size: 35),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Data Gejala',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ],
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Column(children: [
                          FlatButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageListDataDiagnosa()))
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(MyFlutterApp.clipboard_list, size: 35),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Data Diagnosa Resiko',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                        SizedBox(
                          width: 44,
                        ),
                        Column(children: [
                          FlatButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageListAturan()))
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(MyFlutterApp.list_ol, size: 30),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '       Data Aturan\n'
                                      'Forward Chaining',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ],
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Column(children: [
                          FlatButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageRiwayatSkrining()))
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.list_alt_sharp, size: 40),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Riwayat Skrining',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                        SizedBox(
                          width: 60,
                        ),
                        Column(children: [

                          FlatButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageInfoAdmin()))
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.info_outline_rounded, size: 35),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Info',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ],
                    ),
                    SizedBox(height: 38),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
