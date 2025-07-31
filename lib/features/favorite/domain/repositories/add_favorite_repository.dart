import 'package:pixabay/core/network/typedef.dart';
import 'package:pixabay/features/favorite/data/models/image_model.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';

abstract class AddFavoriteRepository {
  ResultFuture<List<ImageEntity>> getImages(
    String query, {
    int page = 1,
    int perPage = 20,
  });
  Future<void> addFavorite(ImageModel image);
  Future<void> removeFavorite(String id);
}
