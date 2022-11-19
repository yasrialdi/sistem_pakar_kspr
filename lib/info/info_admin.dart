import 'package:flutter/material.dart';

class PageInfoAdmin extends StatefulWidget {
  const PageInfoAdmin({Key? key}) : super(key: key);

  @override
  State<PageInfoAdmin> createState() => _PageInfoAdminState();
}

class _PageInfoAdminState extends State<PageInfoAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Info Admin',
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
            SizedBox(height: 40),
            Center(
              child: Container(
                width: 350,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 38),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "Sistem Pakar Skrining Kehamilan Resiko Tinggi",
                        textAlign: TextAlign.center,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Ubuntu',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sistem pakar ini merupakan sebuah aplikasi yang berfungsi untuk "
                                "melakukan skrining kehamilan resiko tinggi pada ibu hamil "
                                "agar ibu hamil dapat mengetahui resiko dari kehamilan "
                                "yang sedang di jalani, dan juga mengetahui langkah yang "
                                "akan diambil dari solusi yang diberikan dari aplikasi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "1. Input data gejala berdasarkan ketentuan\n"
                                "    pakar\n"
                                "2. Input data diagnosa berdasarkan ketentuan\n"
                                "    pakar\n"
                                "3. Input data aturan berdasarkan ketentuan\n"
                                "    pakar\n"
                                "4. Konsultasi terlebih dahulu dengan pakar \n"
                                "    mengenai data yang akan diinput atau\n"
                                "    diubah",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          SizedBox(
                            height: 5,
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}