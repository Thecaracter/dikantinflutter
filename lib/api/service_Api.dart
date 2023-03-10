import 'dart:convert';

import 'package:dikantin/model/Penjualan_mode.dart';
import 'package:dikantin/model/Riwayat_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dikantin/model/Menu_model.dart';
import 'package:dikantin/model/User_model.dart';

class AuthService {
  static const String apiUrl = 'http://10.10.0.61/api/login';

  Future<void> login(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('user')) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(
              'user_token',
              json.encode(data['user']['name'],
                  toEncodable: (value) => value.toString()));
          prefs.setString(
              'email_token',
              json.encode(data['user']['email'],
                  toEncodable: (value) => value.toString()));
          prefs.setString(
              'id_kantin',
              json.encode(data['user']['id_kantin'],
                  toEncodable: (value) => value.toString()));
          prefs.setString(
              'foto',
              json.encode(data['user']['foto'],
                  toEncodable: (value) => value.toString()));
        } else if (data.containsKey('error')) {
          throw Exception(data['error']);
        } else {
          throw Exception('Gagal login');
        }
      } else {
        throw Exception('Gagal login');
      }
    } catch (e) {
      throw Exception('Gagal login');
    }
  }
}

class ServiceApi {
  final secureStorage = FlutterSecureStorage();
  String? _idKantin;
  Future<List<MenuApi>> getMenu() async {
    final prefs = await SharedPreferences.getInstance();

    _idKantin = prefs.getString('id_kantin');

    final response = await http.post(
      Uri.parse('http://10.10.0.61/api/apimenu'),
      body: {'id_kantin': _idKantin?.toString() ?? ''},
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((e) => MenuApi.fromJson(e)).toList();
    } else {
      throw Exception('Error fetching menu');
    }
  }

  Future<void> saveIdKantin(int idKantin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'id_kantin',
      idKantin.toString(),
    );
  }
}

class ServiceApiPenjualan {
  final secureStorage = FlutterSecureStorage();
  String? _idKantin;
  Future<List<ModelPenjualan>> getPenjualan() async {
    final prefs = await SharedPreferences.getInstance();

    _idKantin = prefs.getString('id_kantin');

    final response = await http.post(
      Uri.parse('http://10.10.0.61/api/api-penjualan'),
      body: {'id_kantin': _idKantin?.toString() ?? ''},
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((e) => ModelPenjualan.fromJson(e)).toList();
    } else {
      throw Exception('Error fetching menu');
    }
  }

  Future<void> saveIdKantin(int idKantin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'id_kantin',
      idKantin.toString(),
    );
  }
}

class ServiceApiRiwayat {
  final secureStorage = FlutterSecureStorage();
  String? _idKantin;
  Future<List<ModelRiwayat>> getriwayat() async {
    final prefs = await SharedPreferences.getInstance();

    _idKantin = prefs.getString('id_kantin');

    final response = await http.post(
      Uri.parse('http://10.10.0.61/api/api-riwayat'),
      body: {'id_kantin': _idKantin?.toString() ?? ''},
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((e) => ModelRiwayat.fromJson(e)).toList();
    } else {
      throw Exception('Error fetching menu');
    }
  }

  Future<void> saveIdKantin(int idKantin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'id_kantin',
      idKantin.toString(),
    );
  }
}

class UpdatePenjualanService {
  Future<void> updateStatusPenjualan(String idDetail) async {
    final url = Uri.parse('http://10.10.0.61/api/updatestatus');
    final response = await http.put(
      url,
      body: {
        'id_detail': idDetail,
      },
    );
    if (response.statusCode == 200) {
      // Berhasil mengubah status penjualan
      print('Berhasil mengubah status penjualan');
    } else {
      // Gagal mengubah status penjualan
      print('Gagal mengubah status penjualan');
    }
  }
}
