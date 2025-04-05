import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/favourite_model.dart';
import 'fav_event.dart';
import 'fav_state.dart';

class FavBloc extends Bloc<FavEvent, FavState> {
  final List<FavouriteModel> favorites = []; // temp list

  FavBloc() : super(InitialFavState()) {
    on<AddToFav>(addToFav);
    on<RemoveFromFav>(removeFromFav);
    on<FetchFavorites>(fetchFav);
    on<LogoutEvent>(clearFav);
  }

  void addToFav(AddToFav event, Emitter<FavState> emit) {
    try {
      if (!favorites.any((fav)=>fav.id ==event.fav.id)){
        favorites.add(event.fav);
      }
      emit(LoadedFavState(List.from(favorites)));
    } catch (e) {
      emit(ErrorFavState("error${e.toString()}"));
    }
  }

  void removeFromFav(RemoveFromFav event, Emitter<FavState> emit) {
    try {
      favorites.removeWhere((fav)=>fav.id ==event.itemId);
      emit(LoadedFavState(List.from(favorites)));
    } catch (e) {
      emit(ErrorFavState("error while remove${e.toString()}"));
    }
  }

  void fetchFav(FetchFavorites event, Emitter<FavState> emit) {
    try {
      emit(LoadedFavState(List.from(favorites)));
    } catch (e) {
      emit(ErrorFavState("error while fetch the fav data${e.toString()}"));
    }
  }


  void clearFav(LogoutEvent event, Emitter<FavState> emit) {
    favorites.clear();
    // it return the empty list
    emit(LoadedFavState(List.from(favorites)));
  }
}
