import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistem_pakar_kspr/admin/home/aturanforwardchaining/ModelAturan.dart';
import 'package:sistem_pakar_kspr/admin/home/aturanforwardchaining/update_aturan.dart';
import 'RepositoryAturan.dart';

class PageListAturan extends StatefulWidget {
  const PageListAturan({Key? key}) : super(key: key);

  @override
  State<PageListAturan> createState() => _PageListAturanState();
}

class _PageListAturanState extends State<PageListAturan> {
  List<DataAturan> listAturan = [];
  RepositoryAturan repository = RepositoryAturan();
  getDataAturan() async {
    listAturan = await repository.getDataAturan();
    setState(() {});
  }



  void _showDetailAturan(DataAturan dataAturan) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Detail Aturan"),
          content: SingleChildScrollView(
            child: Container(
              width: 500.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama Diagnosa"),
                  Text("${dataAturan.nama_diagnosa}"),
                  SizedBox(height: 5,),
                  Text("Gejala"),
                  ...dataAturan.daftar_gejala.map((e) => Row(
                    children: [
                      Text(e.kode_gejala),
                      Text(" : "),
                      Expanded(child: Text(e.nama_gejala)),
                    ],
                  ))
                ],
              ),
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  edit(DataAturan dataAturan) async {
    Navigator.push<bool>(
        context,
        MaterialPageRoute(
            builder: (_) => PageUpdateAturan(
              id: dataAturan.id_diagnosa,
              nama: dataAturan.nama_diagnosa,
            ))).then((value) {
      if (value != null && value) {
        getDataAturan();
      }
    });
  }

  // _showAlertDialogDeleteGejala(DataDiagnosa dataDiagnosa) {
  //   // set up the buttons
  //   Widget cancelButton = TextButton(
  //     child: Text("Cancel"),
  //     onPressed: () {
  //       Navigator.of(context).pop();
  //     },
  //   );
  //   Widget continueButton = TextButton(
  //     child: Text("Continue"),
  //     onPressed: () async {
  //       bool response = await repository.deletediagnosa('${dataDiagnosa.id_diagnosa}');
  //       if (response != '0') {
  //         Navigator.of(context).pop();
  //         setState(() {
  //           Fluttertoast.showToast(
  //               msg: "Delete Berhasil",
  //               toastLength: Toast.LENGTH_SHORT,
  //               gravity: ToastGravity.CENTER,
  //               timeInSecForIosWeb: 3,
  //               backgroundColor: Colors.white,
  //               textColor: Colors.black,
  //               fontSize: 16
  //           );
  //         });
  //       } else {
  //         setState(() {
  //           Fluttertoast.showToast(
  //               msg: "Delete Gagal",
  //               toastLength: Toast.LENGTH_SHORT,
  //               gravity: ToastGravity.CENTER,
  //               timeInSecForIosWeb: 3,
  //               backgroundColor: Colors.white,
  //               textColor: Colors.black,
  //               fontSize: 16
  //           );
  //         });
  //       }
  //       getDataAturan();
  //     },
  //   );
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("AlertDialog"),
  //     content: Text("Apakah yakin untuk menghapus data gejala ?"),
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  @override
  void initState() {
    getDataAturan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'List Aturan Forward Chaining',
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
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listAturan.length,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                        'Diagnosa : ${listAturan[index].nama_diagnosa}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      // ListTile(
                                      //
                                      //   title: Text(
                                      //     //menampilkan data judul
                                      //     '${listAturan[index].daftar_gejala}',
                                      //     maxLines: 1,
                                      //     overflow: TextOverflow.ellipsis,
                                      //   ),
                                      //
                                      // ),
                                      Text(
                                        'Gejala : ${listAturan[index].daftar_gejala.map((e) => e.kode_gejala).join(", ")}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(width: 10),
                                          MaterialButton(
                                            onPressed: () {
                                              _showDetailAturan(listAturan[index]);
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            height: 15,
                                            minWidth: 30,
                                            child: Text(
                                              'Detail',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white),
                                            ),
                                            color: Color(0xff2484DF),
                                          ),
                                          SizedBox(width: 10,),
                                          MaterialButton(
                                            onPressed: () {
                                              edit(listAturan[index]);
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            height: 15,
                                            minWidth: 30,
                                            child: Text(
                                              'Update',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white),
                                            ),
                                            color: Colors.pinkAccent,
                                          ),
                                          SizedBox(width: 10),
                                          // MaterialButton(
                                          //   onPressed: () async {
                                          //     // _showAlertDialogDeleteGejala(
                                          //     //     listAturan[index]);
                                          //   },
                                          //   shape: RoundedRectangleBorder(
                                          //     borderRadius:
                                          //     BorderRadius.circular(5),
                                          //   ),
                                          //   height: 15,
                                          //   minWidth: 30,
                                          //   child: Text(
                                          //     'Hapus',
                                          //     style: TextStyle(
                                          //         fontSize: 10,
                                          //         fontWeight: FontWeight.bold,
                                          //         fontFamily: 'Ubuntu',
                                          //         color: Colors.white),
                                          //   ),
                                          //   color: Colors.red,
                                          // ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
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
