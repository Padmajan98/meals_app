import 'package:meals_app/model/meal.dart';
import 'package:riverpod/riverpod.dart';


class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier(): super([]);
  
  bool toggleMealFavoriteStatus(Meal meal){
    final mealsIsFavorite = state.contains(meal);

    if (mealsIsFavorite){
      state = state.where((m) => m.id !=meal.id).toList(); 
      return false;
    }else{
      state = [...state,meal];
      return true;
    }
  }
}
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});