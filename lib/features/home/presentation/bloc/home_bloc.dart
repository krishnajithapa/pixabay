// home_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';
import 'package:pixabay/features/favorite/domain/usecases/remove_favorite_usecase.dart';
import 'package:pixabay/features/home/domain/usecases/get_saved_image_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSavedImagesUseCase _getSavedImagesUseCase;
  final RemoveFavoriteUsecase _removeFavoriteUseCase;

  HomeBloc(this._getSavedImagesUseCase, this._removeFavoriteUseCase)
    : super(HomeInitial()) {
    on<FetchSavedImages>(_onFetchSavedImages);
    on<RemoveFavoriteImage>(_onRemoveFavoriteImage);
  }

  void _onFetchSavedImages(FetchSavedImages event, Emitter<HomeState> emit) {
    emit(HomeLoading());
    try {
      final images = _getSavedImagesUseCase.call();
      emit(HomeLoaded(images));
    } catch (e) {
      emit(HomeError('Failed to load saved images'));
    }
  }

  _onRemoveFavoriteImage(RemoveFavoriteImage event, Emitter<HomeState> emit) {
    try {
      _removeFavoriteUseCase.call(event.imageId);
      final currentState = state;
      if (currentState is HomeLoaded) {
        final updatedImages =
            currentState.images
                .where((image) => image.id != event.imageId)
                .toList();
        emit(HomeLoaded(updatedImages));
      }
    } catch (e) {
      emit(HomeError('Failed to remove favorite image'));
    }
  }
}
