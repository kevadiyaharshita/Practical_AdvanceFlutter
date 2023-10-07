class RecipeModal {
  List ingredients;

  RecipeModal({required this.ingredients});

  factory RecipeModal.fromMap({required Map data}) {
    return RecipeModal(ingredients: data['ingredients']);
  }
}
