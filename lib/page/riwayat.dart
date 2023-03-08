import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
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
              top: 20,
              child: Container(
                width: 400,
                height: 50,
                child: Center(
                  child: Text("RIWAYAT",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('NO')),
                              DataColumn(label: Text('Tanggal')),
                              DataColumn(label: Text('Menu')),
                              DataColumn(label: Text('Jumlah')),
                              DataColumn(label: Text('Harga')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text('1')),
                                DataCell(Text('12/01/2023')),
                                DataCell(Text('Es Teh')),
                                DataCell(Text('1')),
                                DataCell(Text('3000')),
                              ]),
                              // tambahkan baris lain jika diperlukan
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                margin: EdgeInsets.only(top: 100),
                height: 2000,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('NO')),
                              DataColumn(label: Text('Tanggal')),
                              DataColumn(label: Text('Menu')),
                              DataColumn(label: Text('Jumlah')),
                              DataColumn(label: Text('Harga')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text('1')),
                                DataCell(Text('12/01/2023')),
                                DataCell(Text('Es Teh')),
                                DataCell(Text('1')),
                                DataCell(Text('3000')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('2')),
                                DataCell(Text('12/01/2023')),
                                DataCell(Text('Indomie Goreng')),
                                DataCell(Text('2')),
                                DataCell(Text('10.000')),
                              ]),

// tambahkan baris lain jika diperlukan
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
