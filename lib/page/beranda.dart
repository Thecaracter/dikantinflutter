import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Beranda extends StatefulWidget {
  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  String? _kantin;
  @override
  void initState() {
    super.initState();
    _get();
  }

  Future<void> _get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // _token = prefs.getString('access_token');
      _kantin = prefs.getString('id_kantin');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: null, // remove background color
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.white,
              ],
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Image.asset(
                "assets/123.png",
                width: 10.0,
                height: 10.0,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'DIKANTIN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 150,
            )
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Group_14.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 40,
                    bottom: 70,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(100, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Total penghasilan",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Image.asset("assets/toko_icon.png"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Rp 125.000",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          DateFormat("dd-MM-yyyy").format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Kantin " + (_kantin?.replaceAll('"', '') ?? ''),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Image.asset("assets/Group_2.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12, top: 10),
                child: Text(
                  "Task Summary",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff514d4e),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(width: 10),
                  Container(
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRect(
                            child: Align(
                              alignment: Alignment(-0.5, 0.1),
                              child: Transform.scale(
                                scale: 1.5,
                                child: Image(
                                  image: AssetImage("assets/succes.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0, bottom: 0, left: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Succes",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff84d895),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 40, bottom: 5),
                                child: Text(
                                  "35",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff84d895),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRect(
                            child: Align(
                              alignment: Alignment(-0.5, 0.1),
                              child: Transform.scale(
                                scale: 1.5,
                                child: Image(
                                  image:
                                      AssetImage("assets/tabler_loader-3.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0, bottom: 0, left: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Progress",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff87C6E7),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 35, bottom: 5),
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff87C6E7),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(left: 12, top: 10),
                child: Text(
                  "Grafik Penjualan",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff514d4e),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 15),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(1, 50),
                            FlSpot(2, 80),
                            FlSpot(3, 30),
                            FlSpot(4, 90),
                            FlSpot(5, 50),
                            FlSpot(6, 60),
                            FlSpot(7, 70),
                            FlSpot(8, 80),
                            FlSpot(9, 40),
                            FlSpot(10, 100),
                            FlSpot(11, 110),
                            FlSpot(12, 120),
                          ],
                          isCurved: true,
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.blue,
                              Colors.white,
                            ],
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Colors.blue, Colors.white]),
                          ),
                          barWidth: 2,
                        ),
                      ],
                      titlesData: FlTitlesData(
                        // Mengatur label sumbu x dan y menjadi none
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                          // Tambahkan konfigurasi untuk sumbu y
                          // jika diperlukan
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                          // Tambahkan konfigurasi untuk sumbu x
                          // jika diperlukan
                        ),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    swapAnimationDuration: const Duration(milliseconds: 150),
                    swapAnimationCurve: Curves.linear,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
