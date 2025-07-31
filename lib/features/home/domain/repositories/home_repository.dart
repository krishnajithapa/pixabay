import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';

abstract class HomeRepository {
  List<ImageEntity> getSavedImages();
}
