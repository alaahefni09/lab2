import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/time_control.dart';
import 'package:lab2/widgets/recipe_area.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _controlPanel(context),
          const RecipeArea(),
        ],
      ),
    );
  }

  Widget _controlPanel(context, {double width = 320}) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 241, 178, 227),
      child: Column(
        children: [
          const Text("Receptsök"),
          const Text(
            "Hitta ett recept som passar genom att ändra inställningarna nedanför",
          ),
          Row(
            children: const [
              Text("Ingrediens:"),
              SizedBox(width: 10),
              IngredientControl(),
            ],
          ),
          Row(
            children: const [
              Text("Kök:"),
              SizedBox(width: 10),
              KitchenControl(),
            ],
          ),
          Column(
            children: const [
              Text("Svårighetsgrad"),
              DifficulyControl(),
            ],
          ),
          Column(
            children: const [
              Text("Maxpris:"),
              PriceControl(),
              Text("Maxtid:"),
              TimeControl(),
            ],
          ),
        ],
      ),
    );
  }
}