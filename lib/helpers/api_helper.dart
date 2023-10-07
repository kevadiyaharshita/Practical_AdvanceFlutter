import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practical_advanceflutter/modal/Recipe_Modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();
  String api =
      'https://yummly2.p.rapidapi.com/feeds/auto-complete?q=chicken soup';

  Future<RecipeModal?> getRecipies({String query = 'soup'}) async {
    http.Response response = await http.get(Uri.parse(api), headers: {
      'X-RapidAPI-Key': '18b49b4032msh492cefc88131c04p13be01jsn87d9c552bed4',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
    });
    log('${response.statusCode}');
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      // List allData = data['ingredients'];
      RecipeModal rm = RecipeModal.fromMap(data: data);

      return rm;
    } else {
      return null;
    }
  }
}
