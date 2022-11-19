import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_pakar_kspr/usiakandungan/hasil_cek_usia_kandungan.dart';
import 'package:sistem_pakar_kspr/usiakandungan/repository_usiakandungan.dart';

class PageCekUsiaKandungan extends StatefulWidget {
  const PageCekUsiaKandungan({Key? key}) : super(key: key);

  @override
  State<PageCekUsiaKandungan> createState() => _PageCekUsiaKandunganState();
}

class _PageCekUsiaKandunganState extends State<PageCekUsiaKandungan> {
  final formKey = GlobalKey<FormState>();
  bool isloading = false;
  late SharedPreferences preferences;

  RepositoryUsiaKandungan repository = RepositoryUsiaKandungan();

  DateTime selectedDate1 = DateTime.now();
  // DateTime selectedDate2 = DateTime.now();

  DateFormat formatter = DateFormat('yyyy-MM-dd');
  // DateFormat formatAd = DateFormat('EEEE, d MMMM y','id_ID');

  TimeOfDay selectedTime1 = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController1 = TextEditingController();
  // TextEditingController _dateController2 = TextEditingController();

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

  // Future<Null> _selectDate2(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate2,
  //       initialDatePickerMode: DatePickerMode.day,
  //       firstDate: DateTime(2015),
  //       lastDate: DateTime(2050));
  //   if (picked != null)
  //     setState(() {
  //       selectedDate2 = picked;
  //       _dateController2.text = formatter.format(selectedDate2);
  //     });
  // }

  @override
  void initState() {
    _dateController1.text = DateFormat.yMd().format(DateTime.now());
    // _dateController2.text = DateFormat.yMd().format(DateTime.now());
    SharedPreferences.getInstance().then((value) => preferences = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Cek Usia Kandungan',
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
              SizedBox(height: 65),
              Center(
                child: Container(
                  width: 350,
                  height: 325,
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
                            width: 30,
                          ),
                          Text(
                            "Hari Pertama Haid Terakhir (HPHT) :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Icon(Icons.calendar_today, color: Colors.pinkAccent),
                          TextButton(
                            onPressed: () {
                              _selectDate1(context);
                            },
                            child: Text(
                              "Tanggal  ${selectedDate1.day} - ${selectedDate1.month} - ${selectedDate1.year} ",
                              style: TextStyle(
                                  fontFamily: "Ubuntu", color: Colors.pinkAccent),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      // Row(
                      //   children: [
                      //     SizedBox(
                      //       width: 30,
                      //     ),
                      //     Text(
                      //       "Tanggal Pengecekan Hari ini :",
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 15,
                      //         fontFamily: 'Ubuntu',
                      //         color: Colors.black,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     SizedBox(
                      //       width: 30,
                      //     ),
                      //     Icon(
                      //       Icons.calendar_today,
                      //       color: Colors.pinkAccent,
                      //     ),
                      //     TextButton(
                      //       onPressed: () {
                      //         _selectDate2(context);
                      //       },
                      //       child: Text(
                      //         "Tanggal  ${selectedDate2.day} - ${selectedDate2.month} - ${selectedDate2.year} ",
                      //         style: TextStyle(
                      //             fontFamily: "Ubuntu", color: Colors.pinkAccent),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: 50),
                      MaterialButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isloading = true;
                            });

                            String id_pengguna =
                                preferences.getString("id_pengguna")!;


                            // print(id_pengguna);
                            // print(_dateController1.text = formatter.format(selectedDate1),);
                            var responseusia =
                                await repository.postDataTambahUsiaKandungan(
                              id_pengguna,
                              _dateController1.text =
                                  formatter.format(selectedDate1),
                            );

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => PageHasilCekUsiaKandungan(
                                      tgl_pengecekan:
                                      responseusia["tgl_pengecekan"],
                                      tgl_hpht:
                                      responseusia["tgl_hpht"],
                                      tgl_kelahiran:  responseusia["tgl_kelahiran"],
                                      usiakan: responseusia["usia_kandungan"],
                                    )));
                          }
                        },
                        color: Colors.pinkAccent,
                        height: 45,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
