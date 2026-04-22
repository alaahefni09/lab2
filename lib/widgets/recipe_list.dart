import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/widgets/recipe_list_item.dart';
import 'package:lab2/ui_controller.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeHandler = context.watch<RecipeHandler>();
    var recipes = recipeHandler.bestMatches;

    var uiController = Provider.of<UIController>(context, listen: false);

    if (recipes.isEmpty) {
      return const Center(
        child: Text("No recipes loaded (yet?)"),
      );
    }

    return ListView(
      children: [
        for (var recipe in recipes)
          RecipeListItem(
            recipe,
            onTap: () {
              uiController.selectRecipe(recipe);
            },
          ),
      ],
    );
  }
}