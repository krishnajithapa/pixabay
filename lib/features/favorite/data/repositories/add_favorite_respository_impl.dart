import 'package:injectable/injectable.dart';
import 'package:pixabay/core/network/typedef.dart';
import 'package:pixabay/features/favorite/data/datasources/favorite_local_data_source.dart';
import 'package:pixabay/features/favorite/data/datasources/remote/add_favorite_remote_data_source.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';
import 'package:pixabay/features/favorite/domain/repositories/add_favorite_repository.dart';

@Injectable(as: AddFavoriteRepository)
class AddFavoriteRepositoryImpl extends AddFavoriteRepository {
  final AddFavoriteRemoteDataSource _remoteDataSource;
  final FavoriteLocalDataSource _localDataSource;
  AddFavoriteRepositoryImpl(this._remoteDataSource, this._localDataSource);
  @override
  ResultFuture<List<ImageEntity>> getImages(
    String query, {
    int page = 1,
    int perPage = 20,
  }) {
    return _remoteDataSource.getImages(query, page: page, perPage: perPage);
  }

  @override
  Future<void> addFavorite(ImageEntity image) async {
    await _localDataSource.addFavorite(image);
  }

  @override
  Future<void> removeFavorite(String id) async {
    await _localDataSource.removeFavoriteById(id);
  }
}
