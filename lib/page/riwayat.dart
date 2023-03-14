import 'package:dikantin/api/service_Api.dart';
import 'package:flutter/material.dart';
import 'package:dikantin/model/Riwayat_model.dart';
import 'package:intl/intl.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  ServiceApiRiwayat serviceRiwayat = ServiceApiRiwayat();
  late Future<List<ModelRiwayat>> listData;

  @override
  void initState() {
    super.initState();
    listData = serviceRiwayat.getriwayat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  child: Text(
                    "RIWAYAT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
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
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Container(
                    child: FutureBuilder<List<ModelRiwayat>>(
                      future: listData,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<ModelRiwayat>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData) {
                          final data = snapshot.data!;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: [
                                DataColumn(label: Text('NO')),
                                DataColumn(label: Text('Tanggal')),
                                DataColumn(label: Text('Petugas')),
                                DataColumn(label: Text('Menu')),
                                DataColumn(label: Text('Jumlah')),
                                DataColumn(label: Text('Harga')),
                              ],
                              rows: List<DataRow>.generate(
                                data.length,
                                (index) => DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text((index + 1).toString()))),
                                    DataCell(Center(
                                        child: Text(
                                            data[index].tanggal.toString()))),
                                    DataCell(Center(
                                        child: Text(
                                            data[index].kasir.toString()))),
                                    DataCell(Center(
                                        child: Text(
                                            data[index].pesanan.toString()))),
                                    DataCell(Center(
                                        child: Text(
                                            data[index].jumlah.toString()))),
                                    DataCell(
                                      Text(
                                        NumberFormat.decimalPattern('id_ID')
                                            .format(data[index].hargaSatuan),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
