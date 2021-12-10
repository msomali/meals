import 'package:flutter/material.dart';

import '../screen/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
    this.title,
    this.color,
    this.id, {
    Key? key,
  }) : super(key: key);

  final String title;
  final Color color;
  final String id;

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(id, title);
    //     },
    //   ),
    // );
    Navigator.of(ctx).pushNamed(
      // '/category-meals' //Instead of manual writing route name, alternative is below line,
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
