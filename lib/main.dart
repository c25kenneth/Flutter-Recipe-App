import 'package:flutter/material.dart';
import 'package:recipeapp/recipe.dart';
import 'package:recipeapp/recipeapi.dart';
import 'package:recipeapp/recipecard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List <Recipe> _recipes; 
  bool _isLoading = true; 

  @override
  void initState() {
    super.initState();
    getRecipes(); 
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe(); 
    setState(() {
      _isLoading = false; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Food Recipe App! 😋🍉🥝🍅"),
         centerTitle: true,
       ),
       body: _isLoading ? Center(child: Text('Loading Recipes!'),) : ListView.builder(itemCount: _recipes.length, itemBuilder: (context, index) {
         return RecipeCard(title: _recipes[index].name, cookTime: _recipes[index].totalTime, rating: _recipes[index].totalTime.toString(), thumbnailUrl: _recipes[index].imageURL);
       })
    );
  }
}
