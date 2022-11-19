import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_pakar_kspr/admin/home/diagnosa/list_diagnosa_user.dart';
import 'package:sistem_pakar_kspr/beratjanin/cek_berat_janin.dart';
import 'package:sistem_pakar_kspr/certaintyfactor/diagnosaCF.dart';
import 'package:sistem_pakar_kspr/forwardchaining/diagnosaFC.dart';
import 'package:sistem_pakar_kspr/icon/MyIcon.dart';
import 'package:sistem_pakar_kspr/info/info.dart';
import 'package:sistem_pakar_kspr/main.dart';
import 'package:sistem_pakar_kspr/riwayatskrining/RepositoryRiwayat.dart';
import 'package:sistem_pakar_kspr/riwayatskrining/riwayat_skrining.dart';
import 'package:sistem_pakar_kspr/riwayatskrining/riwayat_skrining_user.dart';
import 'package:sistem_pakar_kspr/user/datadiri/PageMenuDataDiri.dart';
import 'package:sistem_pakar_kspr/usiakandungan/cek_usia_kandungan.dart';

class PageHomeUser extends StatefulWidget {
  const PageHomeUser({Key? key}) : super(key: key);

  @override
  State<PageHomeUser> createState() => _PageHomeUserState();
}

class _PageHomeUserState extends State<PageHomeUser> {
  RepositoryRiwayat repository = RepositoryRiwayat();
  late SharedPreferences preferences;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) => preferences = value);
    super.initState();
  }

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
                          width: 45,
                        ),
                        Column(children: [
                          FlatButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageCFcoba()))
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(MyFlutterApp.stethoscope, size: 35),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Skrining Kehamilan',
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
                          width: 45,
                        ),
                        Column(children: [
                          FlatButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageCekUsiaKandungan()))
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(MyFlutterApp.user_md, size: 35),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Cek Usia Kandungan',
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
                          width: 45,
                        ),
                        Column(children: [
                          FlatButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageCekBeratJanin()))
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(MyFlutterApp.weight, size: 35),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Tafsiran Berat Janin',
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
                          width: 48,
                        ),
                        Column(children: [
                          FlatButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageMenuDataDiri()))
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.person, size: 44),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Data Diri',
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
                                      builder: (_) =>
                                          PageListDataDiagnosaUser()))
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(MyFlutterApp.clipboard_list, size: 35),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Daftar Diagnosa',
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
                          width: 57,
                        ),
                        Column(children: [
                          MaterialButton(
                            onPressed: () async {
                              String id_pengguna =
                                  preferences.getString("id_pengguna")!;

                              var response = await repository
                                  .postDataTambahUsiaKandungan(id_pengguna);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          PageRiwayatSkrining()));
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.list_alt_sharp, size: 38),
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
                      ],
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        SizedBox(
                          width: 54,
                        ),
                        Column(children: [
                          FlatButton(
                            onPressed: () => {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => PageInfo()))
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.info_outlined, size: 40),
                                SizedBox(
                                  height: 5,
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

                        // // SizedBox(
                        // //   width: 57,
                        // // ),
                        // // Column(children: [
                        // //   FlatButton(
                        // //     onPressed: () => {
                        // //       Navigator.push(
                        // //           context,
                        // //           MaterialPageRoute(
                        // //               builder: (_) => PageInfo()))
                        // //     },
                        // //     padding: EdgeInsets.all(10.0),
                        // //     child: Column(
                        // //       // Replace with a Row for horizontal icon + text
                        // //       children: <Widget>[
                        // //         Icon(Icons.info_outline_rounded, size: 35),
                        // //         SizedBox(
                        // //           height: 10,
                        // //         ),
                        // //         Text(
                        // //           'Info',
                        // //           style: TextStyle(
                        // //             fontSize: 10,
                        // //             fontFamily: 'Ubuntu',
                        // //             color: Colors.black,
                        // //           ),
                        // //         ),
                        // //       ],
                        // //     ),
                        // //   ),
                        // ]),
                      ],
                    ),
                    SizedBox(height: 40),
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
