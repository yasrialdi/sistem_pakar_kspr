import 'package:flutter/material.dart';
import 'package:sistem_pakar_kspr/beratjanin/model_tbj.dart';
import 'package:sistem_pakar_kspr/beratjanin/repository_tbj.dart';

class PageHasilCekBeratJanin extends StatefulWidget {
  final String tfu,nilain, nilaitbj;

  const PageHasilCekBeratJanin({Key? key,
    required this.tfu,
    required this.nilain,
    required this.nilaitbj,
  }) : super(key: key);

  @override
  State<PageHasilCekBeratJanin> createState() => _PageHasilCekBeratJaninState();
}

class _PageHasilCekBeratJaninState extends State<PageHasilCekBeratJanin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Hasil Cek Berat Janin',
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Perkiraan Berat Janin Berdasarkan",
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tinggi Fundus Uteri  = ${widget.tfu} dengan Nilai n = ${widget.nilain}",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${widget.nilaitbj} gram",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Ubuntu',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 80,
                          ),
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
