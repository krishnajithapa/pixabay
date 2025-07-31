import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String id;
  final String previewUrl;
  final String fullImageUrl;
  final int imageSize; // size in bytes

  const ImageEntity({
    required this.id,
    required this.previewUrl,
    required this.fullImageUrl,
    required this.imageSize,
  });

  @override
  List<Object?> get props => [id, previewUrl, fullImageUrl, imageSize];
}
