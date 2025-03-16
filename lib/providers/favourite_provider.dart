import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tracker_app/modles/meals_model.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((item) => item.id != meal.id).toList();
      print('mealIsFavorite - state size = ${state.length}');
     print('state  = ${state}');

      return false;
    } else {
      state = [...state, meal];
      print('mealNotFavorite- state size = ${state.length}');
      print('state  = ${state}');


      return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
      return FavouriteMealsNotifier();
    });
