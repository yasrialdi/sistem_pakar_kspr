import 'package:flutter/material.dart';
import 'package:sistem_pakar_kspr/akun/RepositoryAkun.dart';

class PageUpdateUser extends StatefulWidget {
  final String id, username, password, level;
  const PageUpdateUser({Key? key,
    required this.id,
    required this.username,
    required this.password,
    required this.level,

  }) : super(key: key);

  @override
  State<PageUpdateUser> createState() => _PageUpdateUserState();
}

class _PageUpdateUserState extends State<PageUpdateUser> {
  final formKey = GlobalKey<FormState>();


  bool _hide = true;

  RepositoryAkun repository = RepositoryAkun();
  final _nama = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();

  List<String> listLevel = ["User", "Admin"];

  String nLevel = "User";

  int? nilailevel;

  void pilihLevel(String value) {
    setState(() {
      nLevel = value;
    });
  }

  _showAlertDialogAdd() {
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
        await repository.updateuser(
            widget.id.toString(),
            _nama.text,
            _username.text,
            _password.text,
            nLevel
        );
        Navigator.of(context).pop();
        Navigator.pop(context,true);

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cek Kembali"),
      content: Text(
              "Username" "  = " "${_username.text}\n"
              "Password" "   = " "${_password.text}\n"
              "Level" "           = " "$nLevel\n"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {

    _username.text = widget.username;
    _password.text = widget.password;
    nLevel = widget.level;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Update Data User',
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
                  SizedBox(height: 200),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      controller: _username,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Username',
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
                    height: 55,
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
                      width: 400,
                      height: 55,
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: nLevel,
                              onChanged: (String ? value) {
                                pilihLevel(value ?? "");
                                nilailevel = listLevel.indexOf(value ?? "");
                              },
                              items: listLevel.map(
                                      (String value) {
                                    return DropdownMenuItem( //tampilan isi data dropdown
                                      child: Text(value),
                                      value: value,
                                    );
                                  }
                              ).toList(),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: TextStyle(
                                    fontSize: 8, fontFamily: 'Ubuntu'),
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
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _showAlertDialogAdd();

                        }
                      },
                      color: Colors.white,
                      height: 45,
                      minWidth: 360,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

