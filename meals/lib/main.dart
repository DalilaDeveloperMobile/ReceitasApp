import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/settings_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/meal_detail_screen.dart';

import './Utils/app_routes.dart';
// Filtragem de dados importando o modelo meals.dart
import './models/meals.dart';
import './models/settings.dart';
import './data/dummy_data.dart';

void main() => runApp(MyApp());

// Filtragem de dados Colocando o MyApp para ser  Stateful.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// Guardar o estado no nível da aplicação.  
Settings settings = Settings();  
// Filtrando Dados passando o modelo para um metodo.
List<Meal> _availableMeals = DUMMY_MEALS;
// Lista de Comidas de Favoritos
List<Meal> _favoriteMeals = [];

// Filtrando Dados
void _filterMeals(Settings settings){
  setState(() {
    // Guardar o estado no nível da aplicação. 
    this.settings = settings;

    _availableMeals = DUMMY_MEALS.where((meal) {
     final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
     final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
     final filterVegan = settings.isVegan && !meal.isVegan;
     final filterVegetarian = settings.isVegetarian && !meal.isVegetarian; 
     return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
    }).toList();
  });
}
  // Lista de Comidas de Favoritos
  // Adicionar a Comida ou Remover
  void _toggleFavorite(Meal meal){
    setState(() {
      _favoriteMeals.contains(meal)
      ? _favoriteMeals.remove(meal)
      : _favoriteMeals.add(meal);
    });
  }
   // Lista de Comidas de Favoritos
  // Mostrar quando a Comida foi selecionada
  // como favorita, efeito do botão.
  bool _isFavorite(Meal meal){
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
           fontSize: 20,
           fontFamily: 'RobotoCondensed',
          ), 
        ),
      ),
      //home: CategoriesScreen(),
      routes: {
        // Lista de Comidas de Favoritos
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        // Filtrando Dados colocando o metodo em CategoriesMealsScreen(_availableMeals).
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(_availableMeals),
        // Lista de Comidas de Favoritos
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
      },
      // Esses metodos são chamados quando
      // as rotas não são encontradas
      // Retorna a Páginas de Erro 404
      // ou Retorno a Primeira Tela
      // 
     // onGenerateRoute: (settings){
     //   if(settings.name == '/alguma-coisa'){
     //     return null;
     //   } else if(settings.name == '/outra-coisa'){
     //     return null;
     //   }else{
     //     return MaterialPageRoute(
     //        builder: (_) {
     //          return CategoriesScreen();
     //        }    
     //     );
     //   }
     // }
      
     // Esses metodos são chamados quando
    // as rotas não são encontradas
    // Retorna a Páginas de Erro 404
    // ou Retorno a Primeira Tela
    // 
     //onUnknownRoute: (settings){
     //  return MaterialPageRoute(
     //    builder: (_) {
     //      return CategoriesScreen();
     //  },
     //  );
     //}
    );
  }
}
 
