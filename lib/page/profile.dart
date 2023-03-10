import 'dart:convert';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:dikantin/login.dart';
import 'package:flutter/material.dart';
import 'package:dikantin/api/service_Api.dart';

import 'package:dikantin/model/User_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  String? _kantin;
  String? _name;
  String? _email;
  String? _foto;
  void initState() {
    super.initState();
    _getToken();
  }

  Future<void> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // _token = prefs.getString('access_token');
      _name = prefs.getString('user_token');
      _email = prefs.getString('email_token');
      _kantin = prefs.getString('id_kantin');
      _foto = prefs.getString('foto');
      print(_foto);

      String uppercaseToken = _name!.toUpperCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Group_14.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 30,
              child: Container(
                width: 400,
                height: 50,
                child: Center(
                  child: Text("PROFIL",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(4, 4),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(60.0),
                        border: Border.all(width: 2.0, color: Colors.blue),
                      ),
                      child: ClipOval(
                        child: _foto != null
                            ? Image.network(
                                "http://10.10.0.61/public/storage/foto/" +
                                    _foto!.replaceAll('"', ''),
                                width: 120.0,
                                height: 120.0,
                                fit: BoxFit.cover,
                              )
                            : SizedBox(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _name?.replaceAll('"', '') ?? '',
                      style: TextStyle(
                          color: Color(0xff514D4E),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _email?.replaceAll('"', '') ?? '',
                      style: TextStyle(
                          color: Color(0xff514D4E),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Container(
                      height: 49,
                      width: 295,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(4, 4),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                CarbonIcons.user_avatar,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              child: Text(
                                "Account",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(left: 8.0),
                              child: IconButton(
                                icon: Icon(
                                  CarbonIcons.play_outline_filled,
                                  color: Colors.blue,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 49,
                      width: 295,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(4, 4),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                CarbonIcons.information,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              child: Text(
                                "About Us",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(left: 8.0),
                              child: IconButton(
                                icon: Icon(
                                  CarbonIcons.play_outline_filled,
                                  color: Colors.blue,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Image.asset(
                                "assets/Tanya.png",
                                width: 64.0,
                                height: 64.0,
                                fit: BoxFit.fitHeight,
                              ),
                              actions: <Widget>[
                                Center(
                                  child: Text(
                                    "Anda Akan Logout ?",
                                    style: TextStyle(
                                      color: Color(0xff3CA2D9),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        child: Text('Ya'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const Login(),
                                              ));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          backgroundColor: Colors.green,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: ElevatedButton(
                                        child: Text('Tidak'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 49,
                        width: 295,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(4, 4),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  CarbonIcons.logout,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
