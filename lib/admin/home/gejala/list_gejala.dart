import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sistem_pakar_kspr/admin/home/gejala/Model_Gejala.dart';
import 'package:sistem_pakar_kspr/admin/home/gejala/RepositoryGejala.dart';
import 'package:sistem_pakar_kspr/admin/home/gejala/tambahgejala.dart';
import 'package:sistem_pakar_kspr/admin/home/gejala/updategejala.dart';

class PageListDataGejala extends StatefulWidget {
  const PageListDataGejala({Key? key}) : super(key: key);

  @override
  State<PageListDataGejala> createState() => _PageListDataGejalaState();
}

class _PageListDataGejalaState extends State<PageListDataGejala> {
  List<DataGejala> listGejala = [];
  RepositoryGejala repository = RepositoryGejala();
  getDataGejala() async {
    listGejala = await repository.getDataGejala();
    setState(() {});
  }


  edit(DataGejala dataGejala) async {
    Navigator.push<bool>(
        context,
        MaterialPageRoute(
            builder: (_) => PageUpdateGejala(
              id: dataGejala.id_gejala,
              kode: dataGejala.kode_gejala,
              nama: dataGejala.nama_gejala,
              deskripsi: dataGejala.deskripsi_gejala,
              nilai: dataGejala.nilai_cf,
            ))).then((value) {
      if (value != null && value) {
        getDataGejala();
      }
    });
  }

  _showAlertDialogDeleteGejala(DataGejala dataGejala) {
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
        bool response = await repository.deletegejala('${dataGejala.id_gejala}');
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
                fontSize: 16
            );
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
                fontSize: 16
            );
          });
        }
        getDataGejala();
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
    getDataGejala();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'List Data Gejala',
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
              Padding(
                padding: const EdgeInsets.only(left: 5,top: 5),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () => {
                    Navigator.push<bool>(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PageTambahGejala()))
                        .then((value) {
                      if (value != null && value) {
                        getDataGejala();
                      }
                    })
                  },
                  icon: Icon(Icons.add, color: Colors.black,),
                  label: Text('Tambah Data Gejala',style: TextStyle(
                      color: Colors.black,
                    fontSize: 13,
                  ),),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listGejala.length,
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
                                      SizedBox(height: 5),
                                      Text(
                                        'Kode Gejala\n'
                                            '${listGejala[index].kode_gejala}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Nama Gejala\n'
                                            '${listGejala[index].nama_gejala}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Deskripsi Gejala\n'
                                            '${listGejala[index].deskripsi_gejala}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Nilai CF\n'
                                            '${listGejala[index].nilai_cf}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 9),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(width: 10),
                                          MaterialButton(
                                            onPressed: () {
                                              edit(listGejala[index]);
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
                                          MaterialButton(
                                            onPressed: () async {
                                              _showAlertDialogDeleteGejala(
                                                  listGejala[index]);
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            height: 15,
                                            minWidth: 30,
                                            child: Text(
                                              'Hapus',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white),
                                            ),
                                            color: Colors.red,
                                          ),
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
