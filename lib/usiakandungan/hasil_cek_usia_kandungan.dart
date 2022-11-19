import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageHasilCekUsiaKandungan extends StatefulWidget {
  final String tgl_hpht, tgl_pengecekan, usiakan, tgl_kelahiran;

  const PageHasilCekUsiaKandungan({Key? key,
    required this.tgl_hpht,
    required this.tgl_pengecekan,
    required this.usiakan,
    required this.tgl_kelahiran,
  }) : super(key: key);

  @override
  State<PageHasilCekUsiaKandungan> createState() =>
      _PageHasilCekUsiaKandunganState();
}

class _PageHasilCekUsiaKandunganState extends State<PageHasilCekUsiaKandungan> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Hasil Cek Usia Kandungan',
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
        child: Column(
          children: [
            SizedBox(height: 65),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
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
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 30,),
                          // Text(
                          //   "Usia Kehamilan Anda Berdasarkan Hari \n"
                          //       "Pertama Haid Terakhir ${widget.tgl_hpht} Yaitu :",
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 15,
                          //     fontFamily: 'Ubuntu',
                          //     color: Colors.black,
                          //   ),
                          // ),
                          Text(
                            "Tanggal pengecekan :\n"
                                " ${widget.tgl_pengecekan} ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 30,),
                          Text(
                            "Tanggal HPHT : \n"
                                "${widget.tgl_hpht}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 30,),
                          Text(
                            "Prediksi Tanggal Kelahiran : \n"
                                "${widget.tgl_kelahiran}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 30,),
                          Text(
                            "Usia Kehamilan Saat ini : \n"
                                "${widget.usiakan}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50,),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
