import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:sistem_pakar_kspr/admin/home/diagnosa/ModelDiagnosa.dart';
import 'package:sistem_pakar_kspr/admin/home/diagnosa/tambahdiagnosa.dart';
import 'package:sistem_pakar_kspr/admin/home/diagnosa/updatediagnosa.dart';

import 'RepositoryDiagnosa.dart';

class PageListDataDiagnosaUser extends StatefulWidget {
  const PageListDataDiagnosaUser({Key? key}) : super(key: key);

  @override
  State<PageListDataDiagnosaUser> createState() => _PageListDataDiagnosaUserState();
}

class _PageListDataDiagnosaUserState extends State<PageListDataDiagnosaUser> {
  List<DataDiagnosa> listDiagnosa = [];
  RepositoryDiagnosa repository = RepositoryDiagnosa();
  getDataDiagnosa() async {
    listDiagnosa = await repository.getDataDiagnosa();
    setState(() {});
  }

  edit(DataDiagnosa dataDiagnosa) async {
    Navigator.push<bool>(
        context,
        MaterialPageRoute(
            builder: (_) => PageUpdateDiagnosa(
                  id: dataDiagnosa.id_diagnosa,
                  kode: dataDiagnosa.kode_diagnosa,
                  nama: dataDiagnosa.nama_diagnosa,
                  deskripsi: dataDiagnosa.deskripsi,
                  solusi: dataDiagnosa.solusi,
                ))).then((value) {
      if (value != null && value) {
        getDataDiagnosa();
      }
    });
  }

  _showAlertDialogDeleteGejala(DataDiagnosa dataDiagnosa) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () async {
        bool response =
            await repository.deletediagnosa('${dataDiagnosa.id_diagnosa}');
        if (response != '0') {
          Navigator.of(context).pop();
          setState(() {
            Fluttertoast.showToast(
                msg: "Delete Berhasil",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 16);
          });
        } else {
          setState(() {
            Fluttertoast.showToast(
                msg: "Delete Gagal",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 16);
          });
        }
        getDataDiagnosa();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Apakah yakin untuk menghapus data gejala ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    getDataDiagnosa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'List Diagnosa',
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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listDiagnosa.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: Card(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5),
                                      Text(
                                        '${listDiagnosa[index].nama_diagnosa}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '${listDiagnosa[index].deskripsi}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '${listDiagnosa[index].solusi}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
