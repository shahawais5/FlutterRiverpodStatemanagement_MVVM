import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApiRepo {
  Future<http.Response?> postRequestHTTP(
      BuildContext context,
      String url, {
        required Map<String, dynamic> data,
        String? bearerToken,
      }) async {
    debugPrint("POST Request → $url");
    debugPrint("Payload → $data");

    // Retrieve stored token if none provided
    // bearerToken ??= await LocalDb.getToken();
    debugPrint("Bearer Token → $bearerToken");

    final jsonData = jsonEncode(data);

    final headers = {
      if (bearerToken != null)
        HttpHeaders.authorizationHeader: "Bearer $bearerToken",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "*/*",
      'x-org-name': "cloud",
      'x-app-name': "main",
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonData,
        headers: headers,
      );
      return response;
    } catch (e) {
      debugPrint("HTTP Error: $e");
      showToast(message: 'Network error', context: context);
      return null;
    }
  }

  void handleError(http.Response? response, BuildContext context) {
    if (response == null) {
      showToast(message: 'An unexpected error occurred', context: context);
      return;
    }

    debugPrint("Error Status: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    try {
      final json = jsonDecode(response.body);
      final message = json['message'] ?? 'An error occurred';
      final detailMessage = json['detailMessage'] ?? '';

      switch (response.statusCode) {
        case 422:
          showToast(message: message, context: context);
          break;
        case 401:
          showToast(message: 'Bad credentials!', context: context);
          break;
        case 404:
          showToast(message: '404 Not Found', context: context);
          break;
        default:
          if (json['status'] == 'failed') {
            showToast(message: message, context: context);
            if (detailMessage.isNotEmpty) {
              showToast(message: 'Detail: $detailMessage', context: context);
            }
          } else {
            showToast(message: 'Error: ${response.body}', context: context);
          }
      }
    } catch (e) {
      showToast(message: 'Error parsing response: ${response.body}', context: context);
    }
  }

  void showToast({required String message, required BuildContext context}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.blue,
      fontSize: 16,
    );
  }
}
