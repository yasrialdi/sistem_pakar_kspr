import 'package:flutter/material.dart';
import 'package:sistem_pakar_kspr/admin/home/diagnosa/RepositoryDiagnosa.dart';


class PageHasilDiagnosaDetail extends StatefulWidget {
  final String nama_diagnosa, deskripsi, solusi;

  const PageHasilDiagnosaDetail({
    Key? key,
    required this.nama_diagnosa,
    required this.deskripsi,
    required this.solusi,
  }) : super(key: key);

  @override
  State<PageHasilDiagnosaDetail> createState() => _PageHasilDiagnosaDetailState();
}

class _PageHasilDiagnosaDetailState extends State<PageHasilDiagnosaDetail> {

  RepositoryDiagnosa repository = RepositoryDiagnosa();

  // void _showDialog(){
  //   showDialog(
  //     context: context,
  //     builder: (_) {
  //       return AlertDialog(
  //         content: SingleChildScrollView(
  //           child: Container(
  //             width: 500.0,
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 // Center(
  //                 //     child: Text(
  //                 //       nama,
  //                 //       style: TextStyle(
  //                 //           fontSize: 18,
  //                 //           fontFamily: 'Ubuntu',
  //                 //           color: Colors.black,
  //                 //           fontWeight: FontWeight.bold),
  //                 //     )),
  //                 // SizedBox(height: 30),
  //                 // Text("Deskripsi :"),
  //                 // Text("${responsecf['deskripsi'].toString()}"),
  //                 // SizedBox(height: 10),
  //                 // Text("Solusi :"),
  //                 // Text("${responsecf['solusi'].toString()}"),
  //               ],
  //             ),
  //           ),
  //         ),
  //         actions: <Widget>[
  //           new FlatButton(
  //             child: new Text("OK"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
                    // Center(
                    //   child: Text(
                    //     widget.nama_diagnosa,
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 18,
                    //       fontFamily: 'Ubuntu',
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Text(
                                widget.nama_diagnosa,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(height: 30),
                          Text("Deskripsi :"),
                          Text(widget.deskripsi),
                          SizedBox(height: 10),
                          Text("Solusi :"),
                          Text(widget.solusi),
                          SizedBox(height: 20),
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
