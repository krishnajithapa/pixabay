import 'package:injectable/injectable.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';
import 'package:pixabay/features/home/data/datasources/local/home_local_data_source.dart';
import 'package:pixabay/features/home/domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl(this.localDataSource);

  @override
  List<ImageEntity> getSavedImages() {
    final models = localDataSource.getSavedImages();
    return models.map((model) => model.toEntity()).toList();
  }
}
