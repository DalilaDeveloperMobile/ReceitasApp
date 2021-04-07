import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';

import '../components/main_drawer.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
// Lista de Comidas de Favoritos
  final List<Meal> favoriteMeals;
// Lista de Comidas de Favoritos
  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // Lista de Comidas de Favoritos
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;
  // Lista de Comidas de Favoritos
  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoriesScreen(),
      },
      {// Lista de Comidas de Favoritos
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TabBar Inferior
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['title'],
        ),
      ),
      // Menu Sanduiche Drawer
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        // Aparecer a Tela quando o Icone for selecionado.
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        // Icone não Selecionado cor Branca.
        unselectedItemColor: Colors.white,
        // Icone Selecionado cor de Destaque.
        selectedItemColor: Theme.of(context).accentColor,
        // Alternar cor de Destaque quando Selecionar o Icone.
        currentIndex: _selectedScreenIndex,
        // Efeito de animação do Icone, só aparecer o nome
        // no Icone Selecionado.
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            // Efeito de animação do Icone, só aparecer o nome
            // no Icone Selecionado.
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            // Efeito de animação do Icone, só aparecer o nome
            // no Icone Selecionado.
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );

    // Adicionando TabBar na AppBar

    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Center(
    //         child: Text('Vamos Cozinhar?'),
    //       ),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Categorias',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'Favoritos',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         CategoriesScreen(),
    //         FavoriteScreen(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
