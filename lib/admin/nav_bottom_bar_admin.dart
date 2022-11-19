import 'package:flutter/material.dart';
import 'akun/akun_admin.dart';
import 'home/PageHomeAdmin.dart';

class PageNavBottomBarAdmin extends StatefulWidget {
  const PageNavBottomBarAdmin({Key? key}) : super(key: key);

  @override
  State<PageNavBottomBarAdmin> createState() => _PageNavBottomBarAdminState();
}

class _PageNavBottomBarAdminState extends State<PageNavBottomBarAdmin> {
  int page = 0;

  @override
  PageNavBottomBarAdmin get widget => super.widget;

  final List<Widget> _listPage = [PageHomeAdmin(),PageAkunAdmin()];

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

