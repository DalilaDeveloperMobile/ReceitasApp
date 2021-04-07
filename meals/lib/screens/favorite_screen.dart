import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
// Lista de Comidas de Favoritos
import '../models/meals.dart';

class FavoriteScreen extends StatelessWidget {
 // Lista de Comidas de Favoritos
  final List<Meal> favoriteMeals;
  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
    return Center(
      child: Text('Nenhuma refeição foi marcada como favorita!'),
    );
  }else{
    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (ctx, index){
        return MealItem(favoriteMeals[index]);
      }
    );
  }
  }
}