import 'package:dikantin/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:dikantin/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Boarding extends StatefulWidget {
  const Boarding({super.key, required String title});

  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {
  Future<void> checkSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // ignore: unnecessary_null_comparison
    if (prefs == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WillPopScope(
            onWillPop: () async => false,
            child: Login(),
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WillPopScope(
            onWillPop: () async => false,
            child: Navigation(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4EB2E7), Color(0xFFD9D9D9)]),
      ),
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Image.asset(
            "assets/animasi.png",
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Text(
            "WELCOME TO DIKANTIN",
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Color(0xff1A2F35),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Cari Makan Tinggal Pesan, Mau Jajan Tinggal Tekan",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Color(0xff514D4E),
              fontSize: 10,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          SizedBox(
            width: 320,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4EB2E7),
              ),
              onPressed: () {
                checkSharedPreferences();
              },
              child: const Text("Let’s Start"),
            ),
          ),
        ],
      ),
    );
  }
}
