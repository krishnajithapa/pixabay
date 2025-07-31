part of "add_favorite_bloc.dart";

abstract class AddFavoriteState extends Equatable {
  const AddFavoriteState();
}

class AddFavoriteInitial extends AddFavoriteState {
  @override
  List<Object?> get props => [];
}

class AddFavoriteLoading extends AddFavoriteState {
  @override
  List<Object?> get props => [];
}

class AddFavoriteLoaded extends AddFavoriteState {
  final List<ImageEntity> images;
  final List<String> favoriteIds;
  const AddFavoriteLoaded({required this.images, this.favoriteIds = const []});

  AddFavoriteLoaded copyWith({
    List<ImageEntity>? images,
    List<String>? favoriteIds,
  }) {
    return AddFavoriteLoaded(
      images: images ?? this.images,
      favoriteIds: favoriteIds ?? this.favoriteIds,
    );
  }

  @override
  List<Object?> get props => [images, favoriteIds];
}

class AddFavoriteError extends AddFavoriteState {
  final String message;

  const AddFavoriteError(this.message);

  @override
  List<Object?> get props => [message];
}
