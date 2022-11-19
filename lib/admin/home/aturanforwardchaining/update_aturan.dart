import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_pakar_kspr/admin/home/aturanforwardchaining/RepositoryAturan.dart';
import 'package:sistem_pakar_kspr/admin/home/aturanforwardchaining/list_aturan.dart';
import 'package:sistem_pakar_kspr/certaintyfactor/diagnosaRepository.dart';
import 'package:sistem_pakar_kspr/certaintyfactor/gejalaModel.dart';

class PageUpdateAturan extends StatefulWidget {
  final String id, nama;

  const PageUpdateAturan({Key? key,
     required this.id,
     required this.nama,
  }) : super(key: key);

  @override
  State<PageUpdateAturan> createState() => _PageUpdateAturanState();
}

class _PageUpdateAturanState extends State<PageUpdateAturan> {
  List<Gejala> listGejala = [];
  late List<bool> _isChecked;
  RepositoryGejalaDiagnosa repository = RepositoryGejalaDiagnosa();
  getDataGejala() async {
    listGejala = await repository.getDataCF();
    _isChecked = List<bool>.filled(listGejala.length, false);
    setState(() {});
  }

  RepositoryAturan repositoryAturan = RepositoryAturan();

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
          'Update Aturan Forward Chaining',
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text(
                          'Nama Diagnosa :',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.nama,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Gejala :',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10,)
                      ],
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
                        MaterialButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()){
                              setState(() {
                                isloading = true;
                              });

                              List<int> hasilArray =
                              _isChecked.map((e) => e ? 1 : 0).toList();

                              List<String> hasilGejala = [];
                              for (var i = 0; i < hasilArray.length; i++) {
                                if (hasilArray[i] == 1) {
                                  hasilGejala.add(listGejala[i].nama_gejala);
                                }
                              }

                              String hasil2 = hasilGejala.join("#");

                              await repositoryAturan
                                  .postUpdateAturan(widget.id, hasil2);
                              //
                              //

                              Navigator.pop(context,true);
                            }
                          },color: Colors.pinkAccent,

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
                              )
                          )
                              : const Text(
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

