import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_pakar_kspr/beratjanin/hasil_cek_berat_janin.dart';
import 'package:sistem_pakar_kspr/beratjanin/repository_tbj.dart';

class PageCekBeratJanin extends StatefulWidget {
  const PageCekBeratJanin({Key? key}) : super(key: key);

  @override
  State<PageCekBeratJanin> createState() => _PageCekBeratJaninState();
}

class _PageCekBeratJaninState extends State<PageCekBeratJanin> {
  final formKey = GlobalKey<FormState>();

  bool isloading = false;
  late SharedPreferences preferences;

  RepositoryTBJ repository = RepositoryTBJ();

  final _kotak1 = TextEditingController();

  List<String> listNilai = ["11", "12"];

  String nNilai = "12";
  int? nilaicf;

  void pilihNilai(String value) {
    setState(() {
      nNilai = value;
    });
  }

  void _showDialogDetail() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Info Mengenai Tinggi Fundus Uteri"),
          content: SingleChildScrollView(
            child: Container(
              width: 500.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "Ibu perlu berbaring pada tempat tidur. "
                          "Gunakan alat pengukur dimulai dari simfisis pubis "
                          "(tulang kemaluan) hingga bagian atas perut (fundus). "
                          "Jarak kedua bagian tersebut adalah tinggi dari fundus uteri")
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
  void _showDialogDetail2() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Info Mengenai Nilai n"),
          content: SingleChildScrollView(
            child: Container(
              width: 500.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "Huruf N merupakan variabel angka yang sudah "
                          "ditentukan dalam pembuatan rumus ini, menandakan "
                          "apakah janin sudah masuk panggul atau belum. "
                          "Masukkan angka 11 jika kepala bayi belum masuk "
                          "panggul bagian atas, dan 12 jika kepala bayi "
                          "sudah memasuki area panggul.")
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
    SharedPreferences.getInstance().then((value) => preferences = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Tafsiran Berat Badan Janin',
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
              SizedBox(
                height: 65,
              ),
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
                    children: [
                      SizedBox(height: 38),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Ukuran TFU :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              _showDialogDetail();
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.info_outlined, size: 15),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 190),
                        child: TextFormField(
                          controller: _kotak1,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            hintText: "nilai TFU",
                            hintStyle: TextStyle(fontFamily: "Ubuntu"),
                          ),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Isi nilai TFU';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Nilai n :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              color: Colors.black,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              _showDialogDetail2();
                            },
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.info_outlined, size: 15),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 190),
                        child: DropdownButtonFormField<String>(
                          value: nNilai,
                          onChanged: (String? value) {
                            pilihNilai(value ?? "");
                            nilaicf = listNilai.indexOf(value ?? "");
                          },
                          items: listNilai.map((String value) {
                            return DropdownMenuItem(
                              //tampilan isi data dropdown
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle:
                                TextStyle(fontSize: 8, fontFamily: 'Ubuntu'),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      MaterialButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isloading = true;
                            });

                            String id_pengguna = preferences.getString("id_pengguna")!;

                            var responsetbj = await repository.postDataTambahTFU(
                              id_pengguna,
                              _kotak1.text,
                              nNilai.toString(),
                            );

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => PageHasilCekBeratJanin(
                                      tfu: responsetbj["tfu"].toString(),
                                      nilain: responsetbj["nilai_n"].toString(),
                                      nilaitbj: responsetbj["nilai_tbj"].toString(),
                                    )));
                          }
                        },color: Colors.pinkAccent,

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
                            )
                        )
                            : const Text(
                          'SIMPAN',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu',
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
