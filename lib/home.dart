import 'package:flutter/material.dart';
import 'views/recipe.card.dart';
import 'views/author.card.dart';
import 'views/explore.card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Color> colors = <Color>[
    Colors.white,
    Colors.amberAccent,
    Colors.orange
  ];

  static List<Widget> pages = <Widget>[
    const RecipeCard(),
    const AuthorCard(),
    const ExploreCard(),
  ];

  void _onItemTapped(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      // TODO: Show selected tab

      body: Center(child: pages[_selectedIndex]),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        selectedItemColor: colors[_selectedIndex],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Recipe',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.flag_outlined),
            activeIcon: Icon(Icons.flag_rounded),
            label: 'Authors',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_rounded),
            activeIcon: Icon(Icons.card_giftcard),
            label: 'Explore',
          ),
        ],
      ),
    );
  }
}
