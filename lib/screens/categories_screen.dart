import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tracker_app/data/dummy_data.dart';
import 'package:tracker_app/modles/category_model.dart';
import 'package:tracker_app/modles/meals_model.dart';
import 'package:tracker_app/screens/meals_screen.dart';
import 'package:tracker_app/widgets/categories/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;
  void _selectedCategory(BuildContext context, CategoryModel category) {
    final filteredMeals =
        availableMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();

    //Navigator.push(context, route);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // availableCategories.map((category) => CategoryGridItem(category: category));
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectedCategory(context, category);
            },
          ),
      ],
    );
  }
}
