import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:faker/faker.dart';

Future<List<String>> getCategories() async {
  return Future.delayed(Duration(seconds: 1), () {
    List<String> items = [];
    for (int i = 0; i < 1000; i++) items.add(faker.lorem.words(3).join(' '));
    return items;
  });
}

Future<List<String>> getVenues() async {
  return Future.delayed(Duration(seconds: 1), () {
    List<String> items = [];
    for (int i = 0; i < 1000; i++) items.add(faker.lorem.words(2).join(' '));
    return items;
  });
}

Future<List<String>> getLanguages() async {
  String filePath = "assets/lottie/languages.json";
  String jsonString = await rootBundle.loadString(filePath);
  List<String> items = List<String>.from(json.decode(jsonString));
  return items;
}
