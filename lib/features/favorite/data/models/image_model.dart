import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';

class ImageModel extends ImageEntity {
  const ImageModel({
    required super.id,
    required super.previewUrl,
    required super.fullImageUrl,
    required super.imageSize,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'].toString(),
      previewUrl: json['previewURL'] ?? '',
      fullImageUrl: json['largeImageURL'] ?? '',
      imageSize:
          json['imageSize'] is int
              ? json['imageSize']
              : int.tryParse(json['imageSize']?.toString() ?? '') ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'previewURL': previewUrl,
      'largeImageURL': fullImageUrl,
      'imageSize': imageSize,
    };
  }
}
