import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sistem_pakar_kspr/akun//RepositoryAkun.dart';
import 'package:sistem_pakar_kspr/firstpage//login.dart';
import 'package:sistem_pakar_kspr/akun//Model_Akun.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/pengguna/list_user.dart';

class PageAkunAdmin extends StatefulWidget {
  const PageAkunAdmin({Key? key}) : super(key: key);

  @override
  _PageAkunAdminState createState() => _PageAkunAdminState();
}

class _PageAkunAdminState extends State<PageAkunAdmin> {
  bool visibility1 = true;
  bool visibility2 = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == '1') {
        visibility1 = visibility;
      }
      if (field == '2') {
        visibility2 = visibility;
      }
    });
  }

  String username = "";
  String level = "";

  Future getAkun() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('username')!;
      level = preferences.getString('level')!;
    });
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('username');
    preferences.remove('level');
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                PageLogin()),
            (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();
    getAkun();
    getDataAkun();
  }

  List<DataAkun> listAkun = [];
  RepositoryAkun repository = RepositoryAkun();

  getDataAkun() async {
    listAkun = await repository.getDataAkun();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                height: 200,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                    bottom: 0,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                              'images/person.png'),
                          // child:
                        ),
                        SizedBox(height: 10),
                        Text(
                          username,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18, right: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Detail',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,

                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _changed(true, '2');
                              },
                              child: visibility2
                                  ? InkWell(
                                onTap: () {
                                  _changed(false, '2');
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_up_sharp,
                                  color: Colors.black,
                                ),
                              )
                                  : Icon(
                                Icons.keyboard_arrow_right_sharp,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: visibility2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18, right: 9),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Username    : ${username}\n'
                                   'Level             : ${level}'
                              ),
                              SizedBox(height: 15)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                    ),
                    Container(
                      height: 40,
                      child: ListTile(
                        onTap: () {
                          logOut(context);
                        },
                        leading: Icon(
                          Icons.logout,
                          color: Colors.pinkAccent,
                        ),
                        minLeadingWidth: 5,
                        title: Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w200,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                    ),
                    SizedBox(height: 10),
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
