part of "add_favorite_bloc.dart";

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class SearchImages extends FavoriteEvent {
  final String query;
  final int page;
  final int perPage;

  const SearchImages(this.query, {this.page = 1, this.perPage = 20});

  @override
  List<Object?> get props => [query, page, perPage];
}

class AddFavorite extends FavoriteEvent {
  final String id;
  final String previewUrl;
  final String fullImageUrl;
  final int imageSize;
  final String user;

  const AddFavorite({
    required this.id,
    required this.previewUrl,
    required this.fullImageUrl,
    required this.imageSize,
    required this.user,
  });

  @override
  List<Object?> get props => [id, previewUrl, fullImageUrl];
}
