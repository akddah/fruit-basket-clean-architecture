abstract class FavoriteEvent {}

class GetFavoriteEvent extends FavoriteEvent {}

class AddFavoriteEvent extends FavoriteEvent {
  final int productId;

  AddFavoriteEvent(this.productId);
}

class RemoveFromFavoriteEvent extends FavoriteEvent {
  final int productId;

  RemoveFromFavoriteEvent(this.productId);
}
