import 'package:injectable/injectable.dart';
import 'package:pixabay/features/favorite/domain/repositories/add_favorite_repository.dart';

@injectable
class RemoveFavoriteUsecase {
  final AddFavoriteRepository _homeRepository;
  RemoveFavoriteUsecase(this._homeRepository);

  Future<void> call(String id) async {
    await _homeRepository.removeFavorite(id);
  }
}
