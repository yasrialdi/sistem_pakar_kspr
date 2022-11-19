import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_pakar_kspr/admin/nav_bottom_bar_admin.dart';
import 'package:sistem_pakar_kspr/akun/Model_Akun.dart';
import 'package:sistem_pakar_kspr/akun/RepositoryAkun.dart';
import 'package:sistem_pakar_kspr/firstpage/boarding_screen.dart';
import 'package:sistem_pakar_kspr/user/nav_bottom_bar_user.dart';

late String cekLevel, cekUsername;

class PageSplashScreen extends StatefulWidget {
  const PageSplashScreen({Key? key}) : super(key: key);

  @override
  State<PageSplashScreen> createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {

  List<DataAkun> listAkun = [];
  RepositoryAkun repository = RepositoryAkun();
  getDataAkun() async {
    listAkun = await repository.getDataAkun();
    setState(() {});
  }


  Future getAkun() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var ambilUsername = preferences.getString('username');
    var ambilLevel = preferences.getString('level');
    setState(() {
      cekUsername = ambilUsername as String;
      cekLevel = ambilLevel as String;
    });
  }

  startsplashscreen() {
    var durasi = const Duration(seconds: 3);
    return Timer(durasi, () {

      if(cekUsername == null){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PageBoardingScreen()));
      }else{
        if(cekLevel == "Admin"){
          // use navigator push replacement so that user can not go back to login page
          Fluttertoast.showToast(
              msg: "Login Sebagai Admin",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16
          );
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => PageNavBottomBarAdmin()));
          getDataAkun();
        }else{
          Fluttertoast.showToast(
              msg: "Login Sebagai User",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16
          );
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => PageNavBottomBarUser()));
          getDataAkun();
        }
      }
    });
  }

  @override
  void initState() {
    startsplashscreen();
    getAkun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/launcher.png',
                  height: 300,
                  width: 350,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
