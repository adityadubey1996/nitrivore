import 'dart:convert';

import 'package:nutrivine/models/pin_code_state.dart';

class PinCodeApi {
  Future<List<dynamic>> getAreaDetailsFromPinCode(int pinCode) async {
    return [];
  }
}

class Api {
  Future<String> makeRequest(String url, Map<String, dynamic> headers,
      Map<String, dynamic> payload) async {
    var body = jsonEncode(payload);

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    switch (response.statusCode) {
      case 200:
        // If the server returns a 200 OK response, parse the JSON.
        return 'Success: ${response.body}';
      case 201:
        // Handle a 201 CREATED response.
        return 'Created: ${response.body}';
      case 401:
        // Handle a 401 UNAUTHORIZED response.
        return 'Unauthorized: ${response.body}';
      case 500:
        // Handle a 500 INTERNAL SERVER ERROR response.
        return 'Server error: ${response.body}';
      default:
        // If the server returns an unexpected status code, throw an error.
        throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
