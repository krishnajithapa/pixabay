import 'package:injectable/injectable.dart';
import 'package:pixabay/features/favorite/data/models/image_model.dart';
import 'package:pixabay/features/favorite/domain/repositories/add_favorite_repository.dart';

@injectable
class AddFavoriteUsecase {
  final AddFavoriteRepository _homeRepository;
  AddFavoriteUsecase(this._homeRepository);

  Future<void> call(ImageModel image) async {
    await _homeRepository.addFavorite(image);
  }
}
