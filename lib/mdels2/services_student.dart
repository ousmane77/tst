import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:testt/ecom_model/ecom_model.dart';

Future<String> loadJson() async{
  return await rootBundle.loadString("assets/ecommerce/ecommerce.json");
}

Future LoadCursus() async{
  final res = await loadJson();
  Iterable list = json.decode(res);

  List<Categorie> arr = list.map((f) => Categorie.fromJson(f)).toList();
  return arr;
}