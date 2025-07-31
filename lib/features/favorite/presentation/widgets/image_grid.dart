import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixabay/core/utils/ui_helper.dart';
import 'package:pixabay/features/favorite/domain/entities/image_entity.dart';

class ImageGrid extends StatelessWidget {
  final List<ImageEntity> images;
  final ScrollController controller;

  const ImageGrid({super.key, required this.images, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.0,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(UIHelper.cornerRadiusMedium),
          child: CachedNetworkImage(
            imageUrl: image.previewUrl,
            fit: BoxFit.cover,
            placeholder:
                (context, url) => const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      },
    );
  }
}
