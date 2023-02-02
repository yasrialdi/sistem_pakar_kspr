import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:sistem_pakar_kspr/user/datadiri/RepositoryDataDiri.dart';
import 'package:sistem_pakar_kspr/user/nav_bottom_bar_user.dart';

class PageUpdateDataDiri extends StatefulWidget {
  final String id_datadiri, nama,tgllahir,alamat,pekerjaan, pendidikan,
  namasuami, usiasuami, pekerjaansuami, agama, notelp;

  const PageUpdateDataDiri({Key? key,
    required this.id_datadiri,
    required this.nama,
    required this.tgllahir,
    required this.alamat,
    required this.pekerjaan,
    required this.pendidikan,
    required this.namasuami,
    required this.usiasuami,
    required this.pekerjaansuami,
    required this.agama,
    required this.notelp,

  }) : super(key: key);

  @override
  _PageUpdateDataDiriState createState() => _PageUpdateDataDiriState();
}

class _PageUpdateDataDiriState extends State<PageUpdateDataDiri> {
  final formKey = GlobalKey<FormState>();

  DateTime selectedDate1 = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  TextEditingController _dateController1 = TextEditingController();

  Future<Null> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (picked != null)
      setState(() {
        selectedDate1 = picked;
        _dateController1.text = formatter.format(selectedDate1);
      });
  }

  bool isloading = false;
  bool _hide = true;
  bool _rehide = true;

  late SharedPreferences preferences;

  RepositoryDatadiri repository = RepositoryDatadiri();

  final _nama = TextEditingController();
  final _tgllahir = TextEditingController();
  final _alamat = TextEditingController();
  final _pekerjaan = TextEditingController();
  final _pendidikan = TextEditingController();
  final _namasuami = TextEditingController();
  final _usiasuami = TextEditingController();
  final _pekerjaansuami = TextEditingController();
  final _notelp = TextEditingController();

  List<String> listAgama = ["Islam", "Kristen", "Protestan", "Budha", "Hindu"];
  String nAgama = "Islam";

  void pilihAgama(String value) {
    setState(() {
      nAgama = value;
    });
  }

  @override
  void initState() {
    _nama.text = widget.nama;
    _tgllahir.text = widget.tgllahir;
    _alamat.text = widget.alamat;
    _pekerjaan.text = widget.pekerjaan;
    _pendidikan.text = widget.pendidikan;
    _namasuami.text = widget.namasuami;
    _usiasuami.text = widget.usiasuami;
    _pekerjaansuami.text = widget.pekerjaansuami;
    nAgama = widget.agama;
    _notelp.text = widget.notelp;

    SharedPreferences.getInstance().then((value) => preferences = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text(
          'Isi Data Diri',
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
                      controller: _nama,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Nama lengkap',
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
                          return 'nama Kosong';
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
                      controller: _tgllahir,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Tanggal lahir',
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
                          return 'tanggal lahir Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20,right: 20),
                  //   child: Container(
                  //
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     height: 45,
                  //     color: Colors.white,
                  //     child: Row(
                  //       children: [
                  //         Text(
                  //           "Tanggal lahir",
                  //           style: TextStyle(
                  //             fontSize: 13,
                  //             fontFamily: 'Ubuntu',
                  //             color: Colors.black.withOpacity(0.6),
                  //           ),
                  //         ),
                  //         TextButton(
                  //           onPressed: () {
                  //             _selectDate1(context);
                  //           },
                  //           child: Text(
                  //             "${selectedDate1.day} - ${selectedDate1.month} - ${selectedDate1.year} ",
                  //             style: TextStyle(
                  //                 fontFamily: "Ubuntu",
                  //                 color: Colors.black.withOpacity(0.6)),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      controller: _alamat,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Alamat',
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
                          return 'alamat Kosong';
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
                      controller: _pekerjaan,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Pekerjaan',
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
                          return 'pekerjaan Kosong';
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
                      controller: _pendidikan,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Pendidikan',
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
                          return 'pendidikan Kosong';
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
                      controller: _namasuami,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Nama suami',
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
                          return 'nama suami Kosong';
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
                      controller: _usiasuami,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Usia suami',
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
                          return 'usia suami Kosong';
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
                      controller: _pekerjaansuami,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Pekerjaan suami',
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
                          return 'pekerjaan suami Kosong';
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
                              value: nAgama,
                              onChanged: (String? value) {
                                pilihAgama(value ?? "");
                              },
                              items: listAgama.map((String value) {
                                return DropdownMenuItem(
                                  //tampilan isi data dropdown
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList(),
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
                      )),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _notelp,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'No telp',
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
                          return 'no telp Kosong';
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

                          // print(widget.id_datadiri);
                          // print(id_pengguna);
                          // print(_nama.text);
                          // print(_tgllahir.text);
                          // print(_alamat.text);
                          // print(_pekerjaan.text);
                          // print(_pendidikan.text);
                          // print(_namasuami.text);
                          // print(_usiasuami.text);
                          // print(_pekerjaansuami.text);
                          // print(nAgama);
                          // print(_notelp.text);

                          await repository.UpdateDataDiri(
                              widget.id_datadiri.toString(),
                              id_pengguna.toString(),
                              _nama.text,
                              _tgllahir.text,
                              _alamat.text,
                              _pekerjaan.text,
                              _pendidikan.text,
                              _namasuami.text,
                              _usiasuami.text,
                              _pekerjaansuami.text,
                              nAgama,
                              _notelp.text);

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
