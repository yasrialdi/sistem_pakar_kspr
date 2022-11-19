import 'package:flutter/material.dart';

import 'RepositoryGejala.dart';

class PageTambahGejala extends StatefulWidget {
  const PageTambahGejala({Key? key}) : super(key: key);

  @override
  State<PageTambahGejala> createState() => _PageTambahGejalaState();
}

class _PageTambahGejalaState extends State<PageTambahGejala> {
  final formKey = GlobalKey<FormState>();

  bool isloading = false;

  RepositoryGejala repository = RepositoryGejala();
  final _kode = TextEditingController();
  final _nama = TextEditingController();
  final _deskripsi = TextEditingController();

  List<String> listNilai = ["0", "0.1","0.2", "0.3","0.4", "0.5","0.6", "0.7", "0.8","0.9", "1"];

  String nNilai = "0.2";

  int? nilaicf;

  void pilihNilai(String value) {
    setState(() {
      nNilai = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Tambah Data Gejala',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Stack(
        // alignment: Alignment.bottomCenter,
        alignment: Alignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 200),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      controller: _kode,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Kode Gejala',
                        hintStyle: TextStyle(fontSize: 13,
                            fontFamily: 'Ubuntu'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.6),
                            width: 1,
                          ),
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'kode gejala Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    child: TextFormField(
                      controller: _nama,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Nama Gejala',
                        hintStyle: TextStyle(fontSize: 13,
                            fontFamily: 'Ubuntu'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.6),
                            width: 1,
                          ),
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'nama gejala Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    child: TextFormField(
                      controller: _deskripsi,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Deskripsi Gejala',
                        hintStyle: TextStyle(fontSize: 13,
                            fontFamily: 'Ubuntu'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.6),
                            width: 1,
                          ),
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'deskripsi gejala Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: 400,
                      height: 55,
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: nNilai,
                              onChanged: (String ? value) {
                                pilihNilai(value ?? "");
                                nilaicf = listNilai.indexOf(value ?? "");
                              },
                              items: listNilai.map(
                                      (String value) {
                                    return DropdownMenuItem( //tampilan isi data dropdown
                                      child: Text(value),
                                      value: value,
                                    );
                                  }
                              ).toList(),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: TextStyle(
                                    fontSize: 8, fontFamily: 'Ubuntu'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.6),
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()){
                          setState(() {
                            isloading = true;
                          });
                          // print(_kode);
                          // print(_nama);
                          // print(_deskripsi);
                          // print(nNilai);

                          await repository.postDataTambahGejala(

                              _kode.text,
                              _nama.text,
                              _deskripsi.text,
                              nNilai);

                          Navigator.pop(context,true);
                        }
                      },
                      color: Colors.white,

                      height: 45,
                      minWidth: 360,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: (isloading)
                          ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.pinkAccent,
                            strokeWidth: 1.5,
                          )
                      )
                          : const Text(
                        'Simpan',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                            color: Colors.pinkAccent),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

