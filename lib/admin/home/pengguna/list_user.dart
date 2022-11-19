import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sistem_pakar_kspr/admin/home/pengguna/tambah_user.dart';
import 'package:sistem_pakar_kspr/admin/home/pengguna/update_user.dart';
import 'package:sistem_pakar_kspr/akun/Model_Akun.dart';
import 'package:sistem_pakar_kspr/akun/RepositoryAkun.dart';

class PageListUser extends StatefulWidget {
  const PageListUser({Key? key}) : super(key: key);

  @override
  State<PageListUser> createState() => _PageListUserState();
}

class _PageListUserState extends State<PageListUser> {
  List<DataAkun> listAkun = [];
  RepositoryAkun repository = RepositoryAkun();
  getDataAkun() async {
    listAkun = await repository.getDataAkun();
    setState(() {});
  }


  edit(DataAkun dataAkun) async {
    Navigator.push<bool>(
        context,
        MaterialPageRoute(
            builder: (_) => PageUpdateUser(
              id: dataAkun.id,
              username: dataAkun.username,
              level: dataAkun.level,
              password: dataAkun.password,
            )))
        .then((value) {
      if (value != null && value) {
        getDataAkun();
      }
    });
  }

  _showAlertDialogDeleteRoom(DataAkun dataAkun) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () async {
        bool response = await repository.deleteuser('${dataAkun.id}');
        if (response != '0') {
          Navigator.of(context).pop();
          setState(() {
            Fluttertoast.showToast(
                msg: "Delete Berhasil",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 16
            );
          });
        } else {
          setState(() {
            Fluttertoast.showToast(
                msg: "Delete Gagal",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 16
            );
          });
        }
        getDataAkun();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Apakah yakin untuk menghapus pengguna ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    getDataAkun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'List Data User',
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
              Padding(
                padding: const EdgeInsets.only(left: 5,top: 5),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () => {
                    Navigator.push<bool>(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PageTambahUser()))
                        .then((value) {
                      if (value != null && value) {
                        getDataAkun();
                      }
                    })
                  },
                  icon: Icon(Icons.add, color: Colors.black,),
                  label: Text('Tambah Data User',style: TextStyle(
                      color: Colors.black,
                    fontSize: 13,
                  ),),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listAkun.length,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5),
                                      Text(
                                        'Username          : ${listAkun[index].username}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Level                    : ${listAkun[index].level}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 9),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(width: 10),
                                          MaterialButton(
                                            onPressed: () {
                                              edit(listAkun[index]);
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            height: 15,
                                            minWidth: 30,
                                            child: Text(
                                              'Update',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white),
                                            ),
                                            color: Colors.pinkAccent,
                                          ),
                                          SizedBox(width: 10),
                                          MaterialButton(
                                            onPressed: () async {
                                              _showAlertDialogDeleteRoom(
                                                  listAkun[index]);
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            height: 15,
                                            minWidth: 30,
                                            child: Text(
                                              'Hapus',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white),
                                            ),
                                            color: Colors.red,
                                          ),
                                          SizedBox(height: 10),
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
