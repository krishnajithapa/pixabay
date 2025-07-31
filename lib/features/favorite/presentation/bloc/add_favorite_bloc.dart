import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay/features/favorite/data/models/image_model.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';
import 'package:pixabay/features/favorite/domain/usecases/add_favorite_usercase.dart';
import 'package:pixabay/features/favorite/domain/usecases/get_image_usecase.dart';
import 'package:pixabay/features/favorite/domain/usecases/remove_favorite_usecase.dart';

part 'add_favorite_event.dart';
part 'add_favorite_state.dart';

@injectable
class AddFavoriteBloc extends Bloc<FavoriteEvent, AddFavoriteState> {
  final GetImageUseCase _usecase;
  final AddFavoriteUsecase _addFavoriteUsecase;
  final RemoveFavoriteUsecase _removeFavoriteUsecase;
  AddFavoriteBloc(
    this._usecase,
    this._addFavoriteUsecase,
    this._removeFavoriteUsecase,
  ) : super(AddFavoriteInitial()) {
    on<SearchImages>(_onSearchImages);
    on<AddFavorite>(_onAddFavorite);
  }

  Future<void> _onSearchImages(
    SearchImages event,
    Emitter<AddFavoriteState> emit,
  ) async {
    final currentState = state;
    List<ImageEntity> oldImages = [];
    if (currentState is AddFavoriteLoaded && event.page > 1) {
      oldImages = currentState.images;
    }
    if (event.page == 1) {
      emit(AddFavoriteLoading());
    }
    try {
      final result = await _usecase.call(
        event.query,
        page: event.page,
        perPage: event.perPage,
      );
      result.fold(
        (failure) =>
            emit(AddFavoriteError(failure.errorMessage ?? 'Unknown error')),
        (images) {
          final allImages = event.page > 1 ? [...oldImages, ...images] : images;
          emit(AddFavoriteLoaded(images: allImages));
        },
      );
    } catch (e) {
      emit(AddFavoriteError(e.toString()));
    }
  }

  Future<void> _onAddFavorite(
    AddFavorite event,
    Emitter<AddFavoriteState> emit,
  ) async {
    final model = ImageModel(
      id: event.id,
      previewUrl: event.previewUrl,
      fullImageUrl: event.fullImageUrl,
      imageSize: event.imageSize,
      user: event.user,
    );
    final currentState = state;
    if (currentState is AddFavoriteLoaded) {
      final currentState = state as AddFavoriteLoaded;
      if (currentState.favoriteIds.contains(event.id)) {
        await _removeFavoriteUsecase.call(event.id);
        emit(
          currentState.copyWith(
            favoriteIds:
                currentState.favoriteIds.where((id) => id != event.id).toList(),
          ),
        );
      } else {
        // Add the image to the local data source
        await _addFavoriteUsecase.call(model);

        emit(
          currentState.copyWith(
            favoriteIds: [...currentState.favoriteIds, event.id],
          ),
        );
      }
    }
    // Optionally, you can emit a state or show a snackbar here
  }
}
