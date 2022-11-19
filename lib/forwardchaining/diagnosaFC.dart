import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_pakar_kspr/certaintyfactor/diagnosaRepository.dart';
import 'package:sistem_pakar_kspr/certaintyfactor/gejalaModel.dart';

class PageDiagnosaFC extends StatefulWidget {
  const PageDiagnosaFC({Key? key}) : super(key: key);

  @override
  State<PageDiagnosaFC> createState() => _PageDiagnosaFCState();
}

class _PageDiagnosaFCState extends State<PageDiagnosaFC> {
  List<Gejala> listGejala = [];
  late List<bool> _isChecked;
  RepositoryGejalaDiagnosa repository = RepositoryGejalaDiagnosa();
  getDataGejala() async {
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
                      "${dataGejala.deskripsi_gejala}\n"
                  )
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
    getDataGejala();
    SharedPreferences.getInstance().then((value) => preferences = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Diagnosa Certainty Factor',
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
              SizedBox(height: 10,),
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
                    child: Center(child: Text(
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
                                    Expanded(child: Text("${listGejala[index].nama_gejala}")),
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
                                  setState(
                                        () {
                                      _isChecked[index] = val!;
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pinkAccent,
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()){
                              setState(() {
                                isloading = true;
                              });
                              List<int> hasilArray = _isChecked.map((e) => e? 1 : 0).toList();
                              List<String> hasilGejala = [];
                              for(var i = 0; i<hasilArray.length; i++){
                                if (hasilArray[i] == 1){
                                  hasilGejala.add(listGejala[i].id_gejala);
                                }
                              }
                              String hasil = hasilArray.join("#");
                              String hasil2 = hasilGejala.join("#");
                              print(hasil);
                              String id_pengguna = preferences.getString("id_pengguna")!;
                              print(id_pengguna);

                              await repository.postDataTambahFC(id_pengguna,hasil2);
                              //
                              //
                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(builder: (context) => PageNavBottomBarAdmin()));
                            }
                          },
                          child: Text(
                            'SIMPAN',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10,)
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

