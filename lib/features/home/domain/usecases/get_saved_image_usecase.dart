import 'package:injectable/injectable.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';
import 'package:pixabay/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class GetSavedImagesUseCase {
  final HomeRepository repository;

  GetSavedImagesUseCase(this.repository);

  List<ImageEntity> call() {
    return repository.getSavedImages();
  }
}
