import 'package:injectable/injectable.dart';
import 'package:pixabay/core/network/typedef.dart';
import 'package:pixabay/features/favorite/data/datasources/remote/add_favorite_remote_data_source.dart';
import 'package:pixabay/features/favorite/data/models/image_model.dart';
import 'package:pixabay/features/favorite/domain/repositories/add_favorite_repository.dart';

@Injectable(as: AddFavoriteRepository)
class AddFavoriteRepositoryImpl extends AddFavoriteRepository {
  final AddFavoriteRemoteDataSource _remoteDataSource;
  AddFavoriteRepositoryImpl(this._remoteDataSource);
  @override
  ResultFuture<List<ImageModel>> getImages(
    String query, {
    int page = 1,
    int perPage = 20,
  }) {
    return _remoteDataSource.getImages(query, page: page, perPage: perPage);
  }
}
