
import 'dart:convert';

import 'package:boilerplate/model/entity/content.dart';
import 'package:boilerplate/model/mixin/network_basic_operations_mixin.dart';
import 'package:flutter/material.dart';

// ignore_for_file: overridden_fields
class ContentModel with NetworkBasicOperationsMixin {
  // Singleton implementation
  static final ContentModel _singleton =
      ContentModel._internal(); // singleton constructor
  ContentModel._internal(); // singleton internal init
  factory ContentModel() => _singleton; // singleton factory

  // Mixin overrites example
  @override
  String root = "6284fd4e3060bbd34742af4d.mockapi.io";
  @override
  String branchPath = "content";

  // Downloaded data
  List<Content> contents = [];

  // Get content that was already downloaded
  // If there is none, make sure to call updateContent() first
  List<Content> getContent() {
    return contents;
  }

  // Get content from databaseeven if already have it downloaded
  // Use this when is known that there is new data
  Future<void> updateContent() async {
    // Get data
    final response = await get();
    if (response == null) return;
    // Try to parse received data
    try {
      final jsonList = json.decode(response.body);
      List<Content> jsonContents =
          List<Content>.from(jsonList.map((p) => Content.fromJson(p)));
      contents = jsonContents;
    } catch (e, stacktrace) {
      debugPrint("Error parsing JSON Content list: $e");
      debugPrint("Stack trace: $stacktrace");
    }
  }
}
