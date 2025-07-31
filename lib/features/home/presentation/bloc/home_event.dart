// home_bloc.dart
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class FetchSavedImages extends HomeEvent {}

class RemoveFavoriteImage extends HomeEvent {
  final String imageId;

  const RemoveFavoriteImage(this.imageId);

  @override
  List<Object?> get props => [imageId];
}
