import 'package:objectbox/objectbox.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';

@Entity()
class ObjectBoxImageModel {
  @Id()
  int obxId = 0;

  String id;
  String previewUrl;
  String fullImageUrl;
  int imageSize;
  String user;

  ObjectBoxImageModel({
    this.obxId = 0,
    required this.id,
    required this.previewUrl,
    required this.fullImageUrl,
    required this.imageSize,
    required this.user,
  });

  factory ObjectBoxImageModel.fromEntity(ImageEntity model) {
    return ObjectBoxImageModel(
      id: model.id,
      previewUrl: model.previewUrl,
      fullImageUrl: model.fullImageUrl,
      imageSize: model.imageSize,
      user: model.user,
    );
  }

  ImageEntity toEntity() {
    return ImageEntity(
      id: id,
      previewUrl: previewUrl,
      fullImageUrl: fullImageUrl,
      imageSize: imageSize,
      user: user,
    );
  }
}
