import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dikantin/page/beranda.dart';

class Pesan extends StatefulWidget {
  const Pesan({super.key});

  @override
  State<Pesan> createState() => _PesanState();
}

class _PesanState extends State<Pesan> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("id_ID");
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Group_14.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 30,
              child: Container(
                width: 400,
                height: 50,
                child: Center(
                  child: Text("PESANAN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 100,
              child: Container(
                width: 400,
                height: 50,
                child: Center(
                  child: Text(
                    DateFormat.yMMMMd("id_ID").format(DateTime.now()),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              height: 2000,
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(
                                  9,
                                  9,
                                ),
                                blurRadius: 5,
                              ),
                            ],
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.only(left: 10, right: 2),
                              child: Image(
                                image: AssetImage("assets/nasi.png"),
                              ),
                            ),
                            Expanded(
                              child: Text("Nasi Goreng"),
                              flex: 1,
                            ),
                            Expanded(child: Text("1X"), flex: 1),
                            Expanded(child: Text("Meja 5"), flex: 1),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Image.asset(
                                        "assets/Logout.png",
                                        width: 150.0,
                                        height: 150.0,
                                        fit: BoxFit.fitHeight,
                                      ),
                                      actions: <Widget>[
                                        Center(
                                          child: Text(
                                            "Pesanan Selesai ?",
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
                                                            Beranda(),
                                                      ));
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
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
                                                        BorderRadius.circular(
                                                            10.0),
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
                              child: const Text("Selesai"),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        )),
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
