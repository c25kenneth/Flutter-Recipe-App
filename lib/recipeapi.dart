import 'dart:convert';
import 'package:recipeapp/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi{

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list', {"limit": "15", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '**********************',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      "useQueryString" : "true"
    }); 

    Map data = jsonDecode(response.body); 
    List _temporaryRecipes = []; 

    for (var i in data['feed']) {
      _temporaryRecipes.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temporaryRecipes); 
  }
}
