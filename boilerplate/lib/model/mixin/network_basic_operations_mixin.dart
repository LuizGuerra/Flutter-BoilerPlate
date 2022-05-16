import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

mixin NetworkBasicOperationsMixin {
  Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Charset': 'utf-8',
  };
  static const Map<String, Object> _defaultEmptyBody = {};

  /// URI api address
  String root = "google.com";

  /// URI volunteer string path
  String branchPath = "";

  /// Get data from server
  /// additionalPath: extra data necessary to access functionality
  /// expectedStatusCode: expected response status code
  /// Returns: HTML Response if data exists, otherwise, null.
  Future<Response?> get(
      {String additionalPath = "",
      int expectedStatusCode = 200,
      Map<String, dynamic>? queryParameters}) async {
    final String path = _buildPath([branchPath, additionalPath]);
    final Uri uri = Uri.http(root, path, queryParameters);
    try {
      final response = await http.get(uri, headers: defaultHeaders);
      if (response.statusCode == expectedStatusCode) {
        return response;
      } else {
        throw Exception(
            "GET at ${uri.toString()} received bad status code: ${response.statusCode}, expected: $expectedStatusCode.");
      }
    } on Exception catch (e, stacktrace) {
      debugPrint("Error fetching data:\n$e");
      debugPrint("Stack trace: $stacktrace");
    }
    return null;
  }

  /// Get data from server
  /// additionalPath: extra data necessary to access functionality
  /// expectedStatusCode: expected response status code
  /// body: required input with a json dictionary to be sent
  /// Returns: HTML Response if data exists, otherwise, null.
  Future<Response?> put(
      {String additionalPath = "",
      Map<String, dynamic> body = _defaultEmptyBody,
      int expectedStatusCode = 200}) async {
    final String path = _buildPath([branchPath, additionalPath]);
    final Uri uri = Uri.http(root, path);
    try {
      final response =
          await http.put(uri, headers: defaultHeaders, body: jsonEncode(body));
      if (response.statusCode == expectedStatusCode) {
        return response;
      } else {
        throw Exception(
            "PUT at ${uri.toString()} received bad status code: ${response.statusCode}, expected: $expectedStatusCode.");
      }
    } on Exception catch (e, stacktrace) {
      debugPrint("Error fetching data:\n$e");
      debugPrint("Stack trace: $stacktrace");
    }
    return null;
  }

  /// Get data from server
  /// additionalPath: extra data necessary to access functionality
  /// body: required input with a json dictionary to be sent
  /// expectedStatusCode: expected response status code
  /// Returns: HTML Response if data exists, otherwise, null.
  Future<Response?> post(
      {String additionalPath = "",
      Map<String, dynamic> body = _defaultEmptyBody,
      int expectedStatusCode = 200}) async {
    final String path = _buildPath([branchPath, additionalPath]);
    final Uri uri = Uri.http(root, path);
    try {
      final response =
          await http.post(uri, headers: defaultHeaders, body: jsonEncode(body));
      if (response.statusCode == expectedStatusCode) {
        return response;
      } else {
        throw Exception(
            "POST at ${uri.toString()} received bad status code: ${response.statusCode}, expected: $expectedStatusCode.");
      }
    } on Exception catch (e, stacktrace) {
      debugPrint("Error fetching data:\n$e");
      debugPrint("Stack trace: $stacktrace");
    }
    return null;
  }

  Future<Response?> postFile(
      {String additionalPath = "",
      String body = "",
      int expectedStatusCode = 200}) async {
    final String path = _buildPath([branchPath, additionalPath]);
    final Uri uri = Uri.http(root, path);
    try {
      final response =
          await http.post(uri, headers: defaultHeaders, body: body );
      if (response.statusCode == expectedStatusCode) {
        return response;
      } else {
        throw Exception(
            "POST at ${uri.toString()} received bad status code: ${response.statusCode}, expected: $expectedStatusCode.");
      }
    } on Exception catch (e, stacktrace) {
      debugPrint("Error fetching data:\n$e");
      debugPrint("Stack trace: $stacktrace");
    }
    return null;
  }

  /// Get data from server
  /// additionalPath: extra data necessary to access functionality
  /// body: required input with a json dictionary to be sent
  /// expectedStatusCode: expected response status code
  /// Returns: HTML Response if data exists, otherwise, null.
  Future<Response?> delete(
      {String additionalPath = "",
      Map<String, dynamic> body = _defaultEmptyBody,
      int expectedStatusCode = 200}) async {
    final String path = _buildPath([branchPath, additionalPath]);
    final Uri uri = Uri.http(root, path);
    try {
      final response = await http.delete(uri,
          headers: defaultHeaders, body: jsonEncode(body));
      if (response.statusCode == expectedStatusCode) {
        return response;
      } else {
        throw Exception(
            "DELETE at ${uri.toString()} received bad status code: ${response.statusCode}, expected: $expectedStatusCode.");
      }
    } on Exception catch (e, stacktrace) {
      debugPrint("Error fetching data:\n$e");
      debugPrint("Stack trace: $stacktrace");
    }
    return null;
  }

  String _buildPath(List<String> paths) {
    var filteredList = paths.where((str) => str.isNotEmpty);
    if (filteredList.isEmpty) {
      return "";
    }
    return filteredList.reduce((a, b) => "$a/$b");
  }
}
