import '../../model/index.dart';

abstract class FavEvent {}

class FetchFavorites extends FavEvent {}

class AddToFav extends FavEvent {
  final FavouriteModel fav;
  AddToFav(this.fav);
}

class RemoveFromFav extends FavEvent {
  final String itemId;
  RemoveFromFav(this.itemId);
}

class LogoutEvent extends FavEvent {}

