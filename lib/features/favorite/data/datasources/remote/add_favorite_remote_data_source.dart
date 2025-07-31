import 'package:injectable/injectable.dart';
import 'package:pixabay/core/constants/app_constants.dart';
import 'package:pixabay/core/network/dio_client.dart';
import 'package:pixabay/core/network/dio_extension.dart';
import 'package:pixabay/core/network/typedef.dart';
import 'package:pixabay/features/favorite/data/models/image_model.dart';

@injectable
class AddFavoriteRemoteDataSource {
  final DioClient _dioClient;
  AddFavoriteRemoteDataSource(this._dioClient);
  ResultFuture<List<ImageModel>> getImages(
    String query, {
    int page = 1,
    int perPage = 20,
  }) {
    return _dioClient.safeGet(
      'https://pixabay.com/api/',
      queryParameters: {
        'key': AppConstants.apiKey,
        'q': query,
        'page': page,
        'per_page': perPage,
      },
      mapper: (json) {
        final hits = json['hits'] as List?;
        if (hits == null) return [];
        return hits.map((e) => ImageModel.fromJson(e)).toList();
      },
    );
  }
}
