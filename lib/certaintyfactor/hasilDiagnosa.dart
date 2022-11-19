import 'package:flutter/material.dart';
import 'package:sistem_pakar_kspr/admin/home/diagnosa/RepositoryDiagnosa.dart';
import 'hasilDiagnosaDetail.dart';

class PageHasilDiagnosa extends StatefulWidget {
  final String id, nama_diagnosacf, nilaicf, nama_diagnosafc, nilaifc;

  const PageHasilDiagnosa({
    Key? key,
    required this.id,
    required this.nama_diagnosacf,
    required this.nilaicf,
    required this.nama_diagnosafc,
    required this.nilaifc,
  }) : super(key: key);

  @override
  State<PageHasilDiagnosa> createState() => _PageHasilDiagnosaState();
}

class _PageHasilDiagnosaState extends State<PageHasilDiagnosa> {
  RepositoryDiagnosa repository = RepositoryDiagnosa();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Hasil Diagnosa',
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
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 38),
                    Center(
                      child: Text(
                        "Sistem Pakar Kehamilan Resiko Tinggi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
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
                            "Hasil Diagnosa Skrining Kehamilan Resiko Tinggi",
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
                            "Metode Certainty Factor",
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
                          MaterialButton(
                            color: Colors.pinkAccent,
                            height: 40,
                            minWidth: 100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onPressed: () async {

                              var id = widget.id;

                              print(id);
                              print(id);
                              print(widget.nama_diagnosacf);

                              var responsecf = await repository
                                  .PostGetDetailDiagnosa(id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageHasilDiagnosaDetail(
                                          nama_diagnosa:
                                              responsecf['nama_diagnosa'],
                                          deskripsi: responsecf['deskripsi'],
                                          solusi: responsecf['solusi'])));
                            },
                            child: Text(
                              "${widget.nama_diagnosacf} ${widget.nilaicf}%",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: 'Ubuntu',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Metode Forward Chaining",
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
                          MaterialButton(color: Colors.pinkAccent,
                            height: 40,
                            minWidth: 100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onPressed: () async {

                              var id = widget.id;

                              print(id);
                              print(id);
                              print(widget.nama_diagnosacf);

                              var responseDetail = await repository
                                  .PostGetDetailDiagnosa(id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageHasilDiagnosaDetail(
                                          nama_diagnosa:
                                              responseDetail['nama_diagnosa'],
                                          deskripsi: responseDetail['deskripsi'],
                                          solusi: responseDetail['solusi'])));
                            },
                            child: Text(
                              widget.nama_diagnosafc,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: 'Ubuntu',
                                color: Colors.black,
                              ),
                            ),
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
