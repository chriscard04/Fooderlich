import 'package:flutter/material.dart';
import '../fooderlich_theme.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key}) : super(key: key);

  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Text(
            category,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Positioned(
            top: 20,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.45),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: Text(
              chef,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints.expand(
        width: 350,
        height: 450,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/mag1.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}
