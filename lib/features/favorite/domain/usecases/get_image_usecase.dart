import 'package:injectable/injectable.dart';
import 'package:pixabay/core/network/typedef.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';
import 'package:pixabay/features/favorite/domain/repositories/add_favorite_repository.dart';

@injectable
class GetImageUseCase {
  final AddFavoriteRepository _homeRepository;
  GetImageUseCase(this._homeRepository);

  ResultFuture<List<ImageEntity>> call(
    String query, {
    int page = 1,
    int perPage = 20,
  }) async {
    return await _homeRepository.getImages(query, page: page, perPage: perPage);
  }
}
