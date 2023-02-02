import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistem_pakar_kspr/admin/home/aturanforwardchaining/list_aturan.dart';
import 'package:sistem_pakar_kspr/admin/home/pengguna/list_user.dart';
import 'package:sistem_pakar_kspr/icon/MyIcon.dart';
import 'package:sistem_pakar_kspr/info/info_admin.dart';
import 'package:sistem_pakar_kspr/riwayatskrining/ModelRiwayat.dart';
import 'package:sistem_pakar_kspr/riwayatskrining/RepositoryRiwayat.dart';
import 'package:sistem_pakar_kspr/riwayatskrining/riwayat_skrining.dart';
import 'diagnosa/list_diagnosa.dart';
import 'gejala/list_gejala.dart';

class PageHomeAdmin extends StatefulWidget {
  const PageHomeAdmin({Key? key}) : super(key: key);

  @override
  State<PageHomeAdmin> createState() => _PageHomeAdminState();
}

class _PageHomeAdminState extends State<PageHomeAdmin> {
  List<DataRiwayat> listDataPersentaseCF = [];
  List<DataRiwayat> listDataPersentaseFC = [];
  List<DataRiwayat> listDataRegisterUser = [];
  RepositoryRiwayat repositoryDataPersentase = RepositoryRiwayat();
  getDataPersentase() async {
    listDataPersentaseCF =
        await repositoryDataPersentase.getDataPersentaseRiwayatCF();
    listDataPersentaseFC =
        await repositoryDataPersentase.getDataPersentaseRiwayatFC();
    listDataRegisterUser =
        await repositoryDataPersentase.getDataJumlahRegister();
    setState(() {});
  }

  @override
  void initState() {
    getDataPersentase();
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
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
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
                          width: 60,
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
                          width: 75,
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
                          width: 47,
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
                          width: 51,
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
                          width: 58,
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
                          width: 69,
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listDataRegisterUser.length,
                          itemBuilder: (BuildContext context, index) {
                            return Row(
                              children: [
                                Text(
                                  "Jumlah pengguna yang sudah register = ${listDataRegisterUser[index].jumlah_register}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            );
                          }),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Persentase Metode Certainty Factor",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'Ubuntu',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listDataPersentaseCF.length,
                          itemBuilder: (BuildContext context, index) {
                            return Row(
                              children: [
                                Text(
                                  "R0${listDataPersentaseCF[index].id_diagnosa} jumlah data ${listDataPersentaseCF[index].jumlah_1} = ${listDataPersentaseCF[index].persentaseCF}%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            );
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Persentase Metode Forward Chaining",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listDataPersentaseFC.length,
                          itemBuilder: (BuildContext context, index) {
                            return Row(
                              children: [
                                Text(
                                  "R0${listDataPersentaseFC[index].id_diagnosa} jumlah data ${listDataPersentaseFC[index].orang} = ${listDataPersentaseFC[index].persentaseCF}%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
