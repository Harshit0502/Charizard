// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favourites_bloc.dart';

@immutable
abstract class FavouritesEvent {}

class AddToFavourites implements FavouritesEvent {
  Pokemon pokemon;
  String uId;
  BuildContext context;
  AddToFavourites({
    required this.pokemon,
    required this.uId,
    required this.context
  });
}

class DeleteFavourites implements FavouritesEvent{
  Pokemon pokemon;
  DeleteFavourites({
    required this.pokemon,
  });
}