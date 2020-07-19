import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class RequestUtil {
  Future<Map<String, dynamic>> get(String url,
      {Map<String, String> header}) async {
    var _resp = await http.get(url, headers: header);

    if (_resp.statusCode == 200) {
      return jsonDecode(_resp.body);
    }
    Map<String, dynamic> list = new Map<String, dynamic>();
    return list;
  }
}
