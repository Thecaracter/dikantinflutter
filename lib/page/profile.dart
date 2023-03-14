import 'dart:convert';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:dikantin/api/service_Api.dart';
import 'package:dikantin/login.dart';
import 'package:dikantin/model/Menu_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ServiceApi api = ServiceApi();
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
              child: Column(
                children: [
                  Container(
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
                    height: 20,
                  ),
                  Text(
                    _name?.replaceAll('"', '') ?? '',
                    style: TextStyle(
                        color: Color(0xffedf4f6),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _email?.replaceAll('"', '') ?? '',
                    style: TextStyle(
                        color: Color(0xffedf4f6),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.4),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffedf3f6),
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
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 6,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
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
            Positioned(
              top: MediaQuery.of(context).size.height / 2.7,
              left: MediaQuery.of(context).size.width / 5.5,
              child: Column(
                children: [
                  Container(
                    height: 90,
                    width: 260,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60.0),
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
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, right: 14, left: 10),
                                child: Image.asset(
                                  "assets/Vector.png",
                                  height: 50,
                                  width: 100,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 2, right: 5, left: 14),
                                child: Text(
                                  "Total Menu",
                                  style: TextStyle(
                                    fontSize: 19.0,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                            width: 20, thickness: 1, color: Color(0xff514D4E)),
                        Expanded(
                          child: FutureBuilder<List<MenuApi>>(
                            future: api.getMenu(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(' ${snapshot.data!.length}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 30.0,
                                    ));
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return Text("Not found");
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
