import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  String message = "";
  int status = 0;

  void connectAPI(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url);

    _data = (json.decode(hasilResponse.body))["data"];
    message = "Berhasil GET data";
    status = 200;
    notifyListeners();
  }
}
