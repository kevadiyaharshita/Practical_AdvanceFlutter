import 'package:flutter/material.dart';
import 'package:practical_advanceflutter/modal/Recipe_Modal.dart';

import '../helpers/api_helper.dart';

class RecipeController extends ChangeNotifier {
  RecipeModal? rm;

  Future<RecipeModal?> getRecipe({String query = 'soup'}) async {
    rm = await ApiHelper.apiHelper.getRecipies(query: query);
    notifyListeners();
    return rm;
  }

  RecipeController() {
    getRecipe();
  }
}
