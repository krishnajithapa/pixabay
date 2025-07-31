import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';
import 'package:pixabay/features/favorite/domain/usecases/get_image_usecase.dart';

part 'add_favorite_event.dart';
part 'add_favorite_state.dart';

@injectable
class AddFavoriteBloc extends Bloc<HomeEvent, HomeState> {
  final GetImageUseCase _usecase;
  AddFavoriteBloc(this._usecase) : super(HomeInitial()) {
    on<SearchImages>(_onSearchImages);
  }

  Future<void> _onSearchImages(
    SearchImages event,
    Emitter<HomeState> emit,
  ) async {
    final currentState = state;
    List<ImageEntity> oldImages = [];
    if (currentState is HomeLoaded && event.page > 1) {
      oldImages = currentState.images;
    }
    if (event.page == 1) {
      emit(HomeLoading());
    }
    try {
      final result = await _usecase.call(
        event.query,
        page: event.page,
        perPage: event.perPage,
      );
      result.fold(
        (failure) => emit(HomeError(failure.errorMessage ?? 'Unknown error')),
        (images) {
          final allImages = event.page > 1 ? [...oldImages, ...images] : images;
          emit(HomeLoaded(images: allImages));
        },
      );
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
