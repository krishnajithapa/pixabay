part of "add_favorite_bloc.dart";

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  final List<ImageEntity> images;

  const HomeLoaded({required this.images});

  HomeLoaded copyWith({List<ImageEntity>? images}) {
    return HomeLoaded(images: images ?? this.images);
  }

  @override
  List<Object?> get props => [images];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
