import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistem_pakar_kspr/icon/MyIcon.dart';
import 'package:sistem_pakar_kspr/user/datadiri/data_diri.dart';
import 'package:sistem_pakar_kspr/user/datadiri/data_kehamilan.dart';


class PageMenuDataDiri extends StatefulWidget {
  const PageMenuDataDiri({Key? key}) : super(key: key);

  @override
  State<PageMenuDataDiri> createState() => _PageMenuDataDiriState();
}

class _PageMenuDataDiriState extends State<PageMenuDataDiri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Data Diri',
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
                padding: const EdgeInsets.only(left: 20,right: 20),
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
                      SizedBox(height: 38),
                      Row(
                        children: [
                          SizedBox(
                            width: 55,
                          ),
                          Column(children: [
                            FlatButton(
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PageDataDiri()))
                              },
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(MyFlutterApp.user_plus, size: 35),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Data Diri',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(
                            width: 50,
                          ),
                          Column(children: [
                            FlatButton(
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PageDataKehamilan()))
                              },
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(MyFlutterApp.calendar_check_o, size: 35),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Data Kehamilan',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ],
                      ),
                      SizedBox(height: 38),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
