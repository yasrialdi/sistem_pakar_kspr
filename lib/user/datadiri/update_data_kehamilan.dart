import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_pakar_kspr/firstpage/RepositoryLogin.dart';
import 'package:sistem_pakar_kspr/firstpage/login.dart';
import 'package:sistem_pakar_kspr/user/datadiri/RepositoryDataDiri.dart';

import '../nav_bottom_bar_user.dart';

class PageUpdateDataKehamilan extends StatefulWidget {
  final String id_datakehamilan, gravid, partus, abortus, anakhidup;

  const PageUpdateDataKehamilan({Key? key,
    required this.id_datakehamilan,
    required this.gravid,
    required this.partus,
    required this.abortus,
    required this.anakhidup
  }) : super(key: key);

  @override
  _PageUpdateDataKehamilanState createState() => _PageUpdateDataKehamilanState();
}

class _PageUpdateDataKehamilanState extends State<PageUpdateDataKehamilan> {
  final formKey = GlobalKey<FormState>();

  bool isloading = false;
  bool _hide = true;
  bool _rehide = true;

  RepositoryDatadiri repository = RepositoryDatadiri();

  final _gravid = TextEditingController();
  final _partus = TextEditingController();
  final _abortus = TextEditingController();
  final _anakhidup = TextEditingController();

  late SharedPreferences preferences;

  @override
  void initState() {
    _gravid.text = widget.gravid;
    _partus.text = widget.partus;
    _abortus.text = widget.abortus;
    _anakhidup.text = widget.anakhidup;

    SharedPreferences.getInstance().then((value) => preferences = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text(
          'Isi Data Kehamilan',
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
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _gravid,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Gravid (kehamilan ke berapa), isi dg angka',
                        hintStyle:
                            TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
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
                          return 'gravid Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _partus,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText:
                            'Partus (sudah melahirkan berapa kali), isi dg angka',
                        hintStyle:
                            TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
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
                          return 'partus Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _abortus,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText:
                            'Abortus (riwayat keguguran sebelumnya), isi dg angka',
                        hintStyle:
                            TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
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
                          return 'abortus Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _anakhidup,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText:
                            'Anak hidup (jumlah anak hidup), isi dg angka',
                        hintStyle:
                            TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
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
                          return 'anak hidup Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isloading = true;
                          });

                          String id_pengguna =
                              preferences.getString("id_pengguna")!;

                          // print(widget.id_datakehamilan.toString());
                          await repository.UpdateDataKehamilan(
                              widget.id_datakehamilan.toString(),
                              id_pengguna,
                              _gravid.text,
                              _partus.text,
                              _abortus.text,
                              _anakhidup.text);

                          Navigator.pop(context,true);
                        }
                      },color: Colors.white,
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
                        'SIMPAN',
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
