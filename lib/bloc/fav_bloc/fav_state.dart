import '../../model/index.dart';

abstract class FavState{}

final class InitialFavState extends FavState{}

final class LoadingFavState extends FavState{}

final class LoadedFavState extends FavState{
  final List<FavouriteModel> favoriteList;
  LoadedFavState(this.favoriteList);
}

final class ErrorFavState extends FavState{
  final String errorMsg;
  ErrorFavState(this.errorMsg);
}