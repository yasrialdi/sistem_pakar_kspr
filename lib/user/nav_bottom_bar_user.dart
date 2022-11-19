import 'package:flutter/material.dart';
import 'package:sistem_pakar_kspr/user/akun/akun_user.dart';

import 'home/PageHomeUser.dart';

class PageNavBottomBarUser extends StatefulWidget {
  const PageNavBottomBarUser({Key? key}) : super(key: key);

  @override
  State<PageNavBottomBarUser> createState() => _PageNavBottomBarUserState();
}

class _PageNavBottomBarUserState extends State<PageNavBottomBarUser> {
  int page = 0;

  @override
  PageNavBottomBarUser get widget => super.widget;

  final List<Widget> _listPage = [PageHomeUser(),PageAkunUser()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _listPage[page],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: Tap,
          currentIndex: page,
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Color(0xFFFF80AB),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: '',
            ),
          ],
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.pinkAccent,
        //   child: Icon(Icons.add),
        //   onPressed: (){
        //     showModalBottomSheet(isScrollControlled: true, context: context, builder: (context){
        //       return PageAddSkrining();
        //     });
        //   },
        // ),
      ),
    );
  }

  void Tap(int value) {
    setState(() {
      page = value;
    });
  }
}

