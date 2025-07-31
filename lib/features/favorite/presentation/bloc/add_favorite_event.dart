part of "add_favorite_bloc.dart";

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class SearchImages extends HomeEvent {
  final String query;
  final int page;
  final int perPage;

  const SearchImages(this.query, {this.page = 1, this.perPage = 20});

  @override
  List<Object?> get props => [query, page, perPage];
}
