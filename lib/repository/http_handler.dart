import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiResponse<T> {
  Status status;
  T? data;
  String? error;

  ApiResponse(this.status, {this.data, this.error});
}

enum Status { loading, completed, error }

class HttpHelper {
  static Future<ApiResponse<T>> handleResponse<T>(http.Response response, T Function(dynamic) fromJson) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodedData = json.decode(response.body);
      final data = fromJson(decodedData);
      return ApiResponse(Status.completed, data: data);
    } else {
      return ApiResponse(Status.error, error: 'Failed with status code ${response.statusCode}');
    }
  }
}