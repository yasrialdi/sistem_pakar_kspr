import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistem_pakar_kspr/riwayatskrining/ModelRiwayat.dart';
import 'package:sistem_pakar_kspr/riwayatskrining/RepositoryRiwayat.dart';

class PageRiwayatSkriningUser extends StatefulWidget {


  const PageRiwayatSkriningUser({Key? key}) : super(key: key);

  @override
  State<PageRiwayatSkriningUser> createState() => _PageRiwayatSkriningUserState();
}

class _PageRiwayatSkriningUserState extends State<PageRiwayatSkriningUser> {
  List<DataRiwayat> listRiwayat = [];
  RepositoryRiwayat repository = RepositoryRiwayat();
  getDataDiagnosa() async {
    listRiwayat = await repository.getDataRiwayatUser();
    setState(() {});
  }

  void _showDetailRiwayat(DataRiwayat dataRiwayat) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              width: 500.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    "${dataRiwayat.nama_diagnosa}",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Ubuntu',
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
                  SizedBox(height: 30),
                  Text("Deskripsi :"),
                  Text("${dataRiwayat.deskripsi_diagnosa}"),
                  SizedBox(height: 10),
                  Text("Solusi :"),
                  Text("${dataRiwayat.solusi}"),
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
    // getDataDiagnosa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Riwayat Skrining',
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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listRiwayat.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: Card(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${listRiwayat[index].metode}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Ubuntu',
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${listRiwayat[index].tanggal}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Ubuntu',
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Text(
                                            '${listRiwayat[index].nama_diagnosa}'+(listRiwayat[index].nilai == '0' ?"":
                                                ' (${listRiwayat[index].nilai}%)'),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Ubuntu',
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(width: 10),
                                          MaterialButton(
                                            onPressed: () {
                                              _showDetailRiwayat(
                                                  listRiwayat[index]);
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            height: 15,
                                            minWidth: 30,
                                            child: Text(
                                              'Detail',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white),
                                            ),
                                            color: Color(0xff2484DF),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
