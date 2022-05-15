class Recipe {
  final String imageURL; 
  final String name; 
  final double rating; 
  final String totalTime; 

  Recipe({required this.imageURL, required this.name, required this.rating, required this.totalTime});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      imageURL: json['images'][0]['hostedLargeUrl'] as String, 
      name: json['name'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String, 
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((recipe) {
      return Recipe.fromJson(recipe);
    }).toList(); 
  }

  @override
  String toString() {
    return "Recipe {imageUrl: $imageURL, name: $name, rating: $rating, totalTime: $totalTime}";
  }
}