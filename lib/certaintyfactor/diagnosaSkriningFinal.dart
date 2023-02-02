import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_pakar_kspr/certaintyfactor/diagnosaRepository.dart';
import 'package:sistem_pakar_kspr/certaintyfactor/gejalaModel.dart';
import 'package:sistem_pakar_kspr/certaintyfactor/hasilDiagnosa.dart';

class PageDiagnosaFinal extends StatefulWidget {
  const PageDiagnosaFinal({Key? key}) : super(key: key);

  @override
  State<PageDiagnosaFinal> createState() => _PageDiagnosaFinalState();
}

class _PageDiagnosaFinalState extends State<PageDiagnosaFinal> {
  List<Gejala> listGejala = [];
  late List<bool> _isChecked;
  RepositoryGejalaDiagnosa repository = RepositoryGejalaDiagnosa();
  Future<void> getDataGejala() async {
    listGejala = await repository.getDataCF();
    _isChecked = List<bool>.filled(listGejala.length, false);
    setState(() {});
  }

  late SharedPreferences preferences;

  final formKey = GlobalKey<FormState>();
  bool isloading = false;

  void _showDialogDetail(Gejala dataGejala) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Info Mengenai Gejala"),
          content: SingleChildScrollView(
            child: Container(
              width: 500.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Nama Gejala"
                      "  : "
                      "${dataGejala.nama_gejala}\n"
                      "Deskripsi Gejala"
                      " : "
                      "${dataGejala.deskripsi_gejala}\n")
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

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) => preferences = value);
    getDataGejala().then((value) =>
        SchedulerBinding.instance!.addPostFrameCallback((_) => showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return WillPopScope(
                  onWillPop: () => Future.value(false),
                  child: AlertDialog(
                    title: Text("Apakah anda hamil?"),
                    actions: <Widget>[
                      FlatButton(
                        child: new Text("Ya"),
                        onPressed: () {
                          setState(() {
                            _isChecked[0] = true;
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: new Text("Tidak"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            )));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Skrining Kehamilan Resiko Tinggi',
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
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5)),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'Pilih Gejala Yang Dialami',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    height: 700,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: listGejala.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                title: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                            "${listGejala[index].nama_gejala}")),
                                    FlatButton(
                                      onPressed: () {
                                        _showDialogDetail(listGejala[index]);
                                      },
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        // Replace with a Row for horizontal icon + text
                                        children: <Widget>[
                                          Icon(Icons.info_outlined, size: 15),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                value: _isChecked[index],
                                onChanged: (val) {
                                  if (index > 0) {
                                    setState(() =>
                                    _isChecked[index] = val!);
                                  }

                                  if(_isChecked[1]){
                                    _isChecked[2] = !_isChecked[1] ;
                                    _isChecked[3] = !_isChecked[1] ;
                                    _isChecked[4] = !_isChecked[1] ;
                                    _isChecked[5] = !_isChecked[1] ;
                                    _isChecked[6] = !_isChecked[1] ;
                                    _isChecked[7] = !_isChecked[1] ;
                                    _isChecked[10] = !_isChecked[1] ;
                                    _isChecked[11] = !_isChecked[1] ;
                                    _isChecked[12] = !_isChecked[1] ;
                                    _isChecked[13] = !_isChecked[1] ;
                                  }

                                  if(_isChecked[2]){
                                    _isChecked[1] = !_isChecked[2];
                                    _isChecked[4] = !_isChecked[2];
                                    _isChecked[5] = !_isChecked[2];
                                    _isChecked[6] = !_isChecked[2];
                                    _isChecked[10] = !_isChecked[2];
                                    _isChecked[11] = !_isChecked[2];
                                    _isChecked[12] = !_isChecked[2];
                                    _isChecked[13] = !_isChecked[2];
                                  }

                                  if(_isChecked[3]){
                                    _isChecked[1] = !_isChecked[3];
                                    _isChecked[4] = !_isChecked[3];
                                    _isChecked[5] = !_isChecked[3];
                                    _isChecked[6] = !_isChecked[3];
                                    _isChecked[10] = !_isChecked[3];
                                    _isChecked[11] = !_isChecked[3];
                                    _isChecked[12] = !_isChecked[3];
                                    _isChecked[13] = !_isChecked[3];
                                  }

                                  if(_isChecked[4]){
                                    _isChecked[1] = !_isChecked[4];
                                    _isChecked[2] = !_isChecked[4];
                                    _isChecked[3] = !_isChecked[4];
                                    _isChecked[5] = !_isChecked[4];
                                  }

                                  if(_isChecked[5]){
                                    _isChecked[1] = !_isChecked[5];
                                    _isChecked[2] = !_isChecked[5];
                                    _isChecked[3] = !_isChecked[5];
                                    _isChecked[4] = !_isChecked[5];
                                  }

                                  if(_isChecked[6]){
                                    _isChecked[1] = !_isChecked[6];
                                    _isChecked[2] = !_isChecked[6];
                                    _isChecked[3] = !_isChecked[6];
                                  }

                                  if(_isChecked[7]){
                                    _isChecked[1] = !_isChecked[7];
                                  }

                                  if(_isChecked[25]){
                                    _isChecked[26] = !_isChecked[25];
                                  }

                                  if(_isChecked[26]){
                                    _isChecked[25] = !_isChecked[26];
                                  }

                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        MaterialButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isloading = true;
                              });
                              List<int> hasilArray =
                                  _isChecked.map((e) => e ? 1 : 0).toList();
                              List<String> hasilGejala = [];
                              for (var i = 0; i < hasilArray.length; i++) {
                                if (hasilArray[i] == 1) {
                                  hasilGejala.add(listGejala[i].id_gejala);
                                }
                              }
                              String hasil = hasilArray.join("#");
                              String hasil2 = hasilGejala.join("#");
                              String id_pengguna =
                                  preferences.getString("id_pengguna")!;

                              var responsecf = await repository
                                  .postDataTambahCF(id_pengguna, hasil);
                              var responsefc = await repository
                                  .postDataTambahFC(id_pengguna, hasil2);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageHasilDiagnosa(
                                            idcf: responsecf["id_diagnosa"],
                                            idfc: responsefc["id_diagnosa"],
                                            nama_diagnosacf:
                                                responsecf["nama_diagnosa"],
                                            nilaicf: responsecf["nilai"],
                                            nama_diagnosafc:
                                                responsefc["nama_diagnosa"],
                                            nilaifc: responsefc["nilai"],
                                          )));
                            }
                          },
                          color: Colors.pinkAccent,
                          height: 35,
                          minWidth: 100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: (isloading)
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1.5,
                                  ))
                              : const Text(
                                  'SIMPAN',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white),
                                ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
