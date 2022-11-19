import 'package:flutter/material.dart';

class PageRuleFW extends StatefulWidget {
  const PageRuleFW({Key? key}) : super(key: key);

  @override
  State<PageRuleFW> createState() => _PageRuleFWState();
}

class _PageRuleFWState extends State<PageRuleFW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Rule Forward Chaining',
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
    );
  }
}
