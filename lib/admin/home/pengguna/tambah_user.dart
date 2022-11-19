import 'package:flutter/material.dart';
import 'package:sistem_pakar_kspr/admin/nav_bottom_bar_admin.dart';
import 'package:sistem_pakar_kspr/firstpage/RepositoryLogin.dart';

class PageTambahUser extends StatefulWidget {
  const PageTambahUser({Key? key}) : super(key: key);

  @override
  State<PageTambahUser> createState() => _PageTambahUserState();
}

class _PageTambahUserState extends State<PageTambahUser> {
  final formKey = GlobalKey<FormState>();

  bool isloading = false;
  bool _hide = true;

  RepositoryLogin repository = RepositoryLogin();
  final _nama = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text(
          'Tambah Data User',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Stack(
        // alignment: Alignment.bottomCenter,
        alignment: Alignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 250),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      controller: _username,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'username',
                        hintStyle: TextStyle(fontSize: 13,
                            fontFamily: 'Ubuntu'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.6),
                            width: 1,
                          ),
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Username/nama Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      controller: _password,
                      obscureText: _hide,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'password',
                        hintStyle: TextStyle(fontSize: 13,
                            fontFamily: 'Ubuntu'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xffBFBFBF),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.6),
                            width: 1,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _hide ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _hide = !_hide;
                            });
                          },
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Password Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()){
                          setState(() {
                            isloading = true;
                          });
                          await repository.postDataReg(
                              _username.text,
                              _password.text);

                          Navigator.pop(context,true);
                        }

                      },
                      color: Colors.white,
                      height: 45,
                      minWidth: 360,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: (isloading)
                          ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.pinkAccent,
                            strokeWidth: 1.5,
                          )
                      )
                          : const Text(
                        'Simpan',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                            color: Colors.pinkAccent),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                  Image.asset(
                    'images/logo.png',
                    height: 64,
                    width: 81,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

