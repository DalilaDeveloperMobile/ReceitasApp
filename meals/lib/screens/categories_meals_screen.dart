import 'package:flutter/material.dart';

import '../components/meal_item.dart';
import '../models/category.dart';
// Filtragem de dados importando o modelo meals.dart
import '../models/meals.dart';


class CategoriesMealsScreen extends StatelessWidget {

final List<Meal> meals;

const CategoriesMealsScreen(this.meals);

// Construtor
//  final Category category;
//  const CategoriesMealsScreen(this.category);

  @override
  Widget build(BuildContext context) {

// Navegação
final category = ModalRoute.of(context).settings.arguments as Category;
// Filtragem de dados passando meals.where
final categoryMeals = meals.where((meal) {
return meal.categories.contains(category.id);
}).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
        ),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index){
          return MealItem(categoryMeals[index]);
        }
      ),
    );
  }
}
